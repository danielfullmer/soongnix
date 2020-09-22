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

vehicle-hal-support-lib = java_library {

    name = "vehicle-hal-support-lib";

    srcs = [
        "src/com/android/car/vehiclehal/DiagnosticEventBuilder.java"
        "src/com/android/car/vehiclehal/DiagnosticJson.java"
        "src/com/android/car/vehiclehal/DiagnosticJsonReader.java"
        "src/com/android/car/vehiclehal/Utils.java"
        "src/com/android/car/vehiclehal/VehiclePropValueBuilder.java"
        "src/com/android/car/vehiclehal/test/VehiclePropConfigBuilder.java"
    ];

    static_libs = [
        "android.hidl.base-V1.0-java"
        "android.hardware.automotive.vehicle-V2.0-java"
    ];

};

vehicle-hal-support-lib-for-test = java_library {

    name = "vehicle-hal-support-lib-for-test";

    srcs = ["test/com/android/car/vehiclehal/test/MockedVehicleHal.java"];

    static_libs = [
        "vehicle-hal-support-lib"
        "junit"
    ];

};

in { inherit vehicle-hal-support-lib vehicle-hal-support-lib-for-test; }
