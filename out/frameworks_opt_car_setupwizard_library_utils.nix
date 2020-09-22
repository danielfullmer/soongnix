{ android_library }:
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
#

car-setup-wizard-lib-utils = android_library {
    name = "car-setup-wizard-lib-utils";
    srcs = [
        "src/com/android/car/setupwizardlib/InitialLockListener.java"
        "src/com/android/car/setupwizardlib/InitialLockSetupClient.java"
        "src/com/android/car/setupwizardlib/InitialLockSetupConstants.java"
        "src/com/android/car/setupwizardlib/InitialLockSetupHelper.java"
        "src/com/android/car/setupwizardlib/LockConfig.java"
        "src/com/android/car/setupwizardlib/IInitialLockSetupService.aidl"
        "src/com/android/car/setupwizardlib/LockConfig.aidl"
    ];
    libs = ["android.car-system-stubs"];
    optimize = {
        enabled = false;
    };
    min_sdk_version = "26";
};

in { inherit car-setup-wizard-lib-utils; }
