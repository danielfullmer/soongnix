{ aidl_interface, cc_defaults, cc_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

binder_test_defaults = cc_defaults {
    name = "binder_test_defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

binderDriverInterfaceTest_IPC_32 = cc_test {
    name = "binderDriverInterfaceTest_IPC_32";
    defaults = ["binder_test_defaults"];
    srcs = ["binderDriverInterfaceTest.cpp"];
    compile_multilib = "32";
    multilib = {
        lib32 = {
            suffix = "";
        };
    };
    cflags = ["-DBINDER_IPC_32BIT=1"];
    test_suites = ["vts"];
};

binderDriverInterfaceTest = cc_test {
    name = "binderDriverInterfaceTest";
    defaults = ["binder_test_defaults"];
    product_variables = {
        binder32bit = {
            cflags = ["-DBINDER_IPC_32BIT=1"];
        };
    };

    srcs = ["binderDriverInterfaceTest.cpp"];
    test_suites = [
        "device-tests"
        "vts"
    ];
};

binderLibTest_IPC_32 = cc_test {
    name = "binderLibTest_IPC_32";
    defaults = ["binder_test_defaults"];
    srcs = ["binderLibTest.cpp"];
    shared_libs = [
        "libbinder"
        "libutils"
    ];
    compile_multilib = "32";
    multilib = {
        lib32 = {
            suffix = "";
        };
    };
    cflags = ["-DBINDER_IPC_32BIT=1"];
    test_suites = ["vts"];
    require_root = true;
};

binderLibTest = cc_test {
    name = "binderLibTest";
    defaults = ["binder_test_defaults"];
    product_variables = {
        binder32bit = {
            cflags = ["-DBINDER_IPC_32BIT=1"];
        };
    };

    srcs = ["binderLibTest.cpp"];
    shared_libs = [
        "libbinder"
        "libutils"
    ];
    test_suites = [
        "device-tests"
        "vts"
    ];
    require_root = true;
};

binderThroughputTest = cc_test {
    name = "binderThroughputTest";
    defaults = ["binder_test_defaults"];
    srcs = ["binderThroughputTest.cpp"];
    shared_libs = [
        "libbinder"
        "libutils"
    ];
    clang = true;
    cflags = [
        "-g"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-O3"
    ];
};

binderTextOutputTest = cc_test {
    name = "binderTextOutputTest";
    defaults = ["binder_test_defaults"];
    srcs = ["binderTextOutputTest.cpp"];
    shared_libs = [
        "libbinder"
        "libutils"
        "libbase"
    ];
    test_suites = ["device-tests"];
};

schd-dbg = cc_test {
    name = "schd-dbg";
    defaults = ["binder_test_defaults"];
    srcs = ["schd-dbg.cpp"];
    shared_libs = [
        "libbinder"
        "libutils"
        "libbase"
    ];
};

binderSafeInterfaceTest = cc_test {
    name = "binderSafeInterfaceTest";
    defaults = ["binder_test_defaults"];
    srcs = ["binderSafeInterfaceTest.cpp"];

    cppflags = [
        "-Wextra"
    ];

    cpp_std = "experimental";
    gnu_extensions = false;

    shared_libs = [
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];
    test_suites = [
        "device-tests"
        "vts"
    ];
    require_root = true;
};

binderStabilityTestIface = aidl_interface {
    name = "binderStabilityTestIface";
    unstable = true;
    srcs = [
        "IBinderStabilityTest.aidl"
    ];
};

binderStabilityTest = cc_test {
    name = "binderStabilityTest";
    defaults = ["binder_test_defaults"];
    srcs = [
        "binderStabilityTest.cpp"
    ];

    shared_libs = [
        "libbinder_ndk"
        "libbinder"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "binderStabilityTestIface-cpp"
        "binderStabilityTestIface-ndk_platform"
    ];

    test_suites = ["device-tests"];
    require_root = true;
};

in { inherit binderDriverInterfaceTest binderDriverInterfaceTest_IPC_32 binderLibTest binderLibTest_IPC_32 binderSafeInterfaceTest binderStabilityTest binderStabilityTestIface binderTextOutputTest binderThroughputTest binder_test_defaults schd-dbg; }
