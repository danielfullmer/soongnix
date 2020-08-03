{ android_test }:
let

#
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
#

#  Android Unit Test target
CollectorDeviceLibPlatformTest = android_test {
    name = "CollectorDeviceLibPlatformTest";
    defaults = ["tradefed_errorprone_defaults"];

    srcs = ["android/**/*.java"];
    static_libs = [
        "androidx.test.runner"
        "collector-device-lib-platform"
        "junit"
        "mockito-target-minus-junit4"
        "perfetto-helper"
        "platformprotoslite"
        "ub-uiautomator"
    ];
    platform_apis = true;
};

in { inherit CollectorDeviceLibPlatformTest; }
