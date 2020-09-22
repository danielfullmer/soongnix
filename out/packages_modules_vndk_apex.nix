{ android_app_certificate, apex_key, apex_vndk, override_apex }:
let

#  Copyright 2019 Google Inc. All rights reserved.
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

"com.android.vndk.current" = apex_vndk {
    name = "com.android.vndk.current";
    manifest = "apex_manifest.current.json";
    key = "com.android.vndk.current.key";
    certificate = ":com.android.vndk.current.certificate";
    file_contexts = ":com.android.vndk-file_contexts";
};

"com.android.vndk.current.on_vendor" = override_apex {
    name = "com.android.vndk.current.on_vendor";
    base = "com.android.vndk.current";
    vendor = true;
};

"com.android.vndk.current.key" = apex_key {
    name = "com.android.vndk.current.key";
    public_key = "com.android.vndk.current.pubkey";
    private_key = "com.android.vndk.current.pem";
};

"com.android.vndk.current.certificate" = android_app_certificate {
    name = "com.android.vndk.current.certificate";
    certificate = "com.android.vndk.current";
};

"com.android.vndk.v29" = apex_vndk {
    name = "com.android.vndk.v29";
    manifest = "apex_manifest.v29.json";
    key = "com.android.vndk.v29.key";
    certificate = ":com.android.vndk.v29.certificate";
    vndk_version = "29";
    system_ext_specific = true;
    file_contexts = ":com.android.vndk-file_contexts";
};

"com.android.vndk.v29.key" = apex_key {
    name = "com.android.vndk.v29.key";
    public_key = "com.android.vndk.v29.pubkey";
    private_key = "com.android.vndk.v29.pem";
};

"com.android.vndk.v29.certificate" = android_app_certificate {
    name = "com.android.vndk.v29.certificate";
    certificate = "com.android.vndk.v29";
};

"com.android.vndk.v28" = apex_vndk {
    name = "com.android.vndk.v28";
    manifest = "apex_manifest.v28.json";
    key = "com.android.vndk.v28.key";
    certificate = ":com.android.vndk.v28.certificate";
    vndk_version = "28";
    system_ext_specific = true;
    file_contexts = ":com.android.vndk-file_contexts";
};

"com.android.vndk.v28.key" = apex_key {
    name = "com.android.vndk.v28.key";
    public_key = "com.android.vndk.v28.pubkey";
    private_key = "com.android.vndk.v28.pem";
};

"com.android.vndk.v28.certificate" = android_app_certificate {
    name = "com.android.vndk.v28.certificate";
    certificate = "com.android.vndk.v28";
};

"com.android.vndk.v27" = apex_vndk {
    name = "com.android.vndk.v27";
    manifest = "apex_manifest.v27.json";
    key = "com.android.vndk.v27.key";
    certificate = ":com.android.vndk.v27.certificate";
    vndk_version = "27";
    system_ext_specific = true;
    file_contexts = ":com.android.vndk-file_contexts";
};

"com.android.vndk.v27.key" = apex_key {
    name = "com.android.vndk.v27.key";
    public_key = "com.android.vndk.v27.pubkey";
    private_key = "com.android.vndk.v27.pem";
};

"com.android.vndk.v27.certificate" = android_app_certificate {
    name = "com.android.vndk.v27.certificate";
    certificate = "com.android.vndk.v27";
};

in { inherit "com.android.vndk.current" "com.android.vndk.current.certificate" "com.android.vndk.current.key" "com.android.vndk.current.on_vendor" "com.android.vndk.v27" "com.android.vndk.v27.certificate" "com.android.vndk.v27.key" "com.android.vndk.v28" "com.android.vndk.v28.certificate" "com.android.vndk.v28.key" "com.android.vndk.v29" "com.android.vndk.v29.certificate" "com.android.vndk.v29.key"; }
