{ android_test_helper_app }:
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

PackageParserTestApp1 = android_test_helper_app {
    name = "PackageParserTestApp1";
    sdk_version = "current";
    srcs = ["src/com/android/servicestests/apps/packageparserapp/TestActivity.java"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    manifest = "AndroidManifestApp1.xml";
};

PackageParserTestApp2 = android_test_helper_app {
    name = "PackageParserTestApp2";
    sdk_version = "current";
    srcs = ["src/com/android/servicestests/apps/packageparserapp/TestActivity.java"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    manifest = "AndroidManifestApp2.xml";
};

PackageParserTestApp3 = android_test_helper_app {
    name = "PackageParserTestApp3";
    sdk_version = "current";
    srcs = ["src/com/android/servicestests/apps/packageparserapp/TestActivity.java"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    resource_dirs = ["res"];
    manifest = "AndroidManifestApp3.xml";
};

in { inherit PackageParserTestApp1 PackageParserTestApp2 PackageParserTestApp3; }
