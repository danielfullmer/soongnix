{ android_test }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

CtsBluetoothTestCases = android_test {
    name = "CtsBluetoothTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "bluetooth-test-util-lib"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/bluetooth/cts/AdvertiseCallbackTest.java"
        "src/android/bluetooth/cts/AdvertiseDataTest.java"
        "src/android/bluetooth/cts/AdvertiseSettingsTest.java"
        "src/android/bluetooth/cts/BasicAdapterTest.java"
        "src/android/bluetooth/cts/BluetoothLeScanTest.java"
        "src/android/bluetooth/cts/BluetoothScanReceiver.java"
        "src/android/bluetooth/cts/HearingAidProfileTest.java"
        "src/android/bluetooth/cts/LeL2capSocketTest.java"
        "src/android/bluetooth/cts/ScanCallbackTest.java"
        "src/android/bluetooth/cts/ScanFilterTest.java"
        "src/android/bluetooth/cts/ScanRecordTest.java"
        "src/android/bluetooth/cts/ScanResultTest.java"
        "src/android/bluetooth/cts/ScanSettingsTest.java"
        "src/android/bluetooth/cts/TestUtils.java"
    ];
    sdk_version = "current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsBluetoothTestCases; }
