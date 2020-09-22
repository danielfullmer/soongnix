{ cc_library_static, cc_test }:
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

libgtest_isolated = cc_library_static {
    name = "libgtest_isolated";
    host_supported = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = ["include"];

    srcs = [
        "Color.cpp"
        "Isolate.cpp"
        "IsolateMain.cpp"
        "NanoTime.cpp"
        "Options.cpp"
        "Test.cpp"
    ];

    #  NOTE: libbase is re-exported by including them below.
    #  When Soong supports transitive static dependency includes, this
    #  library can be removed.
    whole_static_libs = [
        "libbase"
        "libgtest"
    ];

    #  Add liblog as a shared library so that gtests can override liblog
    #  functions without getting duplicate symbols.
    shared_libs = [
        "liblog"
    ];
};

libgtest_isolated_main = cc_library_static {
    name = "libgtest_isolated_main";
    host_supported = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];
    srcs = [
        "Main.cpp"
    ];

    whole_static_libs = [
        "libgtest_isolated"
    ];

    #  Add liblog as a shared library so that gtests can override liblog
    #  functions without getting duplicate symbols.
    shared_libs = [
        "liblog"
    ];
};

gtest_isolated_tests = cc_test {
    name = "gtest_isolated_tests";
    host_supported = true;
    srcs = [
        "tests/OptionsTest.cpp"
        "tests/SystemTests.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
        "liblog"
    ];
    static_libs = [
        "libgmock"
    ];
    whole_static_libs = ["libgtest_isolated_main"];

    test_suites = ["device-tests"];
};

in { inherit gtest_isolated_tests libgtest_isolated libgtest_isolated_main; }
