{ cc_library, cc_test }:
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

libese-app-weaver = cc_library {
    name = "libese-app-weaver";
    defaults = ["libese-app-defaults"];
    srcs = ["weaver.c"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=unused-variable"
    ];
    shared_libs = [
        "liblog"
        "libese"
        "libese-sysdeps"
    ];
    export_include_dirs = ["include"];
};

libese-app-weaver-test = cc_test {
    name = "libese-app-weaver-test";
    defaults = ["libese-app-defaults"];
    srcs = ["tests/weaver_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libese"
        "libese-app-weaver"
        "libese_cpp_nxp_pn80t_nq_nci"
    ];
    static_libs = [
        "libgtest"
    ];
};

in { inherit libese-app-weaver libese-app-weaver-test; }
