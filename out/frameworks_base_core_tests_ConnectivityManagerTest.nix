{ android_test }:
let

#  Copyright (C) 2010, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

ConnectivityManagerTest = android_test {
    name = "ConnectivityManagerTest";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    #  Include all test java files.
    srcs = [
        "src/com/android/connectivitymanagertest/ConnectivityManagerStressTestRunner.java"
        "src/com/android/connectivitymanagertest/ConnectivityManagerTestBase.java"
        "src/com/android/connectivitymanagertest/ConnectivityManagerTestRunner.java"
        "src/com/android/connectivitymanagertest/ConnectivityManagerUnitTestRunner.java"
        "src/com/android/connectivitymanagertest/WifiAssociationTestRunner.java"
        "src/com/android/connectivitymanagertest/WifiConfigurationHelper.java"
        "src/com/android/connectivitymanagertest/functional/ConnectivityManagerMobileTest.java"
        "src/com/android/connectivitymanagertest/functional/WifiAssociationTest.java"
        "src/com/android/connectivitymanagertest/functional/WifiConnectionTest.java"
        "src/com/android/connectivitymanagertest/stress/WifiStressTest.java"
        "src/com/android/connectivitymanagertest/unit/WifiClientTest.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit ConnectivityManagerTest; }
