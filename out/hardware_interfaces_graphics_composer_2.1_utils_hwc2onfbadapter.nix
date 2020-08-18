{ cc_library_shared }:
let

#  Copyright 2010 The Android Open Source Project
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

libhwc2onfbadapter = cc_library_shared {
    name = "libhwc2onfbadapter";
    vendor = true;

    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    srcs = [
        "HWC2OnFbAdapter.cpp"
    ];

    header_libs = ["libhardware_headers"];
    shared_libs = [
        "liblog"
        "libsync"
    ];
    export_include_dirs = ["include"];
};

in { inherit libhwc2onfbadapter; }
