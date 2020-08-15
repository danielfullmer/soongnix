{ android_test }:
let

#  Copyright 2015 Google Inc. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

UiBenchJankTests = android_test {
    name = "UiBenchJankTests";
    srcs = [
        "src/com/android/uibench/janktests/UiBenchJankTests.java"
        "src/com/android/uibench/janktests/UiBenchJankTestsHelper.java"
        "src/com/android/uibench/janktests/UiBenchLeanbackJankTests.java"
        "src/com/android/uibench/janktests/UiBenchRenderingJankTests.java"
        "src/com/android/uibench/janktests/UiBenchTextJankTests.java"
        "src/com/android/uibench/janktests/UiBenchTransitionsJankTests.java"
        "src/com/android/uibench/janktests/UiBenchWebView.java"
    ];

    static_libs = [
        "collector-device-lib"
        "ub-uiautomator"
        "ub-janktesthelper"
        "junit"
    ];

    libs = ["android.test.base.stubs"];

    sdk_version = "current";

    test_suites = ["device-tests"];
};

in { inherit UiBenchJankTests; }
