{ android_test }:
let

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

MetricsHelperTests = android_test {
    name = "MetricsHelperTests";

    platform_apis = true;

    srcs = ["src/**/*.java"];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = [
        "android-support-test"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
        "metrics-helper-lib"
        "framework-protos"
    ];
};

in { inherit MetricsHelperTests; }
