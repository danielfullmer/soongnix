{ android_app_certificate, apex, apex_key }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

"com.android.resolv" = apex {
    name = "com.android.resolv";
    manifest = "manifest.json";
    multilib = {
        first = {
            native_shared_libs = ["libnetd_resolv"];
        };
    };
    key = "com.android.resolv.key";
    certificate = ":com.android.resolv.certificate";

    #  Use a custom AndroidManifest.xml used for API targeting.
    androidManifest = "AndroidManifest.xml";
};

"com.android.resolv.key" = apex_key {
    name = "com.android.resolv.key";
    public_key = "com.android.resolv.avbpubkey";
    private_key = "com.android.resolv.pem";
};

"com.android.resolv.certificate" = android_app_certificate {
    name = "com.android.resolv.certificate";
    #  will use cert.pk8 and cert.x509.pem
    certificate = "testcert";
};

in { inherit "com.android.resolv" "com.android.resolv.certificate" "com.android.resolv.key"; }
