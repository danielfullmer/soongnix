{ android_library }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

car-ui-lib-bp = android_library {

    name = "car-ui-lib-bp";

    srcs = ["src/**/*.java"];

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    libs = ["android.car"];

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.appcompat_appcompat"
        "androidx.asynclayoutinflater_asynclayoutinflater"
        "androidx-constraintlayout_constraintlayout"
        "androidx.preference_preference"
        "androidx.recyclerview_recyclerview"
        "androidx-constraintlayout_constraintlayout-solver"
    ];
};

in { inherit car-ui-lib-bp; }
