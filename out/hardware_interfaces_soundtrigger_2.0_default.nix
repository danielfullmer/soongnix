{ cc_library_shared }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

"android.hardware.soundtrigger@2.0-core" = cc_library_shared {
    name = "android.hardware.soundtrigger@2.0-core";
    defaults = ["hidl_defaults"];
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "SoundTriggerHalImpl.cpp"
    ];

    export_include_dirs = ["."];

    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "libhardware"
        "android.hardware.soundtrigger@2.0"
        "android.hardware.audio.common@2.0"
    ];

    header_libs = [
        "libaudio_system_headers"
        "libhardware_headers"
    ];
};

in { inherit "android.hardware.soundtrigger@2.0-core"; }