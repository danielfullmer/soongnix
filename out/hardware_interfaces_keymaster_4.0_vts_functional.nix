{ cc_test, cc_test_library }:
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

VtsHalKeymasterV4_0TargetTest = cc_test {
    name = "VtsHalKeymasterV4_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "HmacKeySharingTest.cpp"
        "VerificationTokenTest.cpp"
        "keymaster_hidl_hal_test.cpp"
    ];
    static_libs = [
        "android.hardware.keymaster@4.0"
        "libcrypto_static"
        "libkeymaster4support"
        "libkeymaster4vtstest"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

libkeymaster4vtstest = cc_test_library {
    name = "libkeymaster4vtstest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "KeymasterHidlTest.cpp"
    ];
    export_include_dirs = [
        "."
    ];
    static_libs = [
        "android.hardware.keymaster@4.0"
        "libkeymaster4support"
    ];
};

in { inherit VtsHalKeymasterV4_0TargetTest libkeymaster4vtstest; }
