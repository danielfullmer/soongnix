{ cc_library, cc_test, cc_test_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

"android.hardware.identity-support-lib" = cc_library {
    name = "android.hardware.identity-support-lib";
    vendor_available = true;
    srcs = [
        "src/IdentityCredentialSupport.cpp"
    ];
    export_include_dirs = [
        "include"
    ];
    shared_libs = [
        "android.hardware.keymaster@4.0"
        "libcrypto"
        "libbase"
        "libhidlbase"
        "libhardware"
        "libkeymaster_portable"
        "libsoft_attestation_cert"
        "libpuresoftkeymasterdevice"
    ];
    static_libs = [
        "libcppbor"
    ];
};

"android.hardware.identity-support-lib-test" = cc_test {
    name = "android.hardware.identity-support-lib-test";
    srcs = [
        "tests/IdentityCredentialSupportTest.cpp"
    ];
    shared_libs = [
        "android.hardware.identity-support-lib"
        "libcrypto"
        "libbase"
        "libhidlbase"
        "libhardware"
    ];
    static_libs = [
        "libcppbor"
        "libgmock"
    ];
    test_suites = ["general-tests"];
};

#  --

libcppbor = cc_library {
    name = "libcppbor";
    vendor_available = true;
    host_supported = true;
    srcs = [
        "src/cppbor.cpp"
        "src/cppbor_parse.cpp"
    ];
    export_include_dirs = [
        "include/cppbor"
    ];
    shared_libs = [
        "libbase"
    ];
};

cppbor_test = cc_test {
    name = "cppbor_test";
    srcs = [
        "tests/cppbor_test.cpp"
    ];
    shared_libs = [
        "libcppbor"
        "libbase"
    ];
    static_libs = [
        "libgmock"
    ];
    test_suites = ["general-tests"];
};

cppbor_host_test = cc_test_host {
    name = "cppbor_host_test";
    srcs = [
        "tests/cppbor_test.cpp"
    ];
    shared_libs = [
        "libcppbor"
        "libbase"
    ];
    static_libs = [
        "libgmock"
    ];
    test_suites = ["general-tests"];
};

in { inherit "android.hardware.identity-support-lib" "android.hardware.identity-support-lib-test" cppbor_host_test cppbor_test libcppbor; }
