{ android_test }:
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
#

TelephonyCommonTests = android_test {
    name = "TelephonyCommonTests";
    srcs = [
        ":framework-telephony-common-sources"
        "src/com/android/internal/telephony/tests/SmsApplicationTest.java"
    ];
    static_libs = [
        "mockito-target-extended"
        "androidx.test.rules"
        "truth-prebuilt"
        "platform-test-annotations"
        "androidx.core_core"
        "androidx.fragment_fragment"
        "androidx.test.ext.junit"
    ];

    jni_libs = ["libdexmakerjvmtiagent"];

    #  We need to rename SmsApplication to the test package or else it'll get clobbered by the
    #  hidden api checker
    jarjar_rules = "jarjar-rules.txt";

    #  Uncomment this and comment out the jarjar rule if you want to attach a debugger and step
    #  through the renamed classes.
    #  platform_apis: true,

    libs = [
        "android.test.runner"
        "android.test.mock"
        "android.test.base"
        "unsupportedappusage"
    ];
};

in { inherit TelephonyCommonTests; }
