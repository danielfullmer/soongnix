{ cc_binary, cc_defaults, cc_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

idlcli-defaults = cc_defaults {
    name = "idlcli-defaults";
    shared_libs = [
        "android.hardware.vibrator-ndk_platform"
        "android.hardware.vibrator@1.0"
        "android.hardware.vibrator@1.1"
        "android.hardware.vibrator@1.2"
        "android.hardware.vibrator@1.3"
        "libbase"
        "libbinder_ndk"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-DLOG_TAG=\"idlcli\""
    ];
    vendor_available = true;
};

libidlcli = cc_library {
    name = "libidlcli";
    defaults = ["idlcli-defaults"];
    srcs = [
        "CommandVibrator.cpp"
        "vibrator/CommandCompose.cpp"
        "vibrator/CommandGetCapabilities.cpp"
        "vibrator/CommandGetCompositionDelayMax.cpp"
        "vibrator/CommandGetCompositionSizeMax.cpp"
        "vibrator/CommandOff.cpp"
        "vibrator/CommandOn.cpp"
        "vibrator/CommandPerform.cpp"
        "vibrator/CommandSetAmplitude.cpp"
        "vibrator/CommandSetExternalControl.cpp"
        "vibrator/CommandSupportsAmplitudeControl.cpp"
        "vibrator/CommandSupportsExternalControl.cpp"
    ];
    visibility = [":__subpackages__"];
};

idlcli = cc_binary {
    name = "idlcli";
    defaults = ["idlcli-defaults"];
    srcs = ["main.cpp"];
    whole_static_libs = ["libidlcli"];
};

in { inherit idlcli idlcli-defaults libidlcli; }
