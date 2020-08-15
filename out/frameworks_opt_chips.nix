{ android_library }:
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

libchips = android_library {
    name = "libchips";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    sdk_version = "current";
    srcs = [
        "src/com/android/ex/chips/AccountSpecifier.java"
        "src/com/android/ex/chips/BaseRecipientAdapter.java"
        "src/com/android/ex/chips/ChipsUtil.java"
        "src/com/android/ex/chips/CircularImageView.java"
        "src/com/android/ex/chips/CopyDialog.java"
        "src/com/android/ex/chips/DefaultPhotoManager.java"
        "src/com/android/ex/chips/DropdownChipLayouter.java"
        "src/com/android/ex/chips/PhoneUtil.java"
        "src/com/android/ex/chips/PhotoManager.java"
        "src/com/android/ex/chips/Queries.java"
        "src/com/android/ex/chips/RecipientAlternatesAdapter.java"
        "src/com/android/ex/chips/RecipientEditTextView.java"
        "src/com/android/ex/chips/RecipientEntry.java"
        "src/com/android/ex/chips/SingleRecipientArrayAdapter.java"
        "src/com/android/ex/chips/recipientchip/BaseRecipientChip.java"
        "src/com/android/ex/chips/recipientchip/DrawableRecipientChip.java"
        "src/com/android/ex/chips/recipientchip/InvisibleRecipientChip.java"
        "src/com/android/ex/chips/recipientchip/ReplacementDrawableSpan.java"
        "src/com/android/ex/chips/recipientchip/SimpleRecipientChip.java"
        "src/com/android/ex/chips/recipientchip/VisibleRecipientChip.java"

    ];

    resource_dirs = ["res"];
};

in { inherit libchips; }
