{ android_library }:
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

connected-device-lib = android_library {
    name = "connected-device-lib";

    srcs = [
        "src/com/android/car/connecteddevice/AssociationCallback.java"
        "src/com/android/car/connecteddevice/ConnectedDeviceManager.java"
        "src/com/android/car/connecteddevice/ble/AssociationSecureChannel.java"
        "src/com/android/car/connecteddevice/ble/BleCentralManager.java"
        "src/com/android/car/connecteddevice/ble/BleDeviceMessageStream.java"
        "src/com/android/car/connecteddevice/ble/BlePacketFactory.java"
        "src/com/android/car/connecteddevice/ble/BlePacketFactoryException.java"
        "src/com/android/car/connecteddevice/ble/BlePeripheralManager.java"
        "src/com/android/car/connecteddevice/ble/CarBleCentralManager.java"
        "src/com/android/car/connecteddevice/ble/CarBleManager.java"
        "src/com/android/car/connecteddevice/ble/CarBlePeripheralManager.java"
        "src/com/android/car/connecteddevice/ble/DeviceMessage.java"
        "src/com/android/car/connecteddevice/ble/ReconnectSecureChannel.java"
        "src/com/android/car/connecteddevice/ble/SecureBleChannel.java"
        "src/com/android/car/connecteddevice/model/AssociatedDevice.java"
        "src/com/android/car/connecteddevice/model/ConnectedDevice.java"
        "src/com/android/car/connecteddevice/storage/AssociatedDeviceChallengeSecretEntity.java"
        "src/com/android/car/connecteddevice/storage/AssociatedDeviceDao.java"
        "src/com/android/car/connecteddevice/storage/AssociatedDeviceEntity.java"
        "src/com/android/car/connecteddevice/storage/AssociatedDeviceKeyEntity.java"
        "src/com/android/car/connecteddevice/storage/ConnectedDeviceDatabase.java"
        "src/com/android/car/connecteddevice/storage/ConnectedDeviceStorage.java"
        "src/com/android/car/connecteddevice/util/ByteUtils.java"
        "src/com/android/car/connecteddevice/util/EventLog.java"
        "src/com/android/car/connecteddevice/util/RemoteCallbackBinder.java"
        "src/com/android/car/connecteddevice/util/SafeLog.java"
        "src/com/android/car/connecteddevice/util/ScanDataAnalyzer.java"
        "src/com/android/car/connecteddevice/util/ThreadSafeCallbacks.java"
    ];

    manifest = "AndroidManifest.xml";

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    libs = ["android.car"];

    static_libs = [
        "androidx.room_room-runtime"
        "connected-device-protos"
        "encryption-runner"
        "guava"
    ];

    plugins = [
        "androidx.room_room-compiler-plugin"
    ];

    platform_apis = true;
};

in { inherit connected-device-lib; }
