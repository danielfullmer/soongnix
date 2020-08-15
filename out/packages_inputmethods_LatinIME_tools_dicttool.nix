{ java_binary_host }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

dicttool_aosp = java_binary_host {
    name = "dicttool_aosp";

    srcs = [
        "src/com/android/inputmethod/latin/dicttool/BinaryDictOffdeviceUtils.java"
        "src/com/android/inputmethod/latin/dicttool/CombinedInputOutput.java"
        "src/com/android/inputmethod/latin/dicttool/CommandList.java"
        "src/com/android/inputmethod/latin/dicttool/Compress.java"
        "src/com/android/inputmethod/latin/dicttool/Crypt.java"
        "src/com/android/inputmethod/latin/dicttool/DictionaryMaker.java"
        "src/com/android/inputmethod/latin/dicttool/Dicttool.java"
        "src/com/android/inputmethod/latin/dicttool/Diff.java"
        "src/com/android/inputmethod/latin/dicttool/Header.java"
        "src/com/android/inputmethod/latin/dicttool/Info.java"
        "src/com/android/inputmethod/latin/dicttool/Makedict.java"
        "src/com/android/inputmethod/latin/dicttool/Package.java"
        "src/com/android/inputmethod/latin/dicttool/Test.java"
        "src/com/android/inputmethod/latin/personalization/PersonalizationHelper.java"
        "tests/com/android/inputmethod/latin/dicttool/BinaryDictOffdeviceUtilsTests.java"
        "tests/com/android/inputmethod/latin/makedict/BinaryDictEncoderFlattenTreeTests.java"
        "tests/com/android/inputmethod/latin/makedict/FusionDictionaryTest.java"
        "compat/android/content/Context.java"
        "compat/android/content/SharedPreferences.java"
        "compat/android/graphics/Rect.java"
        "compat/android/test/AndroidTestCase.java"
        "compat/android/test/suitebuilder/annotation/LargeTest.java"
        "compat/android/text/Spanned.java"
        "compat/android/text/TextUtils.java"
        "compat/android/util/Log.java"
        "compat/android/util/Pair.java"
        "compat/android/util/SparseArray.java"
        "compat/android/util/SparseIntArray.java"
        "compat/android/view/inputmethod/CompletionInfo.java"
        "compat/android/view/inputmethod/EditorInfo.java"
        "compat/com/android/inputmethod/keyboard/Key.java"
        "compat/com/android/inputmethod/keyboard/Keyboard.java"
        "compat/com/android/inputmethod/keyboard/ProximityInfo.java"
        "compat/com/android/inputmethod/latin/LatinIME.java"
        "compat/com/android/inputmethod/latin/define/JniLibName.java"
        "compat/com/android/inputmethod/latin/settings/AdditionalFeaturesSettingUtils.java"
        "compat/com/android/inputmethod/latin/utils/WordInputEventForPersonalization.java"
        ":dicttool_deps"
    ];

    libs = ["junit"];
    static_libs = [
        "jsr305"
        "latinime-common"
    ];
    required = ["libjni_latinime"];
    main_class = "com.android.inputmethod.latin.dicttool.Dicttool";
};

in { inherit dicttool_aosp; }
