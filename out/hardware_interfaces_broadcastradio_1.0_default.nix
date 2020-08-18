{ cc_library_shared }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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
#

"android.hardware.broadcastradio@1.0-impl" = cc_library_shared {
    name = "android.hardware.broadcastradio@1.0-impl";
    vendor = true;
    relative_install_path = "hw";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "BroadcastRadio.cpp"
        "BroadcastRadioFactory.cpp"
        "Tuner.cpp"
        "Utils.cpp"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "liblog"
        "libhardware"
        "android.hardware.broadcastradio@1.0"
        "libradio_metadata"
    ];
};

in { inherit "android.hardware.broadcastradio@1.0-impl"; }