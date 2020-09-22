{ java_test_host, vts_config }:
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
#

VtsHalUsbGadgetV1_0Host = vts_config {
    name = "VtsHalUsbGadgetV1_0Host";
};

HalUsbGadgetV1_0HostTest = java_test_host {
    name = "HalUsbGadgetV1_0HostTest";
    libs = [
        "tradefed"
        "tradefed-common-util"
    ];
    static_libs = [
        "jna-prebuilt"
    ];
    srcs = [
        "src/com/android/tests/usbgadget/HalUsbGadgetV1_0HostTest.java"
        "src/com/android/tests/usbgadget/libusb/ConfigDescriptor.java"
        "src/com/android/tests/usbgadget/libusb/DeviceDescriptor.java"
        "src/com/android/tests/usbgadget/libusb/IUsbNative.java"
        "src/com/android/tests/usbgadget/libusb/Interface.java"
        "src/com/android/tests/usbgadget/libusb/InterfaceDescriptor.java"
    ];
    test_suites = [
        "vts"
    ];
    auto_gen_config = true;
};

in { inherit HalUsbGadgetV1_0HostTest VtsHalUsbGadgetV1_0Host; }
