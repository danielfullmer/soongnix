{ android_app }:
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
#

PaintBooth = android_app {
    name = "PaintBooth";

    srcs = [
        "src/com/android/car/ui/paintbooth/MainActivity.java"
        "src/com/android/car/ui/paintbooth/VisibleBoundsSimulator.java"
        "src/com/android/car/ui/paintbooth/caruirecyclerview/CarUiListItemActivity.java"
        "src/com/android/car/ui/paintbooth/caruirecyclerview/CarUiRecyclerViewActivity.java"
        "src/com/android/car/ui/paintbooth/caruirecyclerview/GridCarUiRecyclerViewActivity.java"
        "src/com/android/car/ui/paintbooth/caruirecyclerview/RecyclerViewAdapter.java"
        "src/com/android/car/ui/paintbooth/currentactivity/ActivityTaskManager.java"
        "src/com/android/car/ui/paintbooth/currentactivity/ActivityTaskManagerImpl.java"
        "src/com/android/car/ui/paintbooth/currentactivity/CurrentActivityService.java"
        "src/com/android/car/ui/paintbooth/dialogs/DialogsActivity.java"
        "src/com/android/car/ui/paintbooth/overlays/OverlayActivity.java"
        "src/com/android/car/ui/paintbooth/overlays/OverlayManager.java"
        "src/com/android/car/ui/paintbooth/overlays/OverlayManagerImpl.java"
        "src/com/android/car/ui/paintbooth/preferences/PreferenceActivity.java"
        "src/com/android/car/ui/paintbooth/preferences/PreferenceDemoFragment.java"
        "src/com/android/car/ui/paintbooth/toolbar/NoCarUiToolbarActivity.java"
        "src/com/android/car/ui/paintbooth/toolbar/OldToolbarActivity.java"
        "src/com/android/car/ui/paintbooth/toolbar/ToolbarActivity.java"
        "src/com/android/car/ui/paintbooth/widgets/WidgetActivity.java"

    ];

    required = ["privapp_whitelist_com.android.car.ui.paintbooth"];

    resource_dirs = [
        "res"
        "res-public"
    ];

    platform_apis = true;

    certificate = "platform";

    privileged = true;

    static_libs = [
        "car-ui-lib"
        "android.car.userlib"
        "guava"
        "gson-prebuilt-jar"
    ];

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    export_package_resources = true;
};

in { inherit PaintBooth; }
