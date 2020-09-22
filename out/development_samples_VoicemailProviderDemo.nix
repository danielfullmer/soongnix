{ android_app }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

VoicemailProviderDemo = android_app {
    name = "VoicemailProviderDemo";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/voicemail/AddVoicemailActivity.java"
        "src/com/example/android/voicemail/common/core/Voicemail.java"
        "src/com/example/android/voicemail/common/core/VoicemailFilter.java"
        "src/com/example/android/voicemail/common/core/VoicemailFilterFactory.java"
        "src/com/example/android/voicemail/common/core/VoicemailImpl.java"
        "src/com/example/android/voicemail/common/core/VoicemailProviderHelper.java"
        "src/com/example/android/voicemail/common/core/VoicemailProviderHelpers.java"
        "src/com/example/android/voicemail/common/inject/InjectView.java"
        "src/com/example/android/voicemail/common/inject/Injector.java"
        "src/com/example/android/voicemail/common/logging/Logger.java"
        "src/com/example/android/voicemail/common/ui/DialogHelper.java"
        "src/com/example/android/voicemail/common/ui/DialogHelperImpl.java"
        "src/com/example/android/voicemail/common/utils/CloseUtils.java"
        "src/com/example/android/voicemail/common/utils/DbQueryUtils.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit VoicemailProviderDemo; }
