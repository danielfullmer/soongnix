{ cc_defaults, cc_library_headers }:
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

libese-app-headers = cc_library_headers {
    name = "libese-app-headers";
    host_supported = true;
    proprietary = true;
    export_include_dirs = ["include"];
    visibility = ["//external/libese:__subpackages__"];
};

libese-app-defaults = cc_defaults {
    name = "libese-app-defaults";
    proprietary = true;
    defaults = ["libese-defaults"];

    header_libs = ["libese-app-headers"];
    export_header_lib_headers = ["libese-app-headers"];

    #  Ensure that only explicitly exported symbols are visible.
    cflags = ["-fvisibility=internal"];
};

subdirs = [
    "boot"
    "weaver"
];

in { inherit libese-app-defaults libese-app-headers; }
