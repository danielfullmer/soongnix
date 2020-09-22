{ android_app, android_library }:
let

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

ExtServices-core = android_library {
    name = "ExtServices-core";
    srcs = [
        "src/android/ext/services/Version.java"
        "src/android/ext/services/autofill/AutofillFieldClassificationServiceImpl.java"
        "src/android/ext/services/autofill/CreditCardMatcher.java"
        "src/android/ext/services/autofill/EditDistanceScorer.java"
        "src/android/ext/services/autofill/ExactMatch.java"
        "src/android/ext/services/autofill/InlineSuggestionRenderServiceImpl.java"
        "src/android/ext/services/notification/AgingHelper.java"
        "src/android/ext/services/notification/Assistant.java"
        "src/android/ext/services/notification/AssistantSettings.java"
        "src/android/ext/services/notification/ChannelImpressions.java"
        "src/android/ext/services/notification/EntityTypeCounter.java"
        "src/android/ext/services/notification/NotificationCategorizer.java"
        "src/android/ext/services/notification/NotificationEntry.java"
        "src/android/ext/services/notification/SmsHelper.java"
        "src/android/ext/services/resolver/LRResolverRankerService.java"
        "src/android/ext/services/storage/CacheQuotaServiceImpl.java"
        "src/android/ext/services/watchdog/ExplicitHealthCheckServiceImpl.java"
        "src/android/ext/services/watchdog/ExplicitHealthChecker.java"
        "src/android/ext/services/watchdog/NetworkChecker.java"
    ];
    sdk_version = "system_current";
    resource_dirs = [
        "res"
    ];

    manifest = "AndroidManifest.xml";

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.autofill_autofill"
        "TextClassifierServiceLibNoManifest"
        "TextClassifierNotificationLibNoManifest"
    ];

    plugins = ["java_api_finder"];
};

ExtServices = android_app {
    name = "ExtServices";
    sdk_version = "system_current";
    certificate = "platform";
    optimize = {
        proguard_flags_files = ["proguard.proguard"];
    };
    privileged = true;
    static_libs = [
        "ExtServices-core"
    ];
    jni_libs = ["libtextclassifier"];
    use_embedded_native_libs = true;
    apex_available = [
        "//apex_available:platform"
        "com.android.extservices"
        "test_com.android.extservices"
    ];
    min_sdk_version = "current";
    required = [
        "libtextclassifier_annotator_en_model"
        "libtextclassifier_annotator_universal_model"
        "libtextclassifier_actions_suggestions_universal_model"
        "libtextclassifier_lang_id_model"
    ];
};

in { inherit ExtServices ExtServices-core; }
