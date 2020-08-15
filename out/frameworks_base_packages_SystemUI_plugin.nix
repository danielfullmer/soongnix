{ android_app, java_library }:
let

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

SystemUIPluginLib = java_library {

    name = "SystemUIPluginLib";

    srcs = [
        "src/com/android/systemui/plugins/ActivityStarter.java"
        "src/com/android/systemui/plugins/ClockPlugin.java"
        "src/com/android/systemui/plugins/DarkIconDispatcher.java"
        "src/com/android/systemui/plugins/DozeServicePlugin.java"
        "src/com/android/systemui/plugins/FalsingManager.java"
        "src/com/android/systemui/plugins/FalsingPlugin.java"
        "src/com/android/systemui/plugins/FragmentBase.java"
        "src/com/android/systemui/plugins/GlobalActions.java"
        "src/com/android/systemui/plugins/GlobalActionsPanelPlugin.java"
        "src/com/android/systemui/plugins/IntentButtonProvider.java"
        "src/com/android/systemui/plugins/NotificationListenerController.java"
        "src/com/android/systemui/plugins/OverlayPlugin.java"
        "src/com/android/systemui/plugins/PluginDependency.java"
        "src/com/android/systemui/plugins/PluginUtils.java"
        "src/com/android/systemui/plugins/SensorManagerPlugin.java"
        "src/com/android/systemui/plugins/ViewProvider.java"
        "src/com/android/systemui/plugins/VolumeDialog.java"
        "src/com/android/systemui/plugins/VolumeDialogController.java"
        "src/com/android/systemui/plugins/qs/DetailAdapter.java"
        "src/com/android/systemui/plugins/qs/QS.java"
        "src/com/android/systemui/plugins/qs/QSFactory.java"
        "src/com/android/systemui/plugins/qs/QSIconView.java"
        "src/com/android/systemui/plugins/qs/QSTile.java"
        "src/com/android/systemui/plugins/qs/QSTileView.java"
        "src/com/android/systemui/plugins/statusbar/DozeParameters.java"
        "src/com/android/systemui/plugins/statusbar/NotificationMenuRowPlugin.java"
        "src/com/android/systemui/plugins/statusbar/NotificationSwipeActionHelper.java"
        "src/com/android/systemui/plugins/statusbar/StatusBarStateController.java"
    ];

    static_libs = [
        "PluginCoreLib"
    ];

};

PluginDummyLib = android_app {

    #  Dummy to generate .toc files.
    name = "PluginDummyLib";
    platform_apis = true;
    srcs = [
        "src/com/android/systemui/plugins/ActivityStarter.java"
        "src/com/android/systemui/plugins/ClockPlugin.java"
        "src/com/android/systemui/plugins/DarkIconDispatcher.java"
        "src/com/android/systemui/plugins/DozeServicePlugin.java"
        "src/com/android/systemui/plugins/FalsingManager.java"
        "src/com/android/systemui/plugins/FalsingPlugin.java"
        "src/com/android/systemui/plugins/FragmentBase.java"
        "src/com/android/systemui/plugins/GlobalActions.java"
        "src/com/android/systemui/plugins/GlobalActionsPanelPlugin.java"
        "src/com/android/systemui/plugins/IntentButtonProvider.java"
        "src/com/android/systemui/plugins/NotificationListenerController.java"
        "src/com/android/systemui/plugins/OverlayPlugin.java"
        "src/com/android/systemui/plugins/PluginDependency.java"
        "src/com/android/systemui/plugins/PluginUtils.java"
        "src/com/android/systemui/plugins/SensorManagerPlugin.java"
        "src/com/android/systemui/plugins/ViewProvider.java"
        "src/com/android/systemui/plugins/VolumeDialog.java"
        "src/com/android/systemui/plugins/VolumeDialogController.java"
        "src/com/android/systemui/plugins/qs/DetailAdapter.java"
        "src/com/android/systemui/plugins/qs/QS.java"
        "src/com/android/systemui/plugins/qs/QSFactory.java"
        "src/com/android/systemui/plugins/qs/QSIconView.java"
        "src/com/android/systemui/plugins/qs/QSTile.java"
        "src/com/android/systemui/plugins/qs/QSTileView.java"
        "src/com/android/systemui/plugins/statusbar/DozeParameters.java"
        "src/com/android/systemui/plugins/statusbar/NotificationMenuRowPlugin.java"
        "src/com/android/systemui/plugins/statusbar/NotificationSwipeActionHelper.java"
        "src/com/android/systemui/plugins/statusbar/StatusBarStateController.java"
    ];

    libs = ["SystemUIPluginLib"];

    optimize = {
        enabled = false;
    };

};

in { inherit PluginDummyLib SystemUIPluginLib; }
