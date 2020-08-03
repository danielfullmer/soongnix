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

#  Build library
cts-core-test-runner = java_library {
    name = "cts-core-test-runner";

    srcs = ["src/**/*.java"];
    static_libs = [
        "compatibility-device-util"
        "android-support-test"
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
cts-test-runner = java_library {
    name = "cts-test-runner";

    srcs = ["src/com/android/cts/runner/**/*.java"];
    static_libs = ["android-support-test"];
    sdk_version = "current";

};

in { inherit cts-core-test-runner cts-test-runner; }
