{ cc_library_shared }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

"power.default" = cc_library_shared {
    name = "power.default";
    relative_install_path = "hw";
    proprietary = true;
    srcs = ["power.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    header_libs = [
        "libhardware_headers"
        "libutils_headers"
    ];
    shared_libs = ["liblog"];
};

in { inherit "power.default"; }
