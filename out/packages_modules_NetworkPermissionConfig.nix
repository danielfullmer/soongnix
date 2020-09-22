{ android_app, java_defaults }:
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

NetworkPermissionConfigDefaults = java_defaults {
    name = "NetworkPermissionConfigDefaults";
    #  TODO: mark app as hasCode=false in manifest once soong stops complaining about apps without
    #  a classes.dex.
    srcs = ["src/com/android/server/NetworkPermissionConfig.java"];
    platform_apis = true;
    privileged = true;
    manifest = "AndroidManifest.xml";
};

#  Stub APK to define permissions for NetworkStack
NetworkPermissionConfig = android_app {
    name = "NetworkPermissionConfig";
    defaults = ["NetworkPermissionConfigDefaults"];
    certificate = "networkstack";
    target_sdk_version = "30";
    min_sdk_version = "29";
};

#  Alternative stub APK signed with platform certificate. To use with InProcessNetworkStack.
PlatformNetworkPermissionConfig = android_app {
    name = "PlatformNetworkPermissionConfig";
    defaults = ["NetworkPermissionConfigDefaults"];
    certificate = "platform";
    overrides = ["NetworkPermissionConfig"];
};

in { inherit NetworkPermissionConfig NetworkPermissionConfigDefaults PlatformNetworkPermissionConfig; }
