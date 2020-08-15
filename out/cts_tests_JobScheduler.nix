{ android_test }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsJobSchedulerTestCases = android_test {
    name = "CtsJobSchedulerTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "compatibility-device-util-axt"
        "ub-uiautomator"
        "androidx.test.rules"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/android/jobscheduler/DummyJobContentProvider.java"
        "src/android/jobscheduler/MockJobService.java"
        "src/android/jobscheduler/TriggerContentJobService.java"
        "src/android/jobscheduler/cts/BatteryConstraintTest.java"
        "src/android/jobscheduler/cts/ConnectivityConstraintTest.java"
        "src/android/jobscheduler/cts/ConstraintTest.java"
        "src/android/jobscheduler/cts/DeviceStatesTest.java"
        "src/android/jobscheduler/cts/JobThrottlingTest.java"
        "src/android/jobscheduler/cts/StorageConstraintTest.java"
        "src/android/jobscheduler/cts/TestAppInterface.java"
        "src/android/jobscheduler/cts/TimingConstraintsTest.java"
        "src/android/jobscheduler/cts/TriggerContentTest.java"
        "JobTestApp/src/android/jobscheduler/cts/jobtestapp/TestActivity.java"
        "JobTestApp/src/android/jobscheduler/cts/jobtestapp/TestJobSchedulerReceiver.java"
        "JobTestApp/src/android/jobscheduler/cts/jobtestapp/TestJobService.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    #  sdk_version: "current",
    platform_apis = true;
};

in { inherit CtsJobSchedulerTestCases; }
