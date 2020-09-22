{ android_test_helper_app }:
let

#
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
#

CtsVerifierUSBCompanion = android_test_helper_app {
    name = "CtsVerifierUSBCompanion";
    static_libs = [
        "androidx.annotation_annotation"
        "junit"
    ];
    srcs = [
        "src/com/android/cts/verifierusbcompanion/AccessoryAttachmentHandler.java"
        "src/com/android/cts/verifierusbcompanion/AccessoryTestCompanion.java"
        "src/com/android/cts/verifierusbcompanion/AoapInterface.java"
        "src/com/android/cts/verifierusbcompanion/DeviceTestCompanion.java"
        "src/com/android/cts/verifierusbcompanion/Main.java"
        "src/com/android/cts/verifierusbcompanion/TestCompanion.java"
    ];
    sdk_version = "25";
    # min_sdk_version: "12",
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsVerifierUSBCompanion; }
