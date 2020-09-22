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

TextClassifierNotificationTests = android_test {
    name = "TextClassifierNotificationTests";

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/com/android/textclassifier/notification/CopyCodeActivityTest.java"
        "src/com/android/textclassifier/notification/NotificationUtilsTest.java"
        "src/com/android/textclassifier/notification/SmartSuggestionsHelperTest.java"
        "src/com/android/textclassifier/notification/SmartSuggestionsLogSessionTest.java"
    ];

    static_libs = [
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "androidx.test.ext.truth"
        "mockito-target-minus-junit4"
        "compatibility-device-util-axt"
        "TextClassifierNotificationLib"
    ];

    test_suites = [
        "device-tests"
        "mts"
    ];

    instrumentation_for = "TextClassifierNotificationLib";
};

in { inherit TextClassifierNotificationTests; }
