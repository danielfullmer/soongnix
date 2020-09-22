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

PackageManagerDummyAppVersion1 = android_test_helper_app {
    name = "PackageManagerDummyAppVersion1";
    manifest = "AndroidManifestVersion1.xml";
};

PackageManagerDummyAppVersion2 = android_test_helper_app {
    name = "PackageManagerDummyAppVersion2";
    manifest = "AndroidManifestVersion2.xml";
};

PackageManagerDummyAppVersion3 = android_test_helper_app {
    name = "PackageManagerDummyAppVersion3";
    manifest = "AndroidManifestVersion3.xml";
};

PackageManagerDummyAppVersion4 = android_test_helper_app {
    name = "PackageManagerDummyAppVersion4";
    manifest = "AndroidManifestVersion4.xml";
};

PackageManagerDummyAppOriginalOverride = android_test_helper_app {
    name = "PackageManagerDummyAppOriginalOverride";
    manifest = "AndroidManifestOriginalOverride.xml";
};

in { inherit PackageManagerDummyAppOriginalOverride PackageManagerDummyAppVersion1 PackageManagerDummyAppVersion2 PackageManagerDummyAppVersion3 PackageManagerDummyAppVersion4; }
