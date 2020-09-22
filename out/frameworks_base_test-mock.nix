{ filegroup, java_sdk_library }:
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
        #  Note: Below are NOT APIs of this library. We only take APIs under
        #  the android.test.mock package. They however provide private APIs that
        #  android.test.mock APIs references to.
        ":framework-core-sources-for-test-mock"
        ":framework_native_aidl"
    ];
    libs = [
        "framework"
        "app-compat-annotations"
        "unsupportedappusage"
    ];

    api_packages = [
        "android.test.mock"
    ];
    compile_dex = true;
};

#  Make the current.txt available for use by the cts/tests/signature tests.
#  ========================================================================
"android-test-mock-current.txt" = filegroup {
    name = "android-test-mock-current.txt";
    visibility = [
        "//cts/tests/signature/api"
    ];
    srcs = [
        "api/current.txt"
    ];
};

in { inherit "android-test-mock-current.txt" "android.test.mock"; }
