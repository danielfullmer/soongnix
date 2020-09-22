{ sysprop_library }:
let

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

PlatformProperties = sysprop_library {
    name = "PlatformProperties";
    srcs = [
        "android/sysprop/AdbProperties.sysprop"
        "android/sysprop/ApkVerityProperties.sysprop"
        "android/sysprop/CarProperties.sysprop"
        "android/sysprop/ContactsProperties.sysprop"
        "android/sysprop/CryptoProperties.sysprop"
        "android/sysprop/DisplayProperties.sysprop"
        "android/sysprop/HdmiProperties.sysprop"
        "android/sysprop/MediaProperties.sysprop"
        "android/sysprop/OtaProperties.sysprop"
        "android/sysprop/PowerProperties.sysprop"
        "android/sysprop/SetupWizardProperties.sysprop"
        "android/sysprop/TelephonyProperties.sysprop"
        "android/sysprop/TraceProperties.sysprop"
        "android/sysprop/VndkProperties.sysprop"
        "android/sysprop/VoldProperties.sysprop"
        "android/sysprop/WifiProperties.sysprop"
    ];
    property_owner = "Platform";
    api_packages = ["android.sysprop"];

    apex_available = [
        "//apex_available:platform"
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

in { inherit PlatformProperties; }
