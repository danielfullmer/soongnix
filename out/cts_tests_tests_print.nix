{ android_test }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsPrintTestCases = android_test {
    name = "CtsPrintTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    srcs = [
        "src/android/print/cts/ClassParametersTest.java"
        "src/android/print/cts/CustomPrintOptionsTest.java"
        "src/android/print/cts/InstallBehavior.java"
        "src/android/print/cts/InteractionBetweenPrintDocumentAndPrinterDiscovery.java"
        "src/android/print/cts/InterfaceForAppsTest.java"
        "src/android/print/cts/PageRangeAdjustAndVerify.java"
        "src/android/print/cts/PageRangeAdjustmentTest.java"
        "src/android/print/cts/PrintAttributesTest.java"
        "src/android/print/cts/PrintDocumentAdapterContractTest.java"
        "src/android/print/cts/PrintDocumentInfoTest.java"
        "src/android/print/cts/PrintJobStateTransitionsTest.java"
        "src/android/print/cts/PrintJobTest.java"
        "src/android/print/cts/PrintServicesTest.java"
        "src/android/print/cts/PrinterCapabilitiesChangeTest.java"
        "src/android/print/cts/PrinterCapabilitiesTest.java"
        "src/android/print/cts/PrinterDiscoverySessionLifecycleTest.java"
        "src/android/print/cts/PrinterInfoTest.java"
        "src/android/print/pdf/cts/PrintedPdfDocumentTest.java"
    ];
    static_libs = ["print-test-util-lib"];
    sdk_version = "test_current";
    required = ["com.android.cts.helpers.aosp"];
};

in { inherit CtsPrintTestCases; }
