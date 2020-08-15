{ java_binary_host }:
let

#
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

make-keyboard-text = java_binary_host {
    name = "make-keyboard-text";

    srcs = [
        "src/com/android/inputmethod/keyboard/tools/ArrayInitializerFormatter.java"
        "src/com/android/inputmethod/keyboard/tools/JarUtils.java"
        "src/com/android/inputmethod/keyboard/tools/LocaleUtils.java"
        "src/com/android/inputmethod/keyboard/tools/MakeKeyboardText.java"
        "src/com/android/inputmethod/keyboard/tools/MoreKeysResources.java"
        "src/com/android/inputmethod/keyboard/tools/StringResource.java"
        "src/com/android/inputmethod/keyboard/tools/StringResourceMap.java"
    ];
    main_class = "com.android.inputmethod.keyboard.tools.MakeKeyboardText";
    java_resource_dirs = ["res"];
};

in { inherit make-keyboard-text; }
