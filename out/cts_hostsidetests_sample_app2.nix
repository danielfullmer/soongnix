{ android_test_helper_app }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

CtsSampleDeviceApp2 = android_test_helper_app {
    name = "CtsSampleDeviceApp2";
    defaults = ["cts_defaults"];
    static_libs = ["androidx.test.rules"];
    srcs = ["src/android/sample/cts/app2/SampleDeviceTest.java"];
    sdk_version = "current";
};

in { inherit CtsSampleDeviceApp2; }