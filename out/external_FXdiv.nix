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

fxdiv_headers = cc_library_headers {
    name = "fxdiv_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
    sdk_version = "current";
};

fxdiv_tests_default = cc_defaults {
    name = "fxdiv_tests_default";
    sdk_version = "current";
    cflags = [
        "-Wno-missing-field-initializers"
    ];
    header_libs = [
        "fxdiv_headers"
    ];
    stl = "libc++_static";
    static_libs = [
        "libgmock_ndk"
    ];
};

FxdivMultiplyHighTests = cc_test {
    name = "FxdivMultiplyHighTests";
    defaults = ["fxdiv_tests_default"];
    srcs = [
        "test/multiply-high.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

FxdivQuotientTests = cc_test {
    name = "FxdivQuotientTests";
    defaults = ["fxdiv_tests_default"];
    srcs = [
        "test/quotient.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

in { inherit FxdivMultiplyHighTests FxdivQuotientTests fxdiv_headers fxdiv_tests_default; }
