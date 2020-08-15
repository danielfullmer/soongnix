{ android_test }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

AndroidVCardTests = android_test {
    name = "AndroidVCardTests";

    certificate = "platform";
    platform_apis = true;
    test_suites = ["device-tests"];
    srcs = [
        "src/com/android/vcard/tests/VCardBuilderTest.java"
        "src/com/android/vcard/tests/VCardEntryTests.java"
        "src/com/android/vcard/tests/VCardExporterTests.java"
        "src/com/android/vcard/tests/VCardImporterNestTests.java"
        "src/com/android/vcard/tests/VCardImporterTests.java"
        "src/com/android/vcard/tests/VCardJapanizationTests.java"
        "src/com/android/vcard/tests/VCardParserTests.java"
        "src/com/android/vcard/tests/VCardTestUtilsTests.java"
        "src/com/android/vcard/tests/VCardUtilsTests.java"
        "src/com/android/vcard/tests/testutils/ContactEntry.java"
        "src/com/android/vcard/tests/testutils/ContentValuesBuilder.java"
        "src/com/android/vcard/tests/testutils/ContentValuesVerifier.java"
        "src/com/android/vcard/tests/testutils/ContentValuesVerifierElem.java"
        "src/com/android/vcard/tests/testutils/ExportTestProvider.java"
        "src/com/android/vcard/tests/testutils/ExportTestResolver.java"
        "src/com/android/vcard/tests/testutils/ImportTestProvider.java"
        "src/com/android/vcard/tests/testutils/ImportTestResolver.java"
        "src/com/android/vcard/tests/testutils/LineVerifier.java"
        "src/com/android/vcard/tests/testutils/LineVerifierElem.java"
        "src/com/android/vcard/tests/testutils/PropertyNode.java"
        "src/com/android/vcard/tests/testutils/PropertyNodesVerifier.java"
        "src/com/android/vcard/tests/testutils/PropertyNodesVerifierElem.java"
        "src/com/android/vcard/tests/testutils/VCardTestsBase.java"
        "src/com/android/vcard/tests/testutils/VCardVerifier.java"
        "src/com/android/vcard/tests/testutils/VNode.java"
        "src/com/android/vcard/tests/testutils/VNodeBuilder.java"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    static_libs = [
        "com.android.vcard"
        "junit"
    ];

    jacoco = {
        include_filter = ["com.android.vcard.*"];
        exclude_filter = ["com.android.vcard.tests.*"];
    };
};

in { inherit AndroidVCardTests; }
