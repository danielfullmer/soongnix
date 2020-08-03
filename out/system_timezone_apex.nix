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
"com.android.tzdata-defaults" = apex_defaults {
    name = "com.android.tzdata-defaults";

    #  Use a custom AndroidManifest.xml used for API targeting.
    androidManifest = ":com.android.tzdata-androidManifest";

    #  Explicit because the defaulting behavior only works for the real
    #  module.
    file_contexts = "com.android.tzdata";

    #  Shared signing information.
    key = "apex.tzdata.key";
    certificate = ":com.android.tzdata.certificate";
};

"com.android.tzdata-androidManifest" = filegroup {
    name = "com.android.tzdata-androidManifest";
    srcs = ["AndroidManifest.xml"];
};

"apex.tzdata.key" = apex_key {
    name = "apex.tzdata.key";
    public_key = "com.android.tzdata.avbpubkey";
    private_key = "com.android.tzdata.pem";
};

"com.android.tzdata.certificate" = android_app_certificate {
    name = "com.android.tzdata.certificate";
    certificate = "com.android.tzdata";
};

#  The definition for the real (not test) tzdata APEX.
"com.android.tzdata" = apex {
    name = "com.android.tzdata";
    defaults = ["com.android.tzdata-defaults"];
    manifest = "manifest.json";
    prebuilts = [
        "apex_tz_version"
        "apex_tzlookup.xml"
        "apex_tzdata"
        "apex_icu_tzdata.dat"
    ];
};

in { inherit "apex.tzdata.key" "com.android.tzdata" "com.android.tzdata-androidManifest" "com.android.tzdata-defaults" "com.android.tzdata.certificate"; }
