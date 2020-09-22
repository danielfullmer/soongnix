{ android_library, java_library, java_library_static }:
let

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

launcher-aosp-tapl = android_library {
    name = "launcher-aosp-tapl";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.runner"
        "androidx.test.rules"
        "androidx.test.uiautomator_uiautomator"
        "SystemUISharedLib"
    ];
    srcs = [
        "tests/tapl/com/android/launcher3/tapl/AddToHomeScreenPrompt.java"
        "tests/tapl/com/android/launcher3/tapl/AllApps.java"
        "tests/tapl/com/android/launcher3/tapl/AllAppsFromOverview.java"
        "tests/tapl/com/android/launcher3/tapl/AppIcon.java"
        "tests/tapl/com/android/launcher3/tapl/AppIconMenu.java"
        "tests/tapl/com/android/launcher3/tapl/AppIconMenuItem.java"
        "tests/tapl/com/android/launcher3/tapl/Background.java"
        "tests/tapl/com/android/launcher3/tapl/BaseOverview.java"
        "tests/tapl/com/android/launcher3/tapl/Home.java"
        "tests/tapl/com/android/launcher3/tapl/Launchable.java"
        "tests/tapl/com/android/launcher3/tapl/LauncherInstrumentation.java"
        "tests/tapl/com/android/launcher3/tapl/LogEventChecker.java"
        "tests/tapl/com/android/launcher3/tapl/OptionsPopupMenu.java"
        "tests/tapl/com/android/launcher3/tapl/OptionsPopupMenuItem.java"
        "tests/tapl/com/android/launcher3/tapl/Overview.java"
        "tests/tapl/com/android/launcher3/tapl/OverviewTask.java"
        "tests/tapl/com/android/launcher3/tapl/TestHelpers.java"
        "tests/tapl/com/android/launcher3/tapl/Widget.java"
        "tests/tapl/com/android/launcher3/tapl/Widgets.java"
        "tests/tapl/com/android/launcher3/tapl/Workspace.java"
        "src/com/android/launcher3/util/SecureSettingsObserver.java"
        "src/com/android/launcher3/ResourceUtils.java"
        "src/com/android/launcher3/testing/TestProtocol.java"
    ];
    manifest = "tests/tapl/AndroidManifest.xml";
    platform_apis = true;
};

launcher_log_protos_lite = java_library_static {
    name = "launcher_log_protos_lite";
    srcs = [
        "protos/launcher_atom.proto"
        "protos/launcher_log.proto"
        "protos/launcher_trace.proto"
        "protos/launcher_trace_file.proto"
        "proto_overrides/launcher_log_extension.proto"
    ];
    sdk_version = "current";
    proto = {
        type = "lite";
        local_include_dirs = [
            "protos"
            "proto_overrides"
        ];
    };
    static_libs = ["libprotobuf-java-lite"];
};

LauncherPluginLib = java_library {
    name = "LauncherPluginLib";

    static_libs = ["PluginCoreLib"];

    srcs = [
        "src_plugins/com/android/systemui/plugins/AllAppsRow.java"
        "src_plugins/com/android/systemui/plugins/AllAppsSearchPlugin.java"
        "src_plugins/com/android/systemui/plugins/AppLaunchEventsPlugin.java"
        "src_plugins/com/android/systemui/plugins/CustomWidgetPlugin.java"
        "src_plugins/com/android/systemui/plugins/FirstScreenWidget.java"
        "src_plugins/com/android/systemui/plugins/HotseatPlugin.java"
        "src_plugins/com/android/systemui/plugins/OverlayPlugin.java"
        "src_plugins/com/android/systemui/plugins/OverscrollPlugin.java"
        "src_plugins/com/android/systemui/plugins/OverviewScreenshotActions.java"
        "src_plugins/com/android/systemui/plugins/RecentsExtraCard.java"
        "src_plugins/com/android/systemui/plugins/ResourceProvider.java"
        "src_plugins/com/android/systemui/plugins/UserEventPlugin.java"
        "src_plugins/com/android/systemui/plugins/shared/LauncherExterns.java"
        "src_plugins/com/android/systemui/plugins/shared/LauncherOverlayManager.java"
    ];

    sdk_version = "current";
    min_sdk_version = "28";
};

in { inherit LauncherPluginLib launcher-aosp-tapl launcher_log_protos_lite; }
