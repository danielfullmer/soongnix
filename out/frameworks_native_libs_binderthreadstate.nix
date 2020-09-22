{ aidl_interface, cc_library_static, cc_test, hidl_package_root }:
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

#  DO NOT ADD NEW USAGES OF THIS
#  See comments in header file.
libbinderthreadstateutils = cc_library_static {
    name = "libbinderthreadstateutils";
    double_loadable = true;
    vendor_available = true;
    host_supported = true;

    shared_libs = [
        "libbinder"
        "libhidlbase" #  libhwbinder is in here
    ];

    export_include_dirs = ["include"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
    min_sdk_version = "29";
};

binderthreadstateutilstest = hidl_package_root {
    name = "binderthreadstateutilstest";
};

"binderthreadstateutilstest.aidl" = aidl_interface {
    name = "binderthreadstateutilstest.aidl";
    unstable = true;
    srcs = ["IAidlStuff.aidl"];
};

libbinderthreadstateutils_test = cc_test {
    name = "libbinderthreadstateutils_test";
    srcs = ["test.cpp"];
    static_libs = [
        "binderthreadstateutilstest@1.0"
        "binderthreadstateutilstest.aidl-cpp"
        "libbinderthreadstateutils"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libhidlbase"
        "libutils"
        "liblog"
    ];
    test_suites = [
        "general-tests"
    ];
    require_root = true;
};

in { inherit "binderthreadstateutilstest.aidl" binderthreadstateutilstest libbinderthreadstateutils libbinderthreadstateutils_test; }
