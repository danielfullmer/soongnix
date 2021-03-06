{ android_test }:
let

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

TestablesTests = android_test {
    name = "TestablesTests";
    platform_apis = true;
    srcs = [
        "src/android/testing/DexmakerShareClassLoaderRuleTest.java"
        "src/android/testing/TestableContentResolverTest.java"
        "src/android/testing/TestableLooperTest.java"
        "src/android/testing/TestablePermissionsTest.java"
        "src/android/testing/TestableResourcesTest.java"
        "src/android/testing/TestableSettingsProviderTest.java"

    ];
    resource_dirs = ["res"];
    static_libs = [
        "androidx.test.rules"
        "hamcrest-library"
        "mockito-target-inline-minus-junit4"
        "testables"
    ];
    compile_multilib = "both";
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libmultiplejvmtiagentsinterferenceagent"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    certificate = "platform";
    test_suites = ["device-tests"];
};

in { inherit TestablesTests; }
