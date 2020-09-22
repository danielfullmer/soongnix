{ java_library_host }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

hierarchyviewer = java_library_host {
    name = "hierarchyviewer";

    srcs = [
        "src/com/android/hierarchyviewer/HierarchyViewer.java"
        "src/com/android/hierarchyviewer/device/Configuration.java"
        "src/com/android/hierarchyviewer/device/DeviceBridge.java"
        "src/com/android/hierarchyviewer/device/Window.java"
        "src/com/android/hierarchyviewer/laf/UnifiedContentBorder.java"
        "src/com/android/hierarchyviewer/scene/CaptureLoader.java"
        "src/com/android/hierarchyviewer/scene/ProfilesLoader.java"
        "src/com/android/hierarchyviewer/scene/VersionLoader.java"
        "src/com/android/hierarchyviewer/scene/ViewHierarchyLoader.java"
        "src/com/android/hierarchyviewer/scene/ViewHierarchyScene.java"
        "src/com/android/hierarchyviewer/scene/ViewManager.java"
        "src/com/android/hierarchyviewer/scene/ViewNode.java"
        "src/com/android/hierarchyviewer/scene/WindowsLoader.java"
        "src/com/android/hierarchyviewer/ui/CaptureRenderer.java"
        "src/com/android/hierarchyviewer/ui/LayoutRenderer.java"
        "src/com/android/hierarchyviewer/ui/ScreenViewer.java"
        "src/com/android/hierarchyviewer/ui/Workspace.java"
        "src/com/android/hierarchyviewer/ui/action/BackgroundAction.java"
        "src/com/android/hierarchyviewer/ui/action/CaptureLayersAction.java"
        "src/com/android/hierarchyviewer/ui/action/CaptureNodeAction.java"
        "src/com/android/hierarchyviewer/ui/action/DumpDisplayListAction.java"
        "src/com/android/hierarchyviewer/ui/action/ExitAction.java"
        "src/com/android/hierarchyviewer/ui/action/InvalidateAction.java"
        "src/com/android/hierarchyviewer/ui/action/LoadGraphAction.java"
        "src/com/android/hierarchyviewer/ui/action/RefreshWindowsAction.java"
        "src/com/android/hierarchyviewer/ui/action/RequestLayoutAction.java"
        "src/com/android/hierarchyviewer/ui/action/SaveSceneAction.java"
        "src/com/android/hierarchyviewer/ui/action/ShowDevicesAction.java"
        "src/com/android/hierarchyviewer/ui/action/StartServerAction.java"
        "src/com/android/hierarchyviewer/ui/action/StopServerAction.java"
        "src/com/android/hierarchyviewer/ui/model/ProfilesTableModel.java"
        "src/com/android/hierarchyviewer/ui/model/PropertiesTableModel.java"
        "src/com/android/hierarchyviewer/ui/model/ViewsTreeModel.java"
        "src/com/android/hierarchyviewer/ui/util/IconLoader.java"
        "src/com/android/hierarchyviewer/ui/util/PngFileFilter.java"
        "src/com/android/hierarchyviewer/ui/util/PsdFile.java"
        "src/com/android/hierarchyviewer/ui/util/PsdFileFilter.java"
        "src/com/android/hierarchyviewer/util/OS.java"
        "src/com/android/hierarchyviewer/util/WorkerThread.java"
    ];
    java_resource_dirs = ["src/resources"];

    manifest = "etc/manifest.txt";
    libs = [
        "ddmlib-prebuilt"
        "org-openide-util"
        "org-netbeans-api-visual"
    ];
};

in { inherit hierarchyviewer; }
