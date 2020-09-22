{ android_app_import }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CtsShimTargetPSdkPrebuilt = android_app_import {
    name = "CtsShimTargetPSdkPrebuilt";
    #  Make sure the build system doesn't try to resign the APK
    dex_preopt = {
        enabled = false;
    };
    arch = {
        arm = {
            apk = "arm/CtsShimTargetPSdk.apk";
        };
        arm64 = {
            apk = "arm/CtsShimTargetPSdk.apk";
        };
        x86 = {
            apk = "x86/CtsShimTargetPSdk.apk";
        };
        x86_64 = {
            apk = "x86/CtsShimTargetPSdk.apk";
        };
    };
    presigned = true;
};

in { inherit CtsShimTargetPSdkPrebuilt; }
