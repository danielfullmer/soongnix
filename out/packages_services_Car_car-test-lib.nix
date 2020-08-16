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
        "src/android/car/testapi/CarProjectionController.java"
        "src/android/car/testapi/CarPropertyController.java"
        "src/android/car/testapi/FakeCar.java"
        "src/android/car/testapi/FakeCarProjectionService.java"
        "src/android/car/testapi/FakeCarPropertyService.java"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    static_libs = [
        "android.car"
        "mockito"
    ];
    installable = false;
};

in { inherit "android.car.testapi"; }
