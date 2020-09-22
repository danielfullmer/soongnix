{ android_app_certificate, apex, apex_defaults, apex_key }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

"com.android.permission" = apex {
    name = "com.android.permission";
    defaults = ["com.android.permission-defaults"];
    manifest = "apex_manifest.json";
};

"com.android.permission-defaults" = apex_defaults {
    name = "com.android.permission-defaults";
    updatable = true;
    min_sdk_version = "R";
    key = "com.android.permission.key";
    certificate = ":com.android.permission.certificate";
    java_libs = [
        "framework-permission"
        "service-permission"
    ];
    apps = ["PermissionController"];
};

"com.android.permission.key" = apex_key {
    name = "com.android.permission.key";
    public_key = "com.android.permission.avbpubkey";
    private_key = "com.android.permission.pem";
};

"com.android.permission.certificate" = android_app_certificate {
    name = "com.android.permission.certificate";
    certificate = "com.android.permission";
};

in { inherit "com.android.permission" "com.android.permission-defaults" "com.android.permission.certificate" "com.android.permission.key"; }
