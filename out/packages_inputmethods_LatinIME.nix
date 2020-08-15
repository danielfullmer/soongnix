{ filegroup }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

dicttool_deps = filegroup {
    name = "dicttool_deps";
    srcs = [
        "java/src/com/android/inputmethod/latin/makedict/DictionaryHeader.java"
        "java/src/com/android/inputmethod/latin/makedict/FormatSpec.java"
        "java/src/com/android/inputmethod/latin/makedict/NgramProperty.java"
        "java/src/com/android/inputmethod/latin/makedict/ProbabilityInfo.java"
        "java/src/com/android/inputmethod/latin/makedict/UnsupportedFormatException.java"
        "java/src/com/android/inputmethod/latin/makedict/WeightedString.java"
        "java/src/com/android/inputmethod/latin/makedict/WordProperty.java"

        #  Dependencies for Dicttool. Most of these files are needed by BinaryDictionary.java. Note that
        #  a significant part of the dependencies are mocked in the compat/ directory, with empty or
        #  nearly-empty implementations, for parts that we don't use in Dicttool.
        "java/src/com/android/inputmethod/latin/BinaryDictionary.java"
        "java/src/com/android/inputmethod/latin/DicTraverseSession.java"
        "java/src/com/android/inputmethod/latin/Dictionary.java"
        "java/src/com/android/inputmethod/latin/NgramContext.java"
        "java/src/com/android/inputmethod/latin/SuggestedWords.java"
        "java/src/com/android/inputmethod/latin/settings/SettingsValuesForSuggestion.java"
        "java/src/com/android/inputmethod/latin/utils/BinaryDictionaryUtils.java"
        "java/src/com/android/inputmethod/latin/utils/CombinedFormatUtils.java"
        "java/src/com/android/inputmethod/latin/utils/JniUtils.java"

        "java/src/com/android/inputmethod/latin/define/DebugFlags.java"
        "java/src/com/android/inputmethod/latin/define/DecoderSpecificConstants.java"

        "tests/src/com/android/inputmethod/latin/utils/ByteArrayDictBuffer.java"
        "tests/src/com/android/inputmethod/latin/makedict/AbstractDictDecoder.java"
        "tests/src/com/android/inputmethod/latin/makedict/BinaryDictDecoderEncoderTests.java"
        "tests/src/com/android/inputmethod/latin/makedict/BinaryDictDecoderUtils.java"
        "tests/src/com/android/inputmethod/latin/makedict/BinaryDictEncoderUtils.java"
        "tests/src/com/android/inputmethod/latin/makedict/BinaryDictIOUtils.java"
        "tests/src/com/android/inputmethod/latin/makedict/BinaryDictUtils.java"
        "tests/src/com/android/inputmethod/latin/makedict/DictDecoder.java"
        "tests/src/com/android/inputmethod/latin/makedict/DictEncoder.java"
        "tests/src/com/android/inputmethod/latin/makedict/FusionDictionary.java"
        "tests/src/com/android/inputmethod/latin/makedict/MakedictLog.java"
        "tests/src/com/android/inputmethod/latin/makedict/PendingAttribute.java"
        "tests/src/com/android/inputmethod/latin/makedict/PtNodeInfo.java"
        "tests/src/com/android/inputmethod/latin/makedict/Ver2DictEncoder.java"
        "tests/src/com/android/inputmethod/latin/makedict/Ver4DictDecoder.java"
        "tests/src/com/android/inputmethod/latin/makedict/Ver4DictEncoder.java"
    ];
};

in { inherit dicttool_deps; }
