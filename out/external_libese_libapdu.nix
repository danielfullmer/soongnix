{ cc_defaults, cc_library_static }:
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

subdirs = ["tests"];

libapdu_defaults = cc_defaults {
    name = "libapdu_defaults";
    proprietary = true;
    cflags = [
        "-pedantic"
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

libapdu = cc_library_static {
    name = "libapdu";
    defaults = ["libapdu_defaults"];
    srcs = [
        "apdu.cpp"
    ];
    export_include_dirs = ["include"];
};

in { inherit libapdu libapdu_defaults; }
