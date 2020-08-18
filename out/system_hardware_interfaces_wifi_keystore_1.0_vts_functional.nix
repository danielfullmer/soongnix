{ cc_test }:
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

VtsHalWifiKeystoreV1_0TargetTest = cc_test {
    name = "VtsHalWifiKeystoreV1_0TargetTest";
    srcs = [
        "VtsHalWifiKeystoreV1_0TargetTest.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libnativehelper"
        "libutils"
        "libkeystore_binder"
        "libbinder"
        "libkeystore_aidl"
        "libkeystore_parcelables"
        "libkeymaster4support"
        "libbinderthreadstate"
        "libhwbinder"
    ];
    static_libs = [
        "VtsHalHidlTargetTestBase"
        "android.system.wifi.keystore@1.0"
    ];
    cflags = [
        "-O0"
        "-g"
        "-Wall"
        "-Werror"
    ];
};

in { inherit VtsHalWifiKeystoreV1_0TargetTest; }
