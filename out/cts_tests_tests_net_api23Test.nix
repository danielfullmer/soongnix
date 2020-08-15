{ android_test }:
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

CtsNetApi23TestCases = android_test {
    name = "CtsNetApi23TestCases";
    defaults = ["cts_defaults"];

    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";

    libs = [
        "android.test.base.stubs"
    ];

    srcs = [
        "src/android/net/cts/api23test/ConnectivityManagerApi23Test.java"
        "src/android/net/cts/api23test/ConnectivityReceiver.java"

    ];

    static_libs = [
        "core-tests-support"
        "compatibility-device-util-axt"
        "cts-net-utils"
        "ctstestrunner-axt"
        "ctstestserver"
        "mockwebserver"
        "junit"
        "junit-params"
        "truth-prebuilt"
    ];

    platform_apis = true;

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];

};

in { inherit CtsNetApi23TestCases; }
