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

"android.car.testapi" = java_library {
    name = "android.car.testapi";
    srcs = [
        "src/android/car/testapi/BlockingUserLifecycleListener.java"
        "src/android/car/testapi/CarAppFocusController.java"
        "src/android/car/testapi/CarMockitoHelper.java"
        "src/android/car/testapi/CarNavigationStatusController.java"
        "src/android/car/testapi/CarProjectionController.java"
        "src/android/car/testapi/CarPropertyController.java"
        "src/android/car/testapi/CarUxRestrictionsController.java"
        "src/android/car/testapi/FakeAppFocusService.java"
        "src/android/car/testapi/FakeCar.java"
        "src/android/car/testapi/FakeCarProjectionService.java"
        "src/android/car/testapi/FakeCarPropertyService.java"
        "src/android/car/testapi/FakeCarUxRestrictionsService.java"
        "src/android/car/testapi/FakeInstrumentClusterNavigation.java"
        "src/android/car/testapi/FakeSystemActivityMonitoringService.java"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    static_libs = [
        "android.car"
        "car-service-test-lib"
    ];
    libs = [
        "mockito"
    ];
    installable = false;
    dist = {
        targets = ["dist_files"];
    };
};

"android.car.test.utils" = java_library {
    name = "android.car.test.utils";
    srcs = [
        "src/android/car/test/mocks/AbstractExtendedMockitoTestCase.java"
        "src/android/car/test/mocks/AndroidMockitoHelper.java"
        "src/android/car/test/mocks/BlockingAnswer.java"
        "src/android/car/test/mocks/CarArgumentMatchers.java"
        "src/android/car/test/mocks/JavaMockitoHelper.java"
        "src/android/car/test/mocks/SyncAnswer.java"
        "src/android/car/test/util/BlockingResultReceiver.java"
        "src/android/car/test/util/UserTestingHelper.java"
        "src/android/car/test/util/VehicleHalTestingHelper.java"
        "src/android/car/test/util/Visitor.java"
    ];
    libs = [
        "android.hardware.automotive.vehicle-V2.0-java"
        "mockito-target-extended"
        "compatibility-device-util-axt"
    ];
};

in { inherit "android.car.test.utils" "android.car.testapi"; }
