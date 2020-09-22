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

LocationCtsCommon = java_library {
    name = "LocationCtsCommon";
    srcs = [
        "src/android/location/cts/common/BroadcastCapture.java"
        "src/android/location/cts/common/GetCurrentLocationCapture.java"
        "src/android/location/cts/common/GnssTestCase.java"
        "src/android/location/cts/common/LocationListenerCapture.java"
        "src/android/location/cts/common/LocationPendingIntentCapture.java"
        "src/android/location/cts/common/ProximityPendingIntentCapture.java"
        "src/android/location/cts/common/SoftAssert.java"
        "src/android/location/cts/common/TestGnssMeasurementListener.java"
        "src/android/location/cts/common/TestLocationListener.java"
        "src/android/location/cts/common/TestLocationManager.java"
        "src/android/location/cts/common/TestMeasurementUtil.java"
        "src/android/location/cts/common/TestUtils.java"
    ];
    libs = [
        "compatibility-device-util-axt"
        "android.test.base.stubs"
    ];
};

in { inherit LocationCtsCommon; }
