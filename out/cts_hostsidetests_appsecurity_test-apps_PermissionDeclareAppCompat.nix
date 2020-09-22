{ android_test_helper_app }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsPermissionDeclareAppCompat = android_test_helper_app {
    name = "CtsPermissionDeclareAppCompat";
    defaults = ["cts_support_defaults"];
    srcs = ["src/com/android/cts/permissiondeclareappcompat/AmbiguousContentProvider.java"];
    sdk_version = "16";
    static_libs = ["androidx.test.rules"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "sts"
    ];
    #  sign this app with a different cert than CtsUsePermissionDiffCert
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsPermissionDeclareAppCompat; }
