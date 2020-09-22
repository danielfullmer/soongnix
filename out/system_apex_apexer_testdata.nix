{ android_app_certificate, apex, apex_key }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

"com.android.example.apex.certificate" = android_app_certificate {
    name = "com.android.example.apex.certificate";
    #  This will use com.android.my.apex.x509.pem (the cert) and
    #  com.android.my.apex.pk8 (the private key)
    certificate = "com.android.example.apex";
};

"com.android.example.apex.key" = apex_key {
    name = "com.android.example.apex.key";
    public_key = "com.android.example.apex.avbpubkey";
    private_key = "com.android.example.apex.pem";
};

"com.android.example.apex" = apex {
    name = "com.android.example.apex";
    manifest = "manifest.json";
    file_contexts = ":apex.test-file_contexts";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.example.apex.key";
    certificate = ":com.android.example.apex.certificate";
    installable = false;
};

"com.android.example-legacy.apex" = apex {
    name = "com.android.example-legacy.apex";
    manifest = "manifest.json";
    file_contexts = ":apex.test-file_contexts";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.example.apex.key";
    certificate = ":com.android.example.apex.certificate";
    min_sdk_version = "29";
    installable = false;
};

"com.android.example-logging_parent.apex" = apex {
    name = "com.android.example-logging_parent.apex";
    manifest = "manifest.json";
    file_contexts = ":apex.test-file_contexts";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.example.apex.key";
    certificate = ":com.android.example.apex.certificate";
    installable = false;
    logging_parent = "foobar";
};

"com.android.example-overridden_package_name.apex" = apex {
    name = "com.android.example-overridden_package_name.apex";
    manifest = "manifest.json";
    file_contexts = ":apex.test-file_contexts";
    prebuilts = ["sample_prebuilt_file"];
    key = "com.android.example.apex.key";
    certificate = ":com.android.example.apex.certificate";
    installable = false;
    package_name = "com.android.overridden.example.apex";
};

in { inherit "com.android.example-legacy.apex" "com.android.example-logging_parent.apex" "com.android.example-overridden_package_name.apex" "com.android.example.apex" "com.android.example.apex.certificate" "com.android.example.apex.key"; }
