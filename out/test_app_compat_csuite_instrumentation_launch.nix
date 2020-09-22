{ android_test }:
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

csuite-launch-instrumentation = android_test {
    name = "csuite-launch-instrumentation";
    static_libs = ["androidx.test.rules"];
    #  Include all test java files.
    srcs = [
        "src/main/java/com/android/compatibilitytest/AppCompatibility.java"
        "src/main/java/com/android/compatibilitytest/AppCompatibilityRunner.java"
    ];
    platform_apis = true;
    manifest = "src/main/AndroidManifest.xml";
    test_suites = [
        "csuite"
    ];
};

in { inherit csuite-launch-instrumentation; }