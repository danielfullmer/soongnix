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

CtsLocationFineTestCases = android_test {
    name = "CtsLocationFineTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "LocationCtsCommon"
        "androidx.test.ext.junit"
        "androidx.test.ext.truth"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/location/cts/fine/AddressTest.java"
        "src/android/location/cts/fine/CriteriaTest.java"
        "src/android/location/cts/fine/GeocoderTest.java"
        "src/android/location/cts/fine/GnssAntennaInfoRegistrationTest.java"
        "src/android/location/cts/fine/GnssAntennaInfoTest.java"
        "src/android/location/cts/fine/GnssClockTest.java"
        "src/android/location/cts/fine/GnssMeasurementTest.java"
        "src/android/location/cts/fine/GnssMeasurementsEventTest.java"
        "src/android/location/cts/fine/GnssStatusTest.java"
        "src/android/location/cts/fine/LocationManagerFineTest.java"
        "src/android/location/cts/fine/LocationTest.java"
        "src/android/location/cts/fine/ScanningSettingsTest.java"
        "src/android/location/cts/fine/SettingInjectorServiceTest.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsLocationFineTestCases; }