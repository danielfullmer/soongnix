{ android_app_certificate, apex, apex_defaults, apex_key }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

"com.android.extservices" = apex {
    name = "com.android.extservices";
    defaults = ["com.android.extservices-defaults"];
    manifest = "apex_manifest.json";
};

"com.android.extservices-defaults" = apex_defaults {
    name = "com.android.extservices-defaults";
    updatable = true;
    min_sdk_version = "current";
    key = "com.android.extservices.key";
    certificate = ":com.android.extservices.certificate";
    apps = ["ExtServices"];
};

"com.android.extservices.key" = apex_key {
    name = "com.android.extservices.key";
    public_key = "com.android.extservices.avbpubkey";
    private_key = "com.android.extservices.pem";
};

"com.android.extservices.certificate" = android_app_certificate {
    name = "com.android.extservices.certificate";
    certificate = "com.android.extservices";
};

in { inherit "com.android.extservices" "com.android.extservices-defaults" "com.android.extservices.certificate" "com.android.extservices.key"; }
