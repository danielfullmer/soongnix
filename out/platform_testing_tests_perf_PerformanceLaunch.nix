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

LOCAK_SDK_VERSION = ["current"];
PerformanceLaunch = android_test {
    name = "PerformanceLaunch";
    platform_apis = true;
    certificate = "platform";
    srcs = [
        "src/com/android/performanceLaunch/ComplexLayoutActivity.java"
        "src/com/android/performanceLaunch/DispatchActivity.java"
        "src/com/android/performanceLaunch/EmptyActivity.java"
        "src/com/android/performanceLaunch/EmptyWebViewActivity.java"
        "src/com/android/performanceLaunch/ImageActivity.java"
        "src/com/android/performanceLaunch/ManyConfigResourceActivity.java"
        "src/com/android/performanceLaunch/SimpleActivity.java"
        "src/com/android/performanceLaunch/SimpleSurfaceGLActivity.java"
        "src/com/android/performanceLaunch/SimpleWebViewActivity.java"
        "src/com/android/performanceLaunch/helper/SimpleGLRenderer.java"
        "src/com/android/performanceLaunch/helper/SimpleGLSurfaceView.java"
        "src/com/android/performanceLaunch/helper/Square.java"
        "src/com/android/performanceLaunch/helper/Triangle.java"
    ];

    test_suites = ["device-tests"];
};

in { inherit PerformanceLaunch; }
