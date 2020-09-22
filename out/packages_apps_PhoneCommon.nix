{ android_app, android_library }:
let

#  Copyright 2012, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

"com.android.phone.common" = android_app {
    name = "com.android.phone.common";
    srcs = [
        "src/com/android/phone/common/CallLogAsync.java"
        "src/com/android/phone/common/PhoneConstants.java"
        "src/com/android/phone/common/animation/AnimUtils.java"
        "src/com/android/phone/common/animation/AnimationListenerAdapter.java"
        "src/com/android/phone/common/compat/PathInterpolatorCompat.java"
        "src/com/android/phone/common/dialpad/DialpadKeyButton.java"
        "src/com/android/phone/common/dialpad/DialpadTextView.java"
        "src/com/android/phone/common/dialpad/DialpadView.java"
        "src/com/android/phone/common/dialpad/DigitsEditText.java"
        "src/com/android/phone/common/util/SettingsUtil.java"
        "src/com/android/phone/common/util/ViewUtil.java"
        "src/com/android/phone/common/widget/ResizingTextEditText.java"
        "src/com/android/phone/common/widget/ResizingTextTextView.java"
    ];
    resource_dirs = ["res"];
    sdk_version = "current";
};

#  Build a static library for use in TeleService and Contacts
"com.android.phone.common-lib" = android_library {
    name = "com.android.phone.common-lib";
    srcs = [
        "src/com/android/phone/common/CallLogAsync.java"
        "src/com/android/phone/common/PhoneConstants.java"
        "src/com/android/phone/common/animation/AnimUtils.java"
        "src/com/android/phone/common/animation/AnimationListenerAdapter.java"
        "src/com/android/phone/common/compat/PathInterpolatorCompat.java"
        "src/com/android/phone/common/dialpad/DialpadKeyButton.java"
        "src/com/android/phone/common/dialpad/DialpadTextView.java"
        "src/com/android/phone/common/dialpad/DialpadView.java"
        "src/com/android/phone/common/dialpad/DigitsEditText.java"
        "src/com/android/phone/common/util/SettingsUtil.java"
        "src/com/android/phone/common/util/ViewUtil.java"
        "src/com/android/phone/common/widget/ResizingTextEditText.java"
        "src/com/android/phone/common/widget/ResizingTextTextView.java"
    ];
    resource_dirs = ["res"];
    sdk_version = "current";
    min_sdk_version = "21";
};

in { inherit "com.android.phone.common" "com.android.phone.common-lib"; }
