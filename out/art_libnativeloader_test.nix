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

"libfoo.oem1" = cc_library {
    name = "libfoo.oem1";
    srcs = ["test.cpp"];
    cflags = ["-DLIBNAME=\"libfoo.oem1.so\""];
    shared_libs = [
        "libbase"
    ];
};

"libbar.oem1" = cc_library {
    name = "libbar.oem1";
    srcs = ["test.cpp"];
    cflags = ["-DLIBNAME=\"libbar.oem1.so\""];
    shared_libs = [
        "libbase"
    ];
};

"libfoo.oem2" = cc_library {
    name = "libfoo.oem2";
    srcs = ["test.cpp"];
    cflags = ["-DLIBNAME=\"libfoo.oem2.so\""];
    shared_libs = [
        "libbase"
    ];
};

"libbar.oem2" = cc_library {
    name = "libbar.oem2";
    srcs = ["test.cpp"];
    cflags = ["-DLIBNAME=\"libbar.oem2.so\""];
    shared_libs = [
        "libbase"
    ];
};

"libfoo.product1" = cc_library {
    name = "libfoo.product1";
    srcs = ["test.cpp"];
    cflags = ["-DLIBNAME=\"libfoo.product1.so\""];
    product_specific = true;
    shared_libs = [
        "libbase"
    ];
};

"libbar.product1" = cc_library {
    name = "libbar.product1";
    srcs = ["test.cpp"];
    cflags = ["-DLIBNAME=\"libbar.product1.so\""];
    product_specific = true;
    shared_libs = [
        "libbase"
    ];
};

#  Build the test for the C API.
libnativeloader-api-tests = cc_test {
    name = "libnativeloader-api-tests";
    defaults = [
        "art_defaults"
        "art_test_defaults"
    ];
    test_per_src = true;
    srcs = [
        "api_test.c"
    ];
    header_libs = ["libnativeloader-headers"];
};

in { inherit "libbar.oem1" "libbar.oem2" "libbar.product1" "libfoo.oem1" "libfoo.oem2" "libfoo.product1" libnativeloader-api-tests; }
