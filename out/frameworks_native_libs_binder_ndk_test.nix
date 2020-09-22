{ aidl_interface, cc_defaults, cc_library_static, cc_test }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

test_libbinder_ndk_defaults = cc_defaults {
    name = "test_libbinder_ndk_defaults";
    shared_libs = [
        "libbase"
    ];
    strip = {
        none = true;
    };
    cflags = [
        "-O0"
        "-g"
    ];
};

test_libbinder_ndk_library = cc_library_static {
    name = "test_libbinder_ndk_library";
    defaults = ["test_libbinder_ndk_defaults"];
    export_include_dirs = ["include"];
    shared_libs = ["libbinder_ndk"];
    export_shared_lib_headers = ["libbinder_ndk"];
    srcs = ["iface.cpp"];
};

test_libbinder_ndk_test_defaults = cc_defaults {
    name = "test_libbinder_ndk_test_defaults";
    defaults = ["test_libbinder_ndk_defaults"];
    shared_libs = [
        "libandroid_runtime_lazy"
        "libbase"
        "libbinder"
        "libbinder_ndk"
        "libutils"
    ];
    static_libs = [
        "test_libbinder_ndk_library"
    ];
};

#  This test is a unit test of the low-level API that is presented here,
#  specifically the parts which are outside of the NDK. Actual users should
#  also instead use AIDL to generate these stubs. See android.binder.cts.
libbinder_ndk_unit_test = cc_test {
    name = "libbinder_ndk_unit_test";
    defaults = ["test_libbinder_ndk_test_defaults"];
    srcs = ["libbinder_ndk_unit_test.cpp"];
    static_libs = [
        "IBinderNdkUnitTest-cpp"
        "IBinderNdkUnitTest-ndk_platform"
    ];
    test_suites = ["general-tests"];
    require_root = true;

    #  force since binderVendorDoubleLoadTest has its own
    auto_gen_config = true;
};

binderVendorDoubleLoadTest = cc_test {
    name = "binderVendorDoubleLoadTest";
    vendor = true;
    srcs = [
        "binderVendorDoubleLoadTest.cpp"
    ];
    static_libs = [
        "IBinderVendorDoubleLoadTest-cpp"
        "IBinderVendorDoubleLoadTest-ndk_platform"
        "libbinder_aidl_test_stub-ndk_platform"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libbinder_ndk"
        "libutils"
    ];
    test_suites = ["general-tests"];
};

IBinderVendorDoubleLoadTest = aidl_interface {
    name = "IBinderVendorDoubleLoadTest";
    unstable = true;
    vendor = true;
    srcs = [
        "IBinderVendorDoubleLoadTest.aidl"
    ];
};

IBinderNdkUnitTest = aidl_interface {
    name = "IBinderNdkUnitTest";
    unstable = true;
    srcs = [
        "IBinderNdkUnitTest.aidl"
        "IEmpty.aidl"
    ];
};

in { inherit IBinderNdkUnitTest IBinderVendorDoubleLoadTest binderVendorDoubleLoadTest libbinder_ndk_unit_test test_libbinder_ndk_defaults test_libbinder_ndk_library test_libbinder_ndk_test_defaults; }
