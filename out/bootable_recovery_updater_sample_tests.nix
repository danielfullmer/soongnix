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

SystemUpdaterSampleTests = android_test {
    name = "SystemUpdaterSampleTests";
    sdk_version = "system_current";

    libs = [
        "android.test.base.stubs"
        "android.test.runner.stubs"
        "SystemUpdaterSample"
    ];

    static_libs = [
        "androidx.test.runner"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "guava"
    ];

    instrumentation_for = "SystemUpdaterSample";

    optimize = {
        enabled = false;
    };

    resource_dirs = ["res"];

    srcs = ["src/**/*.java"];
};

in { inherit SystemUpdaterSampleTests; }
