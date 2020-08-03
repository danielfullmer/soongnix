{ cc_library_shared }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

libalsautils = cc_library_shared {
    name = "libalsautils";
    vendor = true;
    srcs = [
        "alsa_device_profile.c"
        "alsa_device_proxy.c"
        "alsa_logging.c"
        "alsa_format.c"
    ];
    export_include_dirs = ["include"];
    header_libs = [
        "libaudio_system_headers"
    ];
    export_header_lib_headers = [
        "libaudio_system_headers"
    ];
    shared_libs = [
        "liblog"
        "libcutils"
        "libtinyalsa"
        "libaudioutils"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-unused-parameter"
    ];
};

in { inherit libalsautils; }
