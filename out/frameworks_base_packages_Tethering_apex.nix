{ android_app_certificate, apex, apex_key, override_apex }:
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

"com.android.tethering" = apex {
    name = "com.android.tethering";
    updatable = true;
    min_sdk_version = "current";
    java_libs = ["framework-tethering"];
    apps = ["Tethering"];
    manifest = "manifest.json";
    key = "com.android.tethering.key";

    androidManifest = "AndroidManifest.xml";
};

"com.android.tethering.key" = apex_key {
    name = "com.android.tethering.key";
    public_key = "com.android.tethering.avbpubkey";
    private_key = "com.android.tethering.pem";
};

"com.android.tethering.certificate" = android_app_certificate {
    name = "com.android.tethering.certificate";
    certificate = "com.android.tethering";
};

"com.android.tethering.inprocess" = override_apex {
    name = "com.android.tethering.inprocess";
    base = "com.android.tethering";
    package_name = "com.android.tethering.inprocess";
    apps = [
        "InProcessTethering"
    ];
};

in { inherit "com.android.tethering" "com.android.tethering.certificate" "com.android.tethering.inprocess" "com.android.tethering.key"; }
