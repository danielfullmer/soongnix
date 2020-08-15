{ android_test }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

BiDiTests = android_test {
    name = "BiDiTests";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/bidi/BiDiTestActivity.java"
        "src/com/android/bidi/BiDiTestBasic.java"
        "src/com/android/bidi/BiDiTestCanvas2.java"
        "src/com/android/bidi/BiDiTestConstants.java"
        "src/com/android/bidi/BiDiTestFrameLayoutLocale.java"
        "src/com/android/bidi/BiDiTestFrameLayoutLtr.java"
        "src/com/android/bidi/BiDiTestFrameLayoutRtl.java"
        "src/com/android/bidi/BiDiTestGalleryImages.java"
        "src/com/android/bidi/BiDiTestGalleryLtr.java"
        "src/com/android/bidi/BiDiTestGalleryRtl.java"
        "src/com/android/bidi/BiDiTestGridLayoutCodeLtr.java"
        "src/com/android/bidi/BiDiTestGridLayoutCodeRtl.java"
        "src/com/android/bidi/BiDiTestGridLayoutLocale.java"
        "src/com/android/bidi/BiDiTestGridLayoutLtr.java"
        "src/com/android/bidi/BiDiTestGridLayoutRtl.java"
        "src/com/android/bidi/BiDiTestLinearLayoutLocale.java"
        "src/com/android/bidi/BiDiTestLinearLayoutLtr.java"
        "src/com/android/bidi/BiDiTestLinearLayoutRtl.java"
        "src/com/android/bidi/BiDiTestRelativeLayout2Locale.java"
        "src/com/android/bidi/BiDiTestRelativeLayout2Ltr.java"
        "src/com/android/bidi/BiDiTestRelativeLayout2Rtl.java"
        "src/com/android/bidi/BiDiTestRelativeLayoutLtr.java"
        "src/com/android/bidi/BiDiTestRelativeLayoutRtl.java"
        "src/com/android/bidi/BiDiTestTableLayoutLocale.java"
        "src/com/android/bidi/BiDiTestTableLayoutLtr.java"
        "src/com/android/bidi/BiDiTestTableLayoutRtl.java"
        "src/com/android/bidi/BiDiTestTextViewAlignmentLtr.java"
        "src/com/android/bidi/BiDiTestTextViewAlignmentRtl.java"
        "src/com/android/bidi/BiDiTestTextViewDirectionLtr.java"
        "src/com/android/bidi/BiDiTestTextViewDirectionRtl.java"
        "src/com/android/bidi/BiDiTestTextViewDrawablesLtr.java"
        "src/com/android/bidi/BiDiTestTextViewDrawablesRtl.java"
        "src/com/android/bidi/BiDiTestTextViewLocale.java"
        "src/com/android/bidi/BiDiTestTextViewLtr.java"
        "src/com/android/bidi/BiDiTestTextViewRtl.java"
        "src/com/android/bidi/BiDiTestViewDrawText.java"
        "src/com/android/bidi/BiDiTestViewGroupMarginMixed.java"
        "src/com/android/bidi/BiDiTestViewPadding.java"
        "src/com/android/bidi/BiDiTestViewPaddingMixed.java"
    ];
    sdk_version = "current";
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit BiDiTests; }
