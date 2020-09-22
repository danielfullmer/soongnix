{ aidl_interface }:
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

carwatchdog_aidl_interface = aidl_interface {
    name = "carwatchdog_aidl_interface";
    vendor_available = true;
    srcs = [
        "android/automotive/watchdog/BootPhase.aidl"
        "android/automotive/watchdog/ICarWatchdog.aidl"
        "android/automotive/watchdog/ICarWatchdogClient.aidl"
        "android/automotive/watchdog/ICarWatchdogMonitor.aidl"
        "android/automotive/watchdog/PowerCycle.aidl"
        "android/automotive/watchdog/StateType.aidl"
        "android/automotive/watchdog/TimeoutLength.aidl"
        "android/automotive/watchdog/UserState.aidl"
    ];
    stability = "vintf";
    backend = {
        java = {
            platform_apis = true;
            enabled = true;
        };
    };
    versions = [
        "2"
    ];
};

in { inherit carwatchdog_aidl_interface; }
