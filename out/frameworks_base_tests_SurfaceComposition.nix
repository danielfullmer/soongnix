{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

SurfaceComposition = android_test {
    name = "SurfaceComposition";
    #  Don't include this package in any target
    #  When built, explicitly put it in the data partition.
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    srcs = [
        "src/android/surfacecomposition/CustomLayout.java"
        "src/android/surfacecomposition/CustomSurfaceView.java"
        "src/android/surfacecomposition/MemoryAccessTask.java"
        "src/android/surfacecomposition/SurfaceCompositionMeasuringActivity.java"
        "src/android/surfacecomposition/SurfaceCompositionTest.java"
    ];
    static_libs = ["junit"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    sdk_version = "current";
};

in { inherit SurfaceComposition; }
