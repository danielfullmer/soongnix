{ android_app }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

DirectRenderingCluster = android_app {
    name = "DirectRenderingCluster";

    srcs = [
        "src/android/car/cluster/ActivityMonitor.java"
        "src/android/car/cluster/CarInfoFragment.java"
        "src/android/car/cluster/ClusterDisplayProvider.java"
        "src/android/car/cluster/ClusterRenderingService.java"
        "src/android/car/cluster/ClusterViewModel.java"
        "src/android/car/cluster/CueView.java"
        "src/android/car/cluster/FakeFreeNavigationActivity.java"
        "src/android/car/cluster/HeartBeatLiveData.java"
        "src/android/car/cluster/ImageResolver.java"
        "src/android/car/cluster/LaneView.java"
        "src/android/car/cluster/LoggingClusterRenderingService.java"
        "src/android/car/cluster/MainClusterActivity.java"
        "src/android/car/cluster/MusicFragment.java"
        "src/android/car/cluster/MusicFragmentViewModel.java"
        "src/android/car/cluster/NavStateController.java"
        "src/android/car/cluster/NavigationFragment.java"
        "src/android/car/cluster/PhoneFragment.java"
        "src/android/car/cluster/PhoneFragmentViewModel.java"
        "src/android/car/cluster/PhoneNumberInfoLiveData.java"
        "src/android/car/cluster/SelfRefreshDescriptionLiveData.java"
        "src/android/car/cluster/sensors/Sensor.java"
        "src/android/car/cluster/sensors/Sensors.java"
    ];

    platform_apis = true;

    #  Each update should be signed by OEMs
    certificate = "platform";
    privileged = true;

    optimize = {
        proguard_flags_files = ["proguard.flags"];
        enabled = false;
    };

    resource_dirs = ["res"];

    static_libs = [
        "android.car.cluster.navigation"
        "androidx.legacy_legacy-support-v4"
        "androidx-constraintlayout_constraintlayout"
        "car-arch-common"
        "car-media-common"
        "car-telephony-common"
        "car-apps-common"
    ];

    libs = ["android.car"];

    required = ["privapp_whitelist_android.car.cluster"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit DirectRenderingCluster; }
