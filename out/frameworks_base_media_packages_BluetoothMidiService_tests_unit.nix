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

BluetoothMidiTests = android_test {
    name = "BluetoothMidiTests";
    srcs = [
        "src/com/android/bluetoothmidiservice/AccumulatingMidiReceiver.java"
        "src/com/android/bluetoothmidiservice/BluetoothMidiCodecTest.java"
        "src/com/android/bluetoothmidiservice/BluetoothMidiDecoderTest.java"
        "src/com/android/bluetoothmidiservice/BluetoothMidiEncoderTest.java"
        "src/com/android/bluetoothmidiservice/MidiFramerTest.java"
    ];
    certificate = "platform";
    static_libs = [
        # "frameworks-base-testutils",
        "android-support-test"
        "androidx.test.core"
        "androidx.test.ext.truth"
        "androidx.test.runner"
        "androidx.test.rules"
        "platform-test-annotations"
        "BluetoothMidiLib"
    ];
    test_suites = ["device-tests"];
    libs = [
        "framework-res"
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
};

in { inherit BluetoothMidiTests; }