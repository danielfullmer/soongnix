{ android_app_certificate, apex, apex_defaults, apex_key, filegroup }:
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

#  Defaults shared between real and test versions of the APEX.
"com.android.conscrypt-defaults" = apex_defaults {
    name = "com.android.conscrypt-defaults";
    androidManifest = ":com.android.conscrypt-androidManifest";
    compile_multilib = "both";
    java_libs = ["conscrypt"];
    native_shared_libs = ["libjavacrypto"];
    key = "apex.conscrypt.key";
    certificate = ":com.android.conscrypt.certificate";
};

"com.android.conscrypt-androidManifest" = filegroup {
    name = "com.android.conscrypt-androidManifest";
    srcs = ["AndroidManifest.xml"];
};

"apex.conscrypt.key" = apex_key {
    name = "apex.conscrypt.key";
    public_key = "com.android.conscrypt.avbpubkey";
    private_key = "com.android.conscrypt.pem";
};

"com.android.conscrypt.certificate" = android_app_certificate {
    name = "com.android.conscrypt.certificate";
    certificate = "com.android.conscrypt";
};

#  Production APEX
"com.android.conscrypt" = apex {
    name = "com.android.conscrypt";
    defaults = ["com.android.conscrypt-defaults"];
    manifest = "apex_manifest.json";
};

in { inherit "apex.conscrypt.key" "com.android.conscrypt" "com.android.conscrypt-androidManifest" "com.android.conscrypt-defaults" "com.android.conscrypt.certificate"; }
