{ android_test }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

CtsHardwareTestCases = android_test {
    name = "CtsHardwareTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    compile_multilib = "both";
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.ext.junit"
        "compatibility-device-util-axt"
        "cts-input-lib"
        "ctstestrunner-axt"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
        "ub-uiautomator"
    ];
    jni_libs = [
        "libctshardware_jni"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/hardware/biometrics/cts/BiometricManagerTest.java"
        "src/android/hardware/biometrics/cts/BiometricPromptTest.java"
        "src/android/hardware/consumerir/cts/ConsumerIrTest.java"
        "src/android/hardware/cts/GeomagneticFieldTest.java"
        "src/android/hardware/cts/HardwareBufferTest.java"
        "src/android/hardware/cts/LowRamDeviceTest.java"
        "src/android/hardware/fingerprint/cts/FingerprintManagerTest.java"
        "src/android/hardware/hdmi/cts/HdmiSwitchClientTest.java"
        "src/android/hardware/input/cts/InputCallback.java"
        "src/android/hardware/input/cts/InputCtsActivity.java"
        "src/android/hardware/input/cts/tests/AsusGamepadTest.java"
        "src/android/hardware/input/cts/tests/InputTestCase.java"
        "src/android/hardware/input/cts/tests/MicrosoftDesignerKeyboardTest.java"
        "src/android/hardware/input/cts/tests/MicrosoftSculpttouchTest.java"
        "src/android/hardware/input/cts/tests/MicrosoftXbox2020Test.java"
        "src/android/hardware/input/cts/tests/MicrosoftXboxOneSTest.java"
        "src/android/hardware/input/cts/tests/NintendoSwitchProTest.java"
        "src/android/hardware/input/cts/tests/RazerServalTest.java"
        "src/android/hardware/input/cts/tests/SonyDualshock3UsbTest.java"
        "src/android/hardware/input/cts/tests/SonyDualshock4BluetoothTest.java"
        "src/android/hardware/input/cts/tests/SonyDualshock4ProBluetoothTest.java"
        "src/android/hardware/input/cts/tests/SonyDualshock4ProUsbTest.java"
        "src/android/hardware/input/cts/tests/SonyDualshock4UsbTest.java"
        "src/android/hardware/lights/cts/LightsManagerTest.java"
    ];
    sdk_version = "test_current";
};

in { inherit CtsHardwareTestCases; }
