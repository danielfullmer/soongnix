{ android_library }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

#  This is an unbundled target, sdk_version must be "system_current". If the car library is ever
#  needed, android."car-stubs" or "android.car-system-stubs" must be used.
car-arch-common = android_library {
    name = "car-arch-common";

    srcs = [
        "src/com/android/car/arch/common/FutureData.java"
        "src/com/android/car/arch/common/LiveDataFunctions.java"
        "src/com/android/car/arch/common/switching/SwitchingLiveData.java"
        "src/com/android/car/arch/common/switching/SwitchingLiveDataImpl.java"
        "src/com/android/car/arch/common/testing/CaptureObserver.java"
        "src/com/android/car/arch/common/testing/InstantTaskExecutorRule.java"
        "src/com/android/car/arch/common/testing/TestLifecycleOwner.java"
    ];

    optimize = {
        enabled = false;
    };

    sdk_version = "system_current";

    static_libs = [
        "androidx.lifecycle_lifecycle-extensions"
        "androidx.lifecycle_lifecycle-common-java8"
        "androidx.annotation_annotation"
        "junit"
    ];
};

in { inherit car-arch-common; }
