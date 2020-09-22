{ android_test_helper_app, java_library }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

CtsPermissionDeclareApp = android_test_helper_app {
    name = "CtsPermissionDeclareApp";
    defaults = ["cts_support_defaults"];
    srcs = [
        "src/com/android/cts/permissiondeclareapp/AmbiguousContentProvider.java"
        "src/com/android/cts/permissiondeclareapp/PermissionContentProvider.java"
        "src/com/android/cts/permissiondeclareapp/PermissionContentProviderGranting.java"
        "src/com/android/cts/permissiondeclareapp/PermissionContentProviderPath.java"
        "src/com/android/cts/permissiondeclareapp/PermissionContentProviderPathRestricting.java"
        "src/com/android/cts/permissiondeclareapp/PrivateContentProvider.java"
        "src/com/android/cts/permissiondeclareapp/PrivateContentProviderGranting.java"
        "src/com/android/cts/permissiondeclareapp/SendResultActivity.java"
        "src/com/android/cts/permissiondeclareapp/UtilsProvider.java"
        "src/com/android/cts/permissiondeclareapp/ModifyInstallerCrossPackageTest.kt"
    ];
    sdk_version = "current";
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
};

CtsPermissionDeclareUtilLib = java_library {
    name = "CtsPermissionDeclareUtilLib";
    srcs = ["src/com/android/cts/permissiondeclareapp/UtilsProvider.java"];
    sdk_version = "current";
};

in { inherit CtsPermissionDeclareApp CtsPermissionDeclareUtilLib; }
