{ android_test, java_library }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

AuptLib = java_library {
    name = "AuptLib";
    libs = [
        "androidx.test.runner"
        "ub-uiautomator"
        "junit"
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/support/test/aupt/AuptTerminator.java"
        "src/android/support/test/aupt/AuptTestCase.java"
        "src/android/support/test/aupt/AuptTestRunner.java"
        "src/android/support/test/aupt/DataCollector.java"
        "src/android/support/test/aupt/DexTestRunner.java"
        "src/android/support/test/aupt/FilesystemUtil.java"
        "src/android/support/test/aupt/IProcessStatusTracker.java"
        "src/android/support/test/aupt/LogGenerator.java"
        "src/android/support/test/aupt/MemHealthRecord.java"
        "src/android/support/test/aupt/ProcessStatusTracker.java"
        "src/android/support/test/aupt/Scheduler.java"
        "src/android/support/test/aupt/UiWatchers.java"
    ];
};

# #####################################

AuptRunner = android_test {
    name = "AuptRunner";

    platform_apis = true;
    static_libs = [
        "androidx.test.runner"
        "ub-uiautomator"
        "junit"
    ];
    libs = [
        "android.test.base.stubs"
        "android.test.runner.stubs"
    ];
    srcs = [
        "src/android/support/test/aupt/AuptTerminator.java"
        "src/android/support/test/aupt/AuptTestCase.java"
        "src/android/support/test/aupt/AuptTestRunner.java"
        "src/android/support/test/aupt/DataCollector.java"
        "src/android/support/test/aupt/DexTestRunner.java"
        "src/android/support/test/aupt/FilesystemUtil.java"
        "src/android/support/test/aupt/IProcessStatusTracker.java"
        "src/android/support/test/aupt/LogGenerator.java"
        "src/android/support/test/aupt/MemHealthRecord.java"
        "src/android/support/test/aupt/ProcessStatusTracker.java"
        "src/android/support/test/aupt/Scheduler.java"
        "src/android/support/test/aupt/UiWatchers.java"
    ];
};

in { inherit AuptLib AuptRunner; }
