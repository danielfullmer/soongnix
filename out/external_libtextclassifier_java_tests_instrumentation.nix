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

TextClassifierServiceTest = android_test {
    name = "TextClassifierServiceTest";

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/com/android/textclassifier/ActionsSuggestionsHelperTest.java"
        "src/com/android/textclassifier/ModelFileManagerTest.java"
        "src/com/android/textclassifier/TextClassifierImplTest.java"
        "src/com/android/textclassifier/TextClassifierSettingsTest.java"
        "src/com/android/textclassifier/common/base/LocaleCompatTest.java"
        "src/com/android/textclassifier/common/intent/LabeledIntentTest.java"
        "src/com/android/textclassifier/common/intent/TemplateIntentFactoryTest.java"
        "src/com/android/textclassifier/common/logging/ResultIdUtilsTest.java"
        "src/com/android/textclassifier/common/logging/TextClassificationContextTest.java"
        "src/com/android/textclassifier/common/logging/TextClassificationEventTest.java"
        "src/com/android/textclassifier/common/logging/TextClassificationSessionIdTest.java"
        "src/com/android/textclassifier/common/statsd/GenerateLinksLoggerTest.java"
        "src/com/android/textclassifier/common/statsd/SelectionEventConverterTest.java"
        "src/com/android/textclassifier/common/statsd/StatsdTestUtils.java"
        "src/com/android/textclassifier/common/statsd/TextClassificationSessionIdConverterTest.java"
        "src/com/android/textclassifier/common/statsd/TextClassifierEventConverterTest.java"
        "src/com/android/textclassifier/common/statsd/TextClassifierEventLoggerTest.java"
        "src/com/android/textclassifier/subjects/EntitySubject.java"
        "src/com/android/textclassifier/testing/FakeContextBuilder.java"
        "src/com/android/textclassifier/utils/IndentingPrintWriterTest.java"
    ];

    static_libs = [
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "androidx.test.ext.truth"
        "mockito-target-minus-junit4"
        "ub-uiautomator"
        "testng"
        "compatibility-device-util-axt"
        "androidx.room_room-runtime"
        "TextClassifierServiceLib"
        "statsdprotolite"
        "textclassifierprotoslite"
    ];

    jni_libs = [
        "libtextclassifier"
        "libdexmakerjvmtiagent"
    ];

    test_suites = [
        "device-tests"
        "mts"
    ];

    plugins = ["androidx.room_room-compiler-plugin"];
    platform_apis = true;
    use_embedded_native_libs = true;
    compile_multilib = "both";

    instrumentation_for = "TextClassifierService";
};

in { inherit TextClassifierServiceTest; }
