{ aidl_interface, filegroup }:
let

#
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
#
framework-statsd-aidl-sources = filegroup {
    name = "framework-statsd-aidl-sources";
    srcs = [
        "android/os/IPendingIntentRef.aidl"
        "android/os/IPullAtomCallback.aidl"
        "android/os/IPullAtomResultReceiver.aidl"
        "android/os/IStatsCompanionService.aidl"
        "android/os/IStatsManagerService.aidl"
        "android/os/IStatsd.aidl"
        "android/os/StatsDimensionsValueParcel.aidl"
        "android/util/StatsEventParcel.aidl"
    ];
};

statsd-aidl = aidl_interface {
    name = "statsd-aidl";
    unstable = true;
    srcs = [
        "android/os/IPendingIntentRef.aidl"
        "android/os/IPullAtomCallback.aidl"
        "android/os/IPullAtomResultReceiver.aidl"
        "android/os/IStatsCompanionService.aidl"
        "android/os/IStatsd.aidl"
        "android/os/StatsDimensionsValueParcel.aidl"
        "android/util/StatsEventParcel.aidl"
    ];
    backend = {
        java = {
            enabled = false; #  framework-statsd and service-statsd use framework-statsd-aidl-sources
        };
        cpp = {
            enabled = false;
        };
        ndk = {
            enabled = true;
            apex_available = [
                #  TODO(b/145923087): Remove this once statsd binary is in apex
                "//apex_available:platform"

                "com.android.os.statsd"
                "test_com.android.os.statsd"
            ];
        };
    };
};

in { inherit framework-statsd-aidl-sources statsd-aidl; }
