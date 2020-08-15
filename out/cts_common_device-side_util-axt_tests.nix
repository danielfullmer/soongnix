{ java_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

compatibility-device-util-tests-axt = java_test {
    name = "compatibility-device-util-tests-axt";

    srcs = [
        "src/com/android/compatibility/common/util/ApiLevelUtilTest.java"
        "src/com/android/compatibility/common/util/BusinessLogicDeviceExecutorTest.java"
        "src/com/android/compatibility/common/util/BusinessLogicTestCaseTest.java"
        "src/com/android/compatibility/common/util/DeviceReportTest.java"
        "src/com/android/compatibility/common/util/RetryRuleTest.java"
        "src/com/android/compatibility/common/util/SafeCleanerRuleTest.java"
        "src/com/android/compatibility/common/util/StateChangerRuleTest.java"
        "src/com/android/compatibility/common/util/StateKeeperRuleTest.java"
        "src/com/android/compatibility/common/util/TimeoutTest.java"
    ];

    static_libs = [
        "compatibility-device-util-axt"
        "junit"
        "testng" #  TODO: remove once Android migrates to JUnit 4.12, which provide assertThrows
        "truth-prebuilt"
    ];

    sdk_version = "test_current";
};

in { inherit compatibility-device-util-tests-axt; }
