{ java_library_static, java_test_host }:
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

test-composers-tests = java_library_static {
    name = "test-composers-tests";
    srcs = [
        "src/android/host/test/composer/IterateTest.java"
        "src/android/host/test/composer/IterateTestBase.java"
        "src/android/host/test/composer/ShuffleTest.java"
        "src/android/host/test/composer/ShuffleTestBase.java"
    ];
    sdk_version = "current";
    host_supported = true;
    libs = [
        "guava"
        "test-composers"
        "truth-prebuilt"
    ];
    target = {
        android = {
            libs = [
                "junit"
                "mockito-target"
            ];
        };
        host = {
            libs = [
                "junit-host"
                "mockito"
                "objenesis"
            ];
        };
    };
};

# #####################################

HostTestComposersTests = java_test_host {
    name = "HostTestComposersTests";
    static_libs = [
        "guava"
        "junit-host"
        "test-composers"
        "test-composers-tests"
        "truth-host-prebuilt"
        "mockito"
        "objenesis"
    ];
};

in { inherit HostTestComposersTests test-composers-tests; }
