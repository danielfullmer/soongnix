{ aidl_interface, cc_defaults, cc_library_shared }:
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

libbinder_ndk_test_interface = aidl_interface {
    name = "libbinder_ndk_test_interface";
    srcs = [
        "test_package/IEmpty.aidl"
        "test_package/ITest.aidl"
        "test_package/RegularPolygon.aidl"
        "test_package/Bar.aidl"
        "test_package/Foo.aidl"
    ];
    versions = [
        "1"
        "2"
    ];
    backend = {
        java = {
            sdk_version = "28";
        };
    };
};

libbinder_ndk_test_defaults = cc_defaults {
    name = "libbinder_ndk_test_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "liblog"
        "libbinder_ndk"
    ];
    whole_static_libs = ["libnativetesthelper_jni"];

    sdk_version = "current";
    stl = "c++_static";
};

libbinder_ndk_test_utilities = cc_library_shared {
    name = "libbinder_ndk_test_utilities";
    defaults = ["libbinder_ndk_test_defaults"];
    srcs = ["utilities.cpp"];
};

libbinder_ndk_test_interface_new = cc_library_shared {
    name = "libbinder_ndk_test_interface_new";
    defaults = ["libbinder_ndk_test_defaults"];
    srcs = [
        "android_binder_cts_NativeService.cpp"
    ];

    #  Using the up-to-date version of the interface

    shared_libs = [
        "libbinder_ndk_test_interface-ndk"
        "libbinder_ndk_test_utilities"
    ];
};

libbinder_ndk_test_interface_old = cc_library_shared {
    name = "libbinder_ndk_test_interface_old";
    defaults = ["libbinder_ndk_test_defaults"];
    srcs = [
        "android_binder_cts_NativeService.cpp"
    ];
    cflags = ["-DUSING_VERSION_1"];

    #  Using the frozen version 1 of the interface
    static_libs = [
        "libbinder_ndk_test_interface-V1-ndk"
    ];

    shared_libs = [
        "libbinder_ndk_test_utilities"
    ];
};

libbinder_ndk_test = cc_library_shared {
    name = "libbinder_ndk_test";
    defaults = ["libbinder_ndk_test_defaults"];
    srcs = [
        "test_ibinder.cpp"
        "test_ibinder_jni.cpp"
        "test_native_aidl_client.cpp"
        "test_parcel.cpp"
        "test_status.cpp"
    ];

    shared_libs = [
        "libbinder_ndk_test_interface-ndk"
        "libbinder_ndk_test_utilities"
    ];
};

in { inherit libbinder_ndk_test libbinder_ndk_test_defaults libbinder_ndk_test_interface libbinder_ndk_test_interface_new libbinder_ndk_test_interface_old libbinder_ndk_test_utilities; }
