{ android_test }:
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

FrameworksMockingServicesTests = android_test {
    name = "FrameworksMockingServicesTests";

    srcs = ["src/**/*.java"];

    static_libs = [
        "services.core"
        "services.net"
        "androidx.test.runner"
        "mockito-target-extended-minus-junit4"
        "platform-test-annotations"
        "truth-prebuilt"
    ];

    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
    ];

    jni_libs = [
        "libdexmakerjvmtiagent"
        "libpsi"
        "libstaticjvmtiagent"
    ];

    certificate = "platform";
    platform_apis = true;
    test_suites = ["device-tests"];

    optimize = {
        enabled = false;
    };
};

in { inherit FrameworksMockingServicesTests; }
