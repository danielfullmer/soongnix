{ java_library_static }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

wycheproof = java_library_static {
    name = "wycheproof";
    srcs = ["java/**/*.java"];
    exclude_srcs = [
        "java/com/google/security/wycheproof/SpongyCastleTest.java"
        "java/com/google/security/wycheproof/SpongyCastleAllTests.java"
    ];
    no_standard_libs = true;
    libs = [
        "core-oj"
        "core-libart"
        "bouncycastle"
        "conscrypt"
        "junit"
    ];
    system_modules = "core-system-modules";
};

in { inherit wycheproof; }
