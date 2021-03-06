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

CaptivePortalLoginDefaults = java_defaults {
    name = "CaptivePortalLoginDefaults";
    srcs = ["src/com/android/captiveportallogin/CaptivePortalLoginActivity.java"];
    sdk_version = "system_current";
    min_sdk_version = "28";
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "metrics-constants-protos"
        "captiveportal-lib"
    ];
    manifest = "AndroidManifest.xml";
    plugins = ["java_api_finder"];
};

CaptivePortalLogin = android_app {
    name = "CaptivePortalLogin";
    defaults = ["CaptivePortalLoginDefaults"];
    certificate = "networkstack";
};

#  Alternative CaptivePortalLogin signed with the platform cert, to use
#  with InProcessNetworkStack.
PlatformCaptivePortalLogin = android_app {
    name = "PlatformCaptivePortalLogin";
    defaults = ["CaptivePortalLoginDefaults"];
    certificate = "platform";
    overrides = ["CaptivePortalLogin"];
};

in { inherit CaptivePortalLogin CaptivePortalLoginDefaults PlatformCaptivePortalLogin; }
