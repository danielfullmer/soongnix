{ android_test_helper_app, filegroup }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

CtsUsePermissionAppSrc = filegroup {
    name = "CtsUsePermissionAppSrc";
    srcs = [
        "src/android/permission3/cts/usepermission/CheckCalendarAccessActivity.kt"
        "src/android/permission3/cts/usepermission/FinishOnCreateActivity.kt"
        "src/android/permission3/cts/usepermission/RequestPermissionsActivity.kt"
    ];
};

CtsUsePermissionAppLatest = android_test_helper_app {
    name = "CtsUsePermissionAppLatest";
    srcs = [
        ":CtsUsePermissionAppSrc"
    ];
    static_libs = [
        "kotlin-stdlib"
    ];
    certificate = ":cts-testkey2";
};

in { inherit CtsUsePermissionAppLatest CtsUsePermissionAppSrc; }