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

car-setup-wizard-lib = android_library {
    name = "car-setup-wizard-lib";
    srcs = [
        "src/com/android/car/setupwizardlib/BaseActivity.java"
        "src/com/android/car/setupwizardlib/BaseCompatActivity.java"
        "src/com/android/car/setupwizardlib/BaseDesignActivity.java"
        "src/com/android/car/setupwizardlib/BaseSetupWizardActivity.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardBaseLayout.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardCompatLayout.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardDesignLayout.java"
        "src/com/android/car/setupwizardlib/CarSetupWizardLayout.java"
        "src/com/android/car/setupwizardlib/partner/PartnerConfig.java"
        "src/com/android/car/setupwizardlib/partner/PartnerConfigHelper.java"
        "src/com/android/car/setupwizardlib/partner/PartnerConfigKey.java"
        "src/com/android/car/setupwizardlib/partner/ResourceEntry.java"
        "src/com/android/car/setupwizardlib/summary/DeferredAction.java"
        "src/com/android/car/setupwizardlib/summary/PartnerSummaryActionsCollector.java"
        "src/com/android/car/setupwizardlib/summary/SummaryAction.java"
        "src/com/android/car/setupwizardlib/util/CarDrivingStateMonitor.java"
        "src/com/android/car/setupwizardlib/util/CarHelperInjectionContext.java"
        "src/com/android/car/setupwizardlib/util/CarHelperRegistry.java"
        "src/com/android/car/setupwizardlib/util/CarOrientationHelper.java"
        "src/com/android/car/setupwizardlib/util/CarSetupWizardUiUtils.java"
        "src/com/android/car/setupwizardlib/util/CarWizardManagerHelper.java"
        "src/com/android/car/setupwizardlib/util/ResultCodes.java"
    ];
    resource_dirs = ["res"];
    libs = ["android.car-system-stubs"];
    static_libs = ["androidx.car_car-resources-partially-dejetified"];
    optimize = {
        enabled = false;
    };
    min_sdk_version = "26";
};

in { inherit car-setup-wizard-lib; }
