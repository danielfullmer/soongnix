{ android_test }:
let

#
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
#

PermissionControllerInProcessTests = android_test {

    name = "PermissionControllerInProcessTests";

    srcs = [
        "src/com/android/permissioncontroller/DisableAnimationsRule.kt"
        "src/com/android/permissioncontroller/EspressoPreferenceUtils.kt"
        "src/com/android/permissioncontroller/PermissionGroupPreferenceUtils.kt"
        "src/com/android/permissioncontroller/UiUtils.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/AllAppPermissionsFragmentTest.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/AppPermissionFragmentTest.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/CustomPermissionAppsFragmentTest.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/LocationPermissionAppsFragmentTest.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/ManageCustomPermissionsFragmentTest.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/ManageStandardPermissionsFragmentTest.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/PermissionAppsFragmentTest.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/StoragePermissionAppsFragmentTest.kt"
    ];

    libs = [
        "android.test.base"
        "android.test.runner"
    ];

    static_libs = [
        "androidx.test.espresso.core"
        "androidx.test.espresso.contrib"
        "androidx.test.rules"
        "androidx.test.ext.truth"
        "androidx.test.ext.junit"
        "compatibility-device-util-axt"
        "permission-test-util-lib"
    ];

    certificate = "platform";

    instrumentation_for = "PermissionController";

    test_suites = ["device-tests"];
};

in { inherit PermissionControllerInProcessTests; }
