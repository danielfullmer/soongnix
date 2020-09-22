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

#  NOTE: This test is separate from service tests since it relies on same vs different calling UID,
#  and this is more representative of a real caller. It also uses Mockito extended, and this
#  prevents converting the entire services test module.
PackageManagerComponentOverrideTests = android_test {
    name = "PackageManagerComponentOverrideTests";
    srcs = [
        "src/com/android/server/pm/test/override/PackageManagerComponentLabelIconOverrideTest.kt"
    ];
    static_libs = [
        "androidx.test.runner"
        "mockito-target-extended-minus-junit4"
        "services.core"
        "servicestests-utils-mockito-extended"
        "testng" #  TODO: remove once Android migrates to JUnit 4.12, which provides assertThrows
        "truth-prebuilt"
    ];

    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];
    test_suites = ["device-tests"];
    platform_apis = true;
};

in { inherit PackageManagerComponentOverrideTests; }
