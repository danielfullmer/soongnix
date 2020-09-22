{ java_library }:
let

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
#

#  Experimental API backed by Experimental Car service.

car-experimental-api-static-lib = java_library {

    name = "car-experimental-api-static-lib";

    srcs = [
        "src/android/car/experimental/CarDriverDistractionManager.java"
        "src/android/car/experimental/CarTestDemoExperimentalFeatureManager.java"
        "src/android/car/experimental/DriverAwarenessEvent.java"
        "src/android/car/experimental/DriverAwarenessSupplierConfig.java"
        "src/android/car/experimental/DriverAwarenessSupplierService.java"
        "src/android/car/experimental/DriverDistractionChangeEvent.java"
        "src/android/car/experimental/ExperimentalCar.java"
        "src/android/car/experimental/DriverAwarenessEvent.aidl"
        "src/android/car/experimental/DriverAwarenessSupplierConfig.aidl"
        "src/android/car/experimental/DriverDistractionChangeEvent.aidl"
        "src/android/car/experimental/IDriverAwarenessSupplier.aidl"
        "src/android/car/experimental/IDriverAwarenessSupplierCallback.aidl"
        "src/android/car/experimental/IDriverDistractionChangeListener.aidl"
        "src/android/car/experimental/IDriverDistractionManager.aidl"
        "src/android/car/experimental/ITestDemoExperimental.aidl"
    ];

    libs = ["android.car"];

    platform_apis = true;

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit car-experimental-api-static-lib; }
