{ java_library_static }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

platform-test-options = java_library_static {
    name = "platform-test-options";
    sdk_version = "24";
    srcs = [
        "src/android/platform/test/options/BooleanOption.java"
        "src/android/platform/test/options/DoubleOption.java"
        "src/android/platform/test/options/IntegerOption.java"
        "src/android/platform/test/options/LongOption.java"
        "src/android/platform/test/options/StringOption.java"
        "src/android/platform/test/options/TestOption.java"
    ];
    libs = [
        "androidx.test.runner"
        "junit"
    ];
};

in { inherit platform-test-options; }
