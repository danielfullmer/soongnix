{ java_library }:
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

print-test-util-lib = java_library {
    name = "print-test-util-lib";

    srcs = [
        "src/android/print/test/BasePrintTest.java"
        "src/android/print/test/PrintDocumentActivity.java"
        "src/android/print/test/Utils.java"
        "src/android/print/test/services/AddPrintersActivity.java"
        "src/android/print/test/services/CustomPrintOptionsActivity.java"
        "src/android/print/test/services/FirstPrintService.java"
        "src/android/print/test/services/InfoActivity.java"
        "src/android/print/test/services/PrintServiceCallbacks.java"
        "src/android/print/test/services/PrinterDiscoverySessionCallbacks.java"
        "src/android/print/test/services/SecondPrintService.java"
        "src/android/print/test/services/SettingsActivity.java"
        "src/android/print/test/services/StubbablePrintService.java"
        "src/android/print/test/services/StubbablePrinterDiscoverySession.java"
    ];

    static_libs = [
        "mockito-target-minus-junit4"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "platformprotosnano"
    ];

    sdk_version = "test_current";
};

in { inherit print-test-util-lib; }
