{ android_library, android_library_import }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

"androidx.car_car-resources-partially-dejetified-nodeps" = android_library_import {
    name = "androidx.car_car-resources-partially-dejetified-nodeps";
    aars = ["androidx-car-resources.aar"];
    sdk_version = "current";
    static_libs = [
        "com.google.android.material_material"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.gridlayout_gridlayout"
        "androidx.preference_preference"
        "androidx-constraintlayout_constraintlayout"
    ];
};

"androidx.car_car-resources-partially-dejetified" = android_library {
    name = "androidx.car_car-resources-partially-dejetified";
    sdk_version = "current";
    min_sdk_version = "21";
    manifest = "AndroidManifest.xml";
    static_libs = [
        "androidx.car_car-resources-partially-dejetified-nodeps"
        "com.google.android.material_material"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.gridlayout_gridlayout"
        "androidx.preference_preference"
        "androidx-constraintlayout_constraintlayout"
    ];
    java_version = "1.7";
};

in { inherit "androidx.car_car-resources-partially-dejetified" "androidx.car_car-resources-partially-dejetified-nodeps"; }
