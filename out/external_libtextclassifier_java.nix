{ android_app, android_library, genrule, java_library }:
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

#  A standalone TextClassifierService app for testing.
TextClassifierService = android_app {
    name = "TextClassifierService";
    static_libs = ["TextClassifierServiceLib"];
    jni_libs = ["libtextclassifier"];
    sdk_version = "system_current";
    min_sdk_version = "28";
    certificate = "platform";
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    use_embedded_native_libs = true;
};

#  A library that contains all java classes with the AndroidManifest.
TextClassifierServiceLib = android_library {
    name = "TextClassifierServiceLib";
    static_libs = ["TextClassifierServiceLibNoManifest"];
    sdk_version = "system_current";
    min_sdk_version = "28";
    manifest = "AndroidManifest.xml";
};

#  Similar to TextClassifierServiceLib, but without the AndroidManifest.
TextClassifierServiceLibNoManifest = android_library {
    name = "TextClassifierServiceLibNoManifest";
    srcs = [
        "src/com/android/textclassifier/ActionsSuggestionsHelper.java"
        "src/com/android/textclassifier/DefaultTextClassifierService.java"
        "src/com/android/textclassifier/Entity.java"
        "src/com/android/textclassifier/EntityConfidence.java"
        "src/com/android/textclassifier/ExtrasUtils.java"
        "src/com/android/textclassifier/ModelFileManager.java"
        "src/com/android/textclassifier/TextClassifierImpl.java"
        "src/com/android/textclassifier/TextClassifierSettings.java"
        "src/com/android/textclassifier/common/base/LocaleCompat.java"
        "src/com/android/textclassifier/common/base/TcLog.java"
        "src/com/android/textclassifier/common/intent/LabeledIntent.java"
        "src/com/android/textclassifier/common/intent/TemplateIntentFactory.java"
        "src/com/android/textclassifier/common/logging/ResultIdUtils.java"
        "src/com/android/textclassifier/common/logging/TextClassificationContext.java"
        "src/com/android/textclassifier/common/logging/TextClassificationSessionId.java"
        "src/com/android/textclassifier/common/logging/TextClassifierEvent.java"
        "src/com/android/textclassifier/common/statsd/GenerateLinksLogger.java"
        "src/com/android/textclassifier/common/statsd/SelectionEventConverter.java"
        "src/com/android/textclassifier/common/statsd/TextClassificationSessionIdConverter.java"
        "src/com/android/textclassifier/common/statsd/TextClassifierEventConverter.java"
        "src/com/android/textclassifier/common/statsd/TextClassifierEventLogger.java"
        "src/com/android/textclassifier/utils/IndentingPrintWriter.java"
    ];
    manifest = "LibNoManifest_AndroidManifest.xml";
    static_libs = [
        "androidx.core_core"
        "libtextclassifier-java"
        "androidx.annotation_annotation"
        "guava"
        "textclassifier-statsd"
        "error_prone_annotations"
    ];
    sdk_version = "system_current";
    min_sdk_version = "28";
};

textclassifier-statsd = java_library {
    name = "textclassifier-statsd";
    sdk_version = "system_current";
    srcs = [
        ":statslog-textclassifier-java-gen"
    ];
};

statslog-textclassifier-java-gen = genrule {
    name = "statslog-textclassifier-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module textclassifier --javaPackage com.android.textclassifier --javaClass TextClassifierStatsLog";
    out = ["com/android/textclassifier/TextClassifierStatsLog.java"];
};

in { inherit TextClassifierService TextClassifierServiceLib TextClassifierServiceLibNoManifest statslog-textclassifier-java-gen textclassifier-statsd; }
