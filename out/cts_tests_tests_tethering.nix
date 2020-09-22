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

CtsTetheringTest = android_test {
    name = "CtsTetheringTest";
    defaults = ["cts_defaults"];

    libs = [
        "android.test.base.stubs"
    ];

    srcs = [
        "src/android/tethering/cts/TetheringManagerTest.java"
    ];

    static_libs = [
        "TetheringCommonTests"
        "TetheringIntegrationTestsLib"
        "compatibility-device-util-axt"
        "cts-net-utils"
        "net-tests-utils"
        "ctstestrunner-axt"
        "junit"
        "junit-params"
    ];

    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    #  Change to system current when TetheringManager move to bootclass path.
    platform_apis = true;

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
        "mts"
    ];

    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";
};

in { inherit CtsTetheringTest; }
