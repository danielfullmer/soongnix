{ cc_library_static }:
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

libicuctest = cc_library_static {
    name = "libicuctest";
    export_include_dirs = ["."];
    rtti = true;
    cflags = [
        "-Wno-unused-parameter"
        "-DANDROID_LINK_SHARED_ICU4C"
    ];
    srcs = [
        "ctest.c"
        "ucln_ct.c"
        "datamap.cpp"
        "testdata.cpp"
        "tstdtmod.cpp"
        "uperf.cpp"
    ];
    shared_libs = [
        "libicui18n"
        "libicuuc"
    ];
    static_libs = [
        "libicutoolutil"
    ];
};

in { inherit libicuctest; }
