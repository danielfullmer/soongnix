{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsLibcoreLegacy22TestCases = android_test {
    name = "CtsLibcoreLegacy22TestCases";
    defaults = ["cts_defaults"];
    static_libs = ["ctstestrunner-axt"];
    srcs = ["src/android/util/cts/FloatMathTest.java"];
    sdk_version = "22";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsLibcoreLegacy22TestCases; }