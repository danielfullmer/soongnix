{ android_app, android_library }:
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

BluetoothMidiLib = android_library {
    name = "BluetoothMidiLib";
    srcs = [
        "src/com/android/bluetoothmidiservice/BluetoothMidiDevice.java"
        "src/com/android/bluetoothmidiservice/BluetoothMidiService.java"
        "src/com/android/bluetoothmidiservice/BluetoothPacketDecoder.java"
        "src/com/android/bluetoothmidiservice/BluetoothPacketEncoder.java"
        "src/com/android/bluetoothmidiservice/MidiBtleTimeTracker.java"
        "src/com/android/bluetoothmidiservice/PacketDecoder.java"
        "src/com/android/bluetoothmidiservice/PacketEncoder.java"
    ];
    platform_apis = true;
    manifest = "AndroidManifestBase.xml";
};

BluetoothMidiService = android_app {
    name = "BluetoothMidiService";
    srcs = [
        "src/com/android/bluetoothmidiservice/BluetoothMidiDevice.java"
        "src/com/android/bluetoothmidiservice/BluetoothMidiService.java"
        "src/com/android/bluetoothmidiservice/BluetoothPacketDecoder.java"
        "src/com/android/bluetoothmidiservice/BluetoothPacketEncoder.java"
        "src/com/android/bluetoothmidiservice/MidiBtleTimeTracker.java"
        "src/com/android/bluetoothmidiservice/PacketDecoder.java"
        "src/com/android/bluetoothmidiservice/PacketEncoder.java"
    ];
    platform_apis = true;
    certificate = "platform";
    manifest = "AndroidManifest.xml";
};

in { inherit BluetoothMidiLib BluetoothMidiService; }
