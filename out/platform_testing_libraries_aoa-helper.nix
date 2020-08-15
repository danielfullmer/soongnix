{ java_library_host, java_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

aoa-helper = java_library_host {
    name = "aoa-helper";
    srcs = [
        "src/com/android/helper/aoa/AoaDevice.java"
        "src/com/android/helper/aoa/IUsbNative.java"
        "src/com/android/helper/aoa/UsbDevice.java"
        "src/com/android/helper/aoa/UsbException.java"
        "src/com/android/helper/aoa/UsbHelper.java"
    ];
    libs = [
        "guava"
    ];
    static_libs = [
        "jna-prebuilt"
    ];
};

aoa-helper-test = java_test_host {
    name = "aoa-helper-test";
    srcs = [
        "tests/src/com/android/helper/aoa/AoaDeviceTest.java"
        "tests/src/com/android/helper/aoa/UsbDeviceTest.java"
        "tests/src/com/android/helper/aoa/UsbHelperTest.java"
    ];
    static_libs = [
        "aoa-helper"
        "guava"
        "junit"
        "mockito-host"
        "objenesis-host"
    ];
    test_suites = ["general-tests"];
};

in { inherit aoa-helper aoa-helper-test; }
