{ cc_library_headers }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

libfixedpoint = cc_library_headers {
    name = "libfixedpoint";
    vendor_available = true;
    host_supported = true;
    export_include_dirs = ["fixedpoint"];
};

libgemmlowp = cc_library_headers {
    name = "libgemmlowp";
    vendor_available = true;
    host_supported = true;
    export_include_dirs = ["public"];
};

gemmlowp_headers = cc_library_headers {
    name = "gemmlowp_headers";
    vendor_available = true;
    host_supported = true;
    export_include_dirs = ["."];
    apex_available = [
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
        "//apex_available:platform"
    ];
};

subdirs = ["eight_bit_int_gemm"];

in { inherit gemmlowp_headers libfixedpoint libgemmlowp; }
