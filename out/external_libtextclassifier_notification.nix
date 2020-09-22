{ android_library }:
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

#  A library that contains all java classes with the AndroidManifest.
TextClassifierNotificationLib = android_library {
    name = "TextClassifierNotificationLib";
    static_libs = ["TextClassifierNotificationLibNoManifest"];
    sdk_version = "system_current";
    min_sdk_version = "29";
    manifest = "AndroidManifest.xml";
};

#  Similar to TextClassifierNotificationLib, but without the AndroidManifest.
TextClassifierNotificationLibNoManifest = android_library {
    name = "TextClassifierNotificationLibNoManifest";
    srcs = [
        "src/com/android/textclassifier/notification/CopyCodeActivity.java"
        "src/com/android/textclassifier/notification/NotificationUtils.java"
        "src/com/android/textclassifier/notification/SmartSuggestions.java"
        "src/com/android/textclassifier/notification/SmartSuggestionsConfig.java"
        "src/com/android/textclassifier/notification/SmartSuggestionsHelper.java"
        "src/com/android/textclassifier/notification/SmartSuggestionsLogSession.java"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "guava"
    ];
    sdk_version = "system_current";
    min_sdk_version = "29";
    manifest = "LibNoManifest_AndroidManifest.xml";
};

in { inherit TextClassifierNotificationLib TextClassifierNotificationLibNoManifest; }
