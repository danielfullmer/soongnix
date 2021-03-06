{ cc_library_host_shared }:
let

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

libhidl-gen-host-utils = cc_library_host_shared {
    name = "libhidl-gen-host-utils";
    defaults = ["hidl-gen-defaults"];
    srcs = [
        "Formatter.cpp"
        "StringHelper.cpp"
    ];
    shared_libs = [
        "libbase"
    ];

    local_include_dirs = ["include/hidl-util"];
    export_include_dirs = ["include"];
};

in { inherit libhidl-gen-host-utils; }
