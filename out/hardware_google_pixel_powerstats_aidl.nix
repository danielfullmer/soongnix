{ aidl_interface }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

pixelpowerstats_provider_aidl_interface = aidl_interface {
    name = "pixelpowerstats_provider_aidl_interface";
    unstable = true;
    srcs = [
        "android/vendor/powerstats/IPixelPowerStatsProvider.aidl"
        "android/vendor/powerstats/IPixelPowerStatsCallback.aidl"
        "android/vendor/powerstats/StateResidencyData.aidl"
    ];

    #  TODO(b/124131159): I get an error when I remove this
    backend = {
        ndk = {
            enabled = false;
        };
    };
    vendor_available = true;
};

in { inherit pixelpowerstats_provider_aidl_interface; }
