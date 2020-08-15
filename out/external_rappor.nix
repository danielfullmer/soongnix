{ java_library }:
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

rappor = java_library {
    name = "rappor";
    java_version = "1.7";
    sdk_version = "core_current";
    libs = [
        "jsr305"
    ];
    srcs = [
        "client/java/com/google/android/rappor/Encoder.java"
        "client/java/com/google/android/rappor/HmacDrbg.java"
    ];
};

rappor-tests = java_library {
    name = "rappor-tests";
    java_version = "1.7";
    static_libs = [
        "hamcrest-library"
        "rappor"
        "guava"
        "junit"
    ];
    libs = ["jsr305"];
    sdk_version = "core_current";
    srcs = [
        "client/javatest/com/google/android/rappor/EncoderTest.java"
        "client/javatest/com/google/android/rappor/HmacDrbgTest.java"
    ];
};

in { inherit rappor rappor-tests; }
