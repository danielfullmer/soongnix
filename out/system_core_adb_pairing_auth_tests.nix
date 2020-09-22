{ cc_test }:
let

#
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
#

adb_pairing_auth_test = cc_test {
    name = "adb_pairing_auth_test";
    srcs = [
        "aes_128_gcm_test.cpp"
        "pairing_auth_test.cpp"
    ];

    compile_multilib = "first";

    shared_libs = [
        "libbase"
        "libcrypto"
    ];

    #  Let's statically link them so we don't have to install it onto the
    #  system image for testing.
    static_libs = [
        "libadb_pairing_auth_static"
    ];

    test_suites = ["device-tests"];
};

in { inherit adb_pairing_auth_test; }