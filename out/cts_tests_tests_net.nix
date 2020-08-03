{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsNetTestCases = android_test {
    name = "CtsNetTestCases";
    defaults = ["cts_defaults"];

    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";

    libs = [
        "voip-common"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];

    jni_libs = [
        "libcts_jni"
        "libnativedns_jni"
        "libnativemultinetwork_jni"
        "libnativehelper_compat_libc++"
    ];

    #  include CtsTestServer as a temporary hack to free net.cts from cts.stub.
    srcs = [
        "src/**/*.java"
        "src/**/*.kt"
    ];

    static_libs = [
        "FrameworksNetCommonTests"
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

    #  uncomment when b/13249961 is fixed
    #  sdk_version: "current",
    platform_apis = true;

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "mts"
    ];

};

in { inherit CtsNetTestCases; }
