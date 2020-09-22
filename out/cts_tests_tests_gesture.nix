{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsGestureTestCases = android_test {
    name = "CtsGestureTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/gesture/cts/GestureComparator.java"
        "src/android/gesture/cts/GestureLibraryTest.java"
        "src/android/gesture/cts/GesturePointTest.java"
        "src/android/gesture/cts/GestureStorageAccessor.java"
        "src/android/gesture/cts/GestureStorageTester.java"
        "src/android/gesture/cts/GestureStoreTest.java"
        "src/android/gesture/cts/GestureStrokeTest.java"
        "src/android/gesture/cts/GestureTest.java"
        "src/android/gesture/cts/LineGestureStrokeHelper.java"
    ];
    static_libs = ["androidx.test.runner"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "current";
};

in { inherit CtsGestureTestCases; }
