{ java_library }:
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

"com.android.vcard" = java_library {
    name = "com.android.vcard";

    #  2.3
    sdk_version = "9";

    srcs = [
        "java/com/android/vcard/JapaneseUtils.java"
        "java/com/android/vcard/VCardBuilder.java"
        "java/com/android/vcard/VCardComposer.java"
        "java/com/android/vcard/VCardConfig.java"
        "java/com/android/vcard/VCardConstants.java"
        "java/com/android/vcard/VCardEntry.java"
        "java/com/android/vcard/VCardEntryCommitter.java"
        "java/com/android/vcard/VCardEntryConstructor.java"
        "java/com/android/vcard/VCardEntryCounter.java"
        "java/com/android/vcard/VCardEntryHandler.java"
        "java/com/android/vcard/VCardInterpreter.java"
        "java/com/android/vcard/VCardParser.java"
        "java/com/android/vcard/VCardParserImpl_V21.java"
        "java/com/android/vcard/VCardParserImpl_V30.java"
        "java/com/android/vcard/VCardParserImpl_V40.java"
        "java/com/android/vcard/VCardParser_V21.java"
        "java/com/android/vcard/VCardParser_V30.java"
        "java/com/android/vcard/VCardParser_V40.java"
        "java/com/android/vcard/VCardPhoneNumberTranslationCallback.java"
        "java/com/android/vcard/VCardProperty.java"
        "java/com/android/vcard/VCardSourceDetector.java"
        "java/com/android/vcard/VCardUtils.java"
        "java/com/android/vcard/exception/VCardAgentNotSupportedException.java"
        "java/com/android/vcard/exception/VCardException.java"
        "java/com/android/vcard/exception/VCardInvalidCommentLineException.java"
        "java/com/android/vcard/exception/VCardInvalidLineException.java"
        "java/com/android/vcard/exception/VCardNestedException.java"
        "java/com/android/vcard/exception/VCardNotSupportedException.java"
        "java/com/android/vcard/exception/VCardVersionException.java"
    ];
};

in { inherit "com.android.vcard"; }
