{ java_library }:
let

#  Copyright (C) 2020 Google Inc.
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

chre-cross-validation = java_library {
    name = "chre-cross-validation";

    srcs = [
        "src/com/google/android/chre/test/crossvalidator/ApSensorDatapoint.java"
        "src/com/google/android/chre/test/crossvalidator/ChreCrossValidatorBase.java"
        "src/com/google/android/chre/test/crossvalidator/ChreCrossValidatorSensor.java"
        "src/com/google/android/chre/test/crossvalidator/ChreCrossValidatorWifi.java"
        "src/com/google/android/chre/test/crossvalidator/ChreSensorDatapoint.java"
        "src/com/google/android/chre/test/crossvalidator/SensorDatapoint.java"
    ];

    static_libs = [
        "chre-test-utils"
        "androidx.test.rules"
        "chrecrossvalidation_sensor_java_proto"
        "chrecrossvalidation_wifi_java_proto"
        "chre_test_common_java_proto"
        "guava"
    ];

    sdk_version = "system_current";
};

in { inherit chre-cross-validation; }
