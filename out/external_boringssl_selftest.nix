{ cc_binary, cc_defaults }:
let

#
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

boringssl_self_test_defaults = cc_defaults {
    name = "boringssl_self_test_defaults";
    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    shared_libs = [
        "libcrypto"
    ];
    srcs = [
        "boringssl_self_test.cpp"
    ];
};

boringssl_self_test = cc_binary {
    name = "boringssl_self_test";
    visibility = [
        "//external/conscrypt/apex"
        "//external/conscrypt/apex/testing"
    ];
    defaults = ["boringssl_self_test_defaults"];
    apex_available = [
        "//apex_available:platform"
        "com.android.conscrypt"
    ];
    min_sdk_version = "29";
};

boringssl_self_test_vendor = cc_binary {
    name = "boringssl_self_test_vendor";
    defaults = ["boringssl_self_test_defaults"];
    stem = "boringssl_self_test";
    vendor = true;
    init_rc = ["boringssl_self_test.rc"];
};

in { inherit boringssl_self_test boringssl_self_test_defaults boringssl_self_test_vendor; }