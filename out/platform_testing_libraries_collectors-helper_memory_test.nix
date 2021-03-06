{ java_library }:
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

memory-helper-test = java_library {
    name = "memory-helper-test";
    defaults = ["tradefed_errorprone_defaults"];

    srcs = [
        "src/com/android/helpers/tests/DumpsysMeminfoHelperTest.java"
        "src/com/android/helpers/tests/FreeMemHelperTest.java"
        "src/com/android/helpers/tests/GarbageCollectionHelperTest.java"
        "src/com/android/helpers/tests/ProcessShowmapHelperTest.java"
        "src/com/android/helpers/tests/RssSnapshotHelperTest.java"
        "src/com/android/helpers/tests/TotalPssHelperTest.java"
    ];

    static_libs = [
        "androidx.test.runner"
        "junit"
        "mockito-target"
        "memory-helper"
    ];

    sdk_version = "current";
};

in { inherit memory-helper-test; }
