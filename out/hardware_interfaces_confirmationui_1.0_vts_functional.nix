{ cc_test }:
let

#
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
#

VtsHalConfirmationUIV1_0TargetTest = cc_test {
    name = "VtsHalConfirmationUIV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "VtsHalConfirmationUIV1_0TargetTest.cpp"
    ];
    static_libs = [
        "android.hardware.confirmationui@1.0"
        "android.hardware.keymaster@4.0"
        "libcrypto_static"
        "libcn-cbor"
        "android.hardware.confirmationui-support-lib"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalConfirmationUIV1_0TargetTest; }
