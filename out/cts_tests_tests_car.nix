{ android_test }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

CtsCarTestCases = android_test {
    name = "CtsCarTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "truth-prebuilt"
        "ctstestrunner-axt"
        "android.test.base.stubs"
        #  TODO: remove once Android migrates to JUnit 4.12,
        #  which provides assertThrows
        "testng"
    ];
    libs = [
        "android.car-test-stubs"
    ];
    srcs = [
        "src/android/car/cts/CarApiTestBase.java"
        "src/android/car/cts/CarAppFocusManagerTest.java"
        "src/android/car/cts/CarBluetoothTest.java"
        "src/android/car/cts/CarInfoManagerTest.java"
        "src/android/car/cts/CarOccupantZoneManagerTest.java"
        "src/android/car/cts/CarPackageManagerTest.java"
        "src/android/car/cts/CarPropertyConfigTest.java"
        "src/android/car/cts/CarPropertyManagerTest.java"
        "src/android/car/cts/CarPropertyValueTest.java"
        "src/android/car/cts/CarSensorManagerTest.java"
        "src/android/car/cts/CarTest.java"
        "src/android/car/cts/CarUxRestrictionsManagerTest.java"
        "src/android/car/cts/CarWatchdogDaemonTest.java"
        "src/android/car/cts/ExceptionsTest.java"
        "src/android/car/cts/drivingstate/DistractionOptimizedActivity.java"
        "src/android/car/cts/drivingstate/NonDistractionOptimizedActivity.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsCarTestCases; }