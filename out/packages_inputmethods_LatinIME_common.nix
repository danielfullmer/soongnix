{ java_library }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

latinime-common = java_library {
    name = "latinime-common";
    host_supported = true;
    srcs = [
        "src/com/android/inputmethod/annotations/ExternallyReferenced.java"
        "src/com/android/inputmethod/annotations/UsedForTesting.java"
        "src/com/android/inputmethod/latin/common/CodePointUtils.java"
        "src/com/android/inputmethod/latin/common/CollectionUtils.java"
        "src/com/android/inputmethod/latin/common/ComposedData.java"
        "src/com/android/inputmethod/latin/common/Constants.java"
        "src/com/android/inputmethod/latin/common/CoordinateUtils.java"
        "src/com/android/inputmethod/latin/common/FileUtils.java"
        "src/com/android/inputmethod/latin/common/InputPointers.java"
        "src/com/android/inputmethod/latin/common/LocaleUtils.java"
        "src/com/android/inputmethod/latin/common/NativeSuggestOptions.java"
        "src/com/android/inputmethod/latin/common/ResizableIntArray.java"
        "src/com/android/inputmethod/latin/common/StringUtils.java"
        "src/com/android/inputmethod/latin/common/UnicodeSurrogate.java"
    ];
    static_libs = ["jsr305"];
    sdk_version = "21";
};

in { inherit latinime-common; }
