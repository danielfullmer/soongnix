{ java_library }:
let

#  Copyright (C) 2015 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

compatibility-device-info = java_library {
    name = "compatibility-device-info";

    srcs = [
        "src/com/android/compatibility/common/deviceinfo/AppStandbyDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/ClientIdDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/ConfigurationDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/CpuDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/DeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/FeatureDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/GenericDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/GlesStubActivity.java"
        "src/com/android/compatibility/common/deviceinfo/GraphicsDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/LocaleDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/MediaDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/MemoryDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/PackageDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/PropertyDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/ScreenDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/StorageDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/UserDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/VintfDeviceInfo.java"
        "src/com/android/compatibility/common/deviceinfo/VintfFilesCollector.java"
    ];

    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "junit"
    ];

    libs = [
        "android.test.base.stubs"
    ];

    sdk_version = "test_current";
};

in { inherit compatibility-device-info; }
