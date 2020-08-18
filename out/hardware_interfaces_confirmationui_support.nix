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

"android.hardware.confirmationui-support-lib" = cc_library {
    name = "android.hardware.confirmationui-support-lib";
    vendor_available = true;
    host_supported = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "src/cbor.cpp"
        "src/confirmationui_utils.cpp"
    ];
    export_include_dirs = [
        "include"
    ];
};

"android.hardware.confirmationui-support-lib-tests" = cc_test {
    name = "android.hardware.confirmationui-support-lib-tests";
    srcs = [
        "test/gtest_main.cpp"
        "test/android_cbor_test.cpp"
        "test/msg_formatting_test.cpp"
    ];
    static_libs = [
        "libgtest"
        "android.hardware.confirmationui-support-lib"
    ];
    shared_libs = [
        "android.hardware.confirmationui@1.0"
        "android.hardware.keymaster@4.0"
        "libhidlbase"
    ];
    test_suites = ["general-tests"];
    clang = true;
    cflags = ["-O0"];
};

in { inherit "android.hardware.confirmationui-support-lib" "android.hardware.confirmationui-support-lib-tests"; }
