{ cc_defaults, cc_library_headers, cc_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

fp16_headers = cc_library_headers {
    name = "fp16_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
    sdk_version = "current";
};

fp16_tests_default = cc_defaults {
    name = "fp16_tests_default";
    sdk_version = "current";
    srcs = [
        "test/tables.cc"
    ];
    header_libs = [
        "fp16_headers"
    ];
    stl = "libc++_static";
    static_libs = [
        "libgmock_ndk"
    ];
};

Fp16AltFromFp32ValueTests = cc_test {
    name = "Fp16AltFromFp32ValueTests";
    defaults = ["fp16_tests_default"];
    srcs = [
        "test/alt-from-fp32-value.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

Fp16AltToFp32BitsTests = cc_test {
    name = "Fp16AltToFp32BitsTests";
    defaults = ["fp16_tests_default"];
    srcs = [
        "test/alt-to-fp32-bits.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

Fp16AltToFp32ValueTests = cc_test {
    name = "Fp16AltToFp32ValueTests";
    defaults = ["fp16_tests_default"];
    srcs = [
        "test/alt-to-fp32-value.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

Fp16BitcastsTests = cc_test {
    name = "Fp16BitcastsTests";
    defaults = ["fp16_tests_default"];
    srcs = [
        "test/bitcasts.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

Fp16IEEEFromFp32ValueTests = cc_test {
    name = "Fp16IEEEFromFp32ValueTests";
    defaults = ["fp16_tests_default"];
    srcs = [
        "test/ieee-from-fp32-value.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

Fp16IEEEToFp32BitsTests = cc_test {
    name = "Fp16IEEEToFp32BitsTests";
    defaults = ["fp16_tests_default"];
    srcs = [
        "test/ieee-to-fp32-bits.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

Fp16IEEEToFp32ValueTests = cc_test {
    name = "Fp16IEEEToFp32ValueTests";
    defaults = ["fp16_tests_default"];
    srcs = [
        "test/ieee-to-fp32-value.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

in { inherit Fp16AltFromFp32ValueTests Fp16AltToFp32BitsTests Fp16AltToFp32ValueTests Fp16BitcastsTests Fp16IEEEFromFp32ValueTests Fp16IEEEToFp32BitsTests Fp16IEEEToFp32ValueTests fp16_headers fp16_tests_default; }
