{ android_test }:
let

#
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
#

NaughtySuggestions = android_test {
    name = "NaughtySuggestions";
    sdk_version = "current";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/quicksearchbox/tests/naughty/CrashingSuggestionLauncher.java"
        "src/com/android/quicksearchbox/tests/naughty/CrashingSuggestionProvider.java"
        "src/com/android/quicksearchbox/tests/naughty/HangingSuggestionLauncher.java"
        "src/com/android/quicksearchbox/tests/naughty/HangingSuggestionProvider.java"
        "src/com/android/quicksearchbox/tests/naughty/NaughtySuggestionProvider.java"
    ];
    certificate = "shared";
};

in { inherit NaughtySuggestions; }
