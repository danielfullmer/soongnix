{ java_sdk_library }:
let

#
#  Copyright (C) 2008 The Android Open Source Project
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

#  Build the android.test.mock library
#  ===================================
"android.test.mock" = java_sdk_library {
    name = "android.test.mock";

    srcs = [
        "src/android/test/mock/MockAccountManager.java"
        "src/android/test/mock/MockApplication.java"
        "src/android/test/mock/MockContentProvider.java"
        "src/android/test/mock/MockContentResolver.java"
        "src/android/test/mock/MockContext.java"
        "src/android/test/mock/MockCursor.java"
        "src/android/test/mock/MockDialogInterface.java"
        "src/android/test/mock/MockIContentProvider.java"
        "src/android/test/mock/MockPackageManager.java"
        "src/android/test/mock/MockResources.java"
        "src/android/test/mock/MockService.java"
    ];

    api_packages = [
        "android.test.mock"
    ];

    srcs_lib = "framework";
    srcs_lib_whitelist_dirs = ["core/java"];
    srcs_lib_whitelist_pkgs = ["android"];
    compile_dex = true;
};

in { inherit "android.test.mock"; }
