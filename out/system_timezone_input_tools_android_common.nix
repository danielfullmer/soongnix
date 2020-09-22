{ java_library_host, java_test_host }:
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

#  Code common to various time zone host tools.
tztools_common = java_library_host {
    name = "tztools_common";

    srcs = ["src/main/java/com/android/libcore/timezone/util/Errors.java"];
};

#  Code common to various time zone host tests.
tztools_common_testing = java_library_host {
    name = "tztools_common_testing";

    srcs = ["src/testing/java/com/android/libcore/timezone/testing/TestUtils.java"];
    libs = [
        "junit"
    ];
};

#  Tests for tztools_common and tztools_common_testing.
tztools_common_tests = java_test_host {
    name = "tztools_common_tests";

    srcs = ["src/test/java/com/android/libcore/timezone/util/ErrorsTest.java"];
    static_libs = [
        "junit"
        "tztools_common"
        "tztools_common_testing"
    ];
};

in { inherit tztools_common tztools_common_testing tztools_common_tests; }
