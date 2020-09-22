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

connected-device-lib-unit-tests = android_test {
    name = "connected-device-lib-unit-tests";

    srcs = [
        "src/com/android/car/connecteddevice/ConnectedDeviceManagerTest.java"
        "src/com/android/car/connecteddevice/ble/AssociationSecureChannelTest.java"
        "src/com/android/car/connecteddevice/ble/BleDeviceMessageStreamTest.java"
        "src/com/android/car/connecteddevice/ble/BlePacketFactoryTest.java"
        "src/com/android/car/connecteddevice/ble/CarBlePeripheralManagerTest.java"
        "src/com/android/car/connecteddevice/ble/SecureBleChannelTest.java"
        "src/com/android/car/connecteddevice/storage/ConnectedDeviceStorageTest.java"
        "src/com/android/car/connecteddevice/util/ScanDataAnalyzerTest.java"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];

    static_libs = [
        "android.car"
        "androidx.test.core"
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "connected-device-lib"
        "mockito-target-extended-minus-junit4"
        "testables"
        #  TODO: remove once Android migrates to JUnit 4.13,
        #  which provides assertThrows
        "testng"
        "truth-prebuilt"
    ];

    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    platform_apis = true;

    certificate = "platform";

    privileged = true;
};

in { inherit connected-device-lib-unit-tests; }
