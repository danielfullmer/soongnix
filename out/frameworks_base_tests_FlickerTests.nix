{ android_test }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

FlickerTests = android_test {
    name = "FlickerTests";
    srcs = [
        "src/com/android/server/wm/flicker/ChangeAppRotationTest.java"
        "src/com/android/server/wm/flicker/CloseImeWindowToAppTest.java"
        "src/com/android/server/wm/flicker/CloseImeWindowToHomeTest.java"
        "src/com/android/server/wm/flicker/CommonTransitions.java"
        "src/com/android/server/wm/flicker/DebugTest.java"
        "src/com/android/server/wm/flicker/FlickerTestBase.java"
        "src/com/android/server/wm/flicker/OpenAppColdTest.java"
        "src/com/android/server/wm/flicker/OpenAppToSplitScreenTest.java"
        "src/com/android/server/wm/flicker/OpenAppWarmTest.java"
        "src/com/android/server/wm/flicker/OpenImeWindowTest.java"
        "src/com/android/server/wm/flicker/ResizeSplitScreenTest.java"
        "src/com/android/server/wm/flicker/SeamlessAppRotationTest.java"
        "src/com/android/server/wm/flicker/SplitScreenToLauncherTest.java"
        "src/com/android/server/wm/flicker/StandardAppHelper.java"
    ];
    platform_apis = true;
    certificate = "platform";
    test_suites = ["device-tests"];
    libs = ["android.test.runner"];
    static_libs = [
        "flickertestapplib"
        "flickerlib"
        "truth-prebuilt"
        "app-helpers-core"
    ];
};

in { inherit FlickerTests; }
