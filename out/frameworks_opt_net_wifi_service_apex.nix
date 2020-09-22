{ android_app_certificate, apex, apex_defaults, apex_key, filegroup }:
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

"com.android.wifi-defaults" = apex_defaults {
    name = "com.android.wifi-defaults";
    androidManifest = ":com.android.wifi-androidManifest";
    java_libs = [
        "service-wifi"
        "framework-wifi"
    ];
    #  from build rule `cacerts_wfa`
    prebuilts = [
        "target-cacert-wifi-674b5f5b.0"
        "target-cacert-wifi-21125ccd.0"
        "target-cacert-wifi-ea93cb5b.0"
    ];
    key = "com.android.wifi.key";
    certificate = ":com.android.wifi.certificate";
    apps = [
        "OsuLogin"
        "ServiceWifiResources"
    ];
};

"com.android.wifi-androidManifest" = filegroup {
    name = "com.android.wifi-androidManifest";
    srcs = ["AndroidManifest.xml"];
};

#  Mainline wifi apex module.
"com.android.wifi" = apex {
    name = "com.android.wifi";
    defaults = ["com.android.wifi-defaults"];
    manifest = "apex_manifest.json";
};

"com.android.wifi.key" = apex_key {
    name = "com.android.wifi.key";
    public_key = "com.android.wifi.avbpubkey";
    private_key = "com.android.wifi.pem";
};

"com.android.wifi.certificate" = android_app_certificate {
    name = "com.android.wifi.certificate";
    certificate = "com.android.wifi";
};

in { inherit "com.android.wifi" "com.android.wifi-androidManifest" "com.android.wifi-defaults" "com.android.wifi.certificate" "com.android.wifi.key"; }
