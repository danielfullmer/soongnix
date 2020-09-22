{ android_app, android_test }:
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

FusedLocation = android_app {
    name = "FusedLocation";
    srcs = [
        "src/com/android/location/fused/FusedLocationProvider.java"
        "src/com/android/location/fused/FusedLocationService.java"
    ];
    libs = ["com.android.location.provider"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

FusedLocationTests = android_test {
    name = "FusedLocationTests";
    manifest = "test/AndroidManifest.xml";
    test_config = "test/AndroidTest.xml";
    srcs = [
        "test/src/com/android/location/fused/tests/FusedLocationServiceTest.java"
        "src/com/android/location/fused/FusedLocationProvider.java" #  include real sources because we're forced to test this directly
        "src/com/android/location/fused/FusedLocationService.java"
    ];
    libs = [
        "android.test.base"
        "android.test.runner"
        "com.android.location.provider"
    ];
    static_libs = [
        "androidx.test.core"
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "androidx.test.ext.truth"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
    ];
    test_suites = ["device-tests"];
};

in { inherit FusedLocation FusedLocationTests; }
