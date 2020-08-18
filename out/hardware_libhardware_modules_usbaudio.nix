{ cc_library_shared }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

"audio.usb.default" = cc_library_shared {
    name = "audio.usb.default";
    relative_install_path = "hw";
    vendor = true;
    srcs = ["audio_hal.c"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libtinyalsa"
        "libaudioutils"
        "libalsautils"
    ];
    cflags = ["-Wno-unused-parameter"];
    header_libs = ["libhardware_headers"];
};

in { inherit "audio.usb.default"; }
