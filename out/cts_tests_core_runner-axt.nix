{ java_library }:
let

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

# ==========================================================
#  Build the core runner.
# ==========================================================

#  temporary cts-core-test-runner variant that brings in androidx.test transitively, instead
#  of android.support.test target. Will be removed after androidx.test CTS conversion is complete.
cts-core-test-runner-axt = java_library {
    name = "cts-core-test-runner-axt";

    srcs = [
        "src/com/android/cts/core/runner/ExpectationBasedFilter.java"
        "src/com/android/cts/core/runner/support/SingleTestNGTestRunListener.java"
        "src/com/android/cts/core/runner/support/SingleTestNgTestExecutor.java"
        "src/com/android/cts/core/runner/support/TestNgRunner.java"
        "src/com/android/cts/core/runner/support/TestNgRunnerBuilder.java"
        "src/com/android/cts/runner/CrashParserRunListener.java"
        "src/com/android/cts/runner/CtsTestRunListener.java"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "vogarexpect"
        "testng"
    ];

    libs = ["android.test.runner.stubs"];
    sdk_version = "test_current";

};

# ==========================================================
#  Build the run listener
# ==========================================================

#  Build library
cts-test-runner-axt = java_library {
    name = "cts-test-runner-axt";

    srcs = [
        "src/com/android/cts/runner/CrashParserRunListener.java"
        "src/com/android/cts/runner/CtsTestRunListener.java"
    ];
    static_libs = ["androidx.test.rules"];
    sdk_version = "current";

};

in { inherit cts-core-test-runner-axt cts-test-runner-axt; }
