{ filegroup, java_sdk_library }:
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

service-permission-sources = filegroup {
    name = "service-permission-sources";
    srcs = [
        "java/com/android/permission/persistence/IoUtils.java"
        "java/com/android/permission/persistence/RuntimePermissionsPersistence.java"
        "java/com/android/permission/persistence/RuntimePermissionsPersistenceImpl.java"
        "java/com/android/permission/persistence/RuntimePermissionsState.java"
        "java/com/android/role/persistence/RolesPersistence.java"
        "java/com/android/role/persistence/RolesPersistenceImpl.java"
        "java/com/android/role/persistence/RolesState.java"
    ];
    path = "java";
};

service-permission = java_sdk_library {
    name = "service-permission";
    defaults = ["framework-system-server-module-defaults"];
    visibility = [
        "//frameworks/base/services/core"
        "//frameworks/base/apex/permission"
        "//frameworks/base/apex/permission/testing"
        "//frameworks/base/apex/permission/tests"
        "//frameworks/base/services/tests/mockingservicestests"
    ];
    impl_library_visibility = [
        "//visibility:override"
        "//frameworks/base/apex/permission/tests"
        "//frameworks/base/services/tests/mockingservicestests"
        "//frameworks/base/services/tests/servicestests"
    ];
    srcs = [
        ":service-permission-sources"
    ];
    libs = [
        "framework-permission"
    ];
    apex_available = [
        "com.android.permission"
        "test_com.android.permission"
    ];
    installable = true;
};

in { inherit service-permission service-permission-sources; }
