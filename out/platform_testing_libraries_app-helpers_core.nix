{ java_library }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

app-helpers-core = java_library {
    name = "app-helpers-core";
    libs = [
        "ub-uiautomator"
        "androidx.test.runner"
        "launcher-helper-lib"
    ];
    srcs = [
        "src/android/platform/helpers/AbstractStandardAppHelper.java"
        "src/android/platform/helpers/HelperAccessor.java"
        "src/android/platform/helpers/HelperManager.java"
        "src/android/platform/helpers/HelperTest.java"
        "src/android/platform/helpers/IAppHelper.java"
        "src/android/platform/helpers/ILauncherHelper.java"
        "src/android/platform/helpers/ITestHelper.java"
        "src/android/platform/helpers/exceptions/AccountException.java"
        "src/android/platform/helpers/exceptions/MappedMultiException.java"
        "src/android/platform/helpers/exceptions/TestHelperException.java"
        "src/android/platform/helpers/exceptions/UiTimeoutException.java"
        "src/android/platform/helpers/exceptions/UnknownUiException.java"
        "src/android/platform/helpers/listeners/FailureScreenshotTestWatcher.java"
        "src/android/platform/helpers/watchers/AppIsNotRespondingWatcher.java"
    ];
    sdk_version = "test_current";
};

# #####################################

in { inherit app-helpers-core; }
