{ android_test_helper_app }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

DeviceSetupUtil = android_test_helper_app {
    name = "DeviceSetupUtil";
    srcs = [
        "src/com/android/tradefed/utils/DeviceSetupIntentReceiver.java"
        "src/com/android/tradefed/utils/DeviceSetupService.java"
        "src/com/android/tradefed/utils/MainActivity.java"
    ];
    sdk_version = "8";
};

in { inherit DeviceSetupUtil; }
