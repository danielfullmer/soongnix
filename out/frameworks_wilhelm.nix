{ cc_library_headers, ndk_headers, ndk_library }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

libOpenMAXAL_headers = ndk_headers {
    name = "libOpenMAXAL_headers";
    from = "include";
    to = "";
    srcs = ["include/OMXAL/**/*.h"]; #  All headers in all subdirs.
    license = "include/OMXAL/NOTICE";
};

libOpenMAXAL = ndk_library {
    name = "libOpenMAXAL";
    symbol_file = "src/libOpenMAXAL.map.txt";
    first_version = "14";
    unversioned_until = "current";
};

libOpenSLES_ndk_headers = ndk_headers {
    name = "libOpenSLES_ndk_headers";
    from = "include";
    to = "";
    srcs = ["include/SLES/**/*.h"]; #  All headers in all subdirs.
    license = "include/SLES/NOTICE";
};

libOpenSLES = ndk_library {
    name = "libOpenSLES";
    symbol_file = "src/libOpenSLES.map.txt";
    first_version = "9";
    unversioned_until = "current";
};

libOpenSLES_headers = cc_library_headers {
    name = "libOpenSLES_headers";
    export_include_dirs = ["include"];
};

subdirs = [
    "src"
    "tests"
];

in { inherit libOpenMAXAL libOpenMAXAL_headers libOpenSLES libOpenSLES_headers libOpenSLES_ndk_headers; }
