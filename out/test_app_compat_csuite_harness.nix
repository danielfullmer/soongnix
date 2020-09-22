{ java_library_host, java_test_host }:
let

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

csuite-harness = java_library_host {
    name = "csuite-harness";
    srcs = [
        "src/main/java/com/android/compatibility/AppCompatibilityTest.java"
        "src/main/java/com/android/compatibility/AppCrawlerCompatibilityTest.java"
        "src/main/java/com/android/compatibility/AppLaunchCompatibilityTest.java"
        "src/main/java/com/android/compatibility/FailureCollectingListener.java"
        "src/main/java/com/android/compatibility/targetprep/AppSetupPreparer.java"
        "src/main/java/com/android/compatibility/targetprep/AppSetupPreparerConfigurationReceiver.java"
        "src/main/java/com/android/compatibility/testtype/AppLaunchTest.java"
        "src/main/java/com/android/tradefed/result/CompatibilityTestResult.java"
        "src/main/java/com/android/tradefed/util/PublicApkUtil.java"
    ];
    java_resource_dirs = [
        "src/main/resources"
    ];
    libs = [
        "tradefed"
    ];
};

csuite-harness-tests = java_test_host {
    name = "csuite-harness-tests";
    srcs = [
        "src/test/java/com/android/compatibility/AppCompatibilityTestTest.java"
        "src/test/java/com/android/compatibility/CSuiteUnitTests.java"
        "src/test/java/com/android/compatibility/targetprep/AppSetupPreparerConfigurationReceiverTest.java"
        "src/test/java/com/android/compatibility/targetprep/AppSetupPreparerTest.java"
        "src/test/java/com/android/compatibility/testtype/AppLaunchTestTest.java"
    ];
    libs = [
        "csuite-harness"
        "tradefed"
    ];
    static_libs = [
        "mockito-host"
        "objenesis"
        "testng"
    ];
    test_suites = ["general-tests"];
};

in { inherit csuite-harness csuite-harness-tests; }
