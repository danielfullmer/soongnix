{ java_library_static }:
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

cts-input-lib = java_library_static {
    name = "cts-input-lib";
    sdk_version = "test_current";
    srcs = [
        "src/com/android/cts/input/HidDevice.java"
        "src/com/android/cts/input/HidJsonParser.java"
        "src/com/android/cts/input/HidTestData.java"
    ];
};

in { inherit cts-input-lib; }
