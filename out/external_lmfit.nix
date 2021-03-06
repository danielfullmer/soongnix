{ cc_library_static }:
let

#  Copyright 2017 The Android Open Source Project
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

lmfit = cc_library_static {
    name = "lmfit";
    vendor = true;

    srcs = [
        "lib/lmcurve.c"
        "lib/lmcurve_tyd.c"
        "lib/lmmin.c"
    ];
    cflags = [
        "-W"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    export_include_dirs = ["lib"];
};

in { inherit lmfit; }
