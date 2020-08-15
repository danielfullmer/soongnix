{ android_test }:
let

#
#  Copyright (C) 2009 The Android Open Source Project
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

SpammySuggestions = android_test {
    name = "SpammySuggestions";
    sdk_version = "8";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/quicksearchbox/tests/spammy/SpammySuggestionLauncher.java"
        "src/com/android/quicksearchbox/tests/spammy/SpammySuggestionProvider.java"
    ];
    certificate = "shared";
};

in { inherit SpammySuggestions; }
