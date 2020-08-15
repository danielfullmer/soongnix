{ android_app }:
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

EasterEgg = android_app {
    #  the build system in pi-dev can't quite handle R.java in kt
    #  so we will have a mix of java and kotlin files
    srcs = [
        "src/com/android/egg/paint/PaintActivity.java"
        "src/com/android/egg/paint/BrushPropertyDrawable.kt"
        "src/com/android/egg/paint/CutoutAvoidingToolbar.kt"
        "src/com/android/egg/paint/Painting.kt"
        "src/com/android/egg/paint/Palette.kt"
        "src/com/android/egg/paint/SpotFilter.kt"
        "src/com/android/egg/paint/ToolbarView.kt"
        "src/com/android/egg/quares/Quare.kt"
        "src/com/android/egg/quares/QuaresActivity.kt"
    ];

    resource_dirs = ["res"];

    name = "EasterEgg";

    certificate = "platform";

    sdk_version = "current";

    optimize = {
        enabled = false;
    };
};

in { inherit EasterEgg; }
