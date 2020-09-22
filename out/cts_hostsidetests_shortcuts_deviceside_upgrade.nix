{ android_test_helper_app }:
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

#  We build two APKs from the same source files, each with a different set of resources.
CtsShortcutUpgradeVersion1 = android_test_helper_app {
    name = "CtsShortcutUpgradeVersion1";
    defaults = [
        "hostsidetests-shortcuts-deviceside-defaults"
        "cts_defaults"
    ];
    srcs = [
        "src/android/content/pm/cts/shortcut/upgrade/Consts.java"
        "src/android/content/pm/cts/shortcut/upgrade/Launcher.java"
        "src/android/content/pm/cts/shortcut/upgrade/MainActivity.java"
        "src/android/content/pm/cts/shortcut/upgrade/ShortcutManagerPostUpgradeTest.java"
        "src/android/content/pm/cts/shortcut/upgrade/ShortcutManagerPreUpgradeTest.java"
    ];
    resource_dirs = ["version1/res"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    static_libs = [
        "compatibility-device-util-axt"
    ];
};

CtsShortcutUpgradeVersion2 = android_test_helper_app {
    name = "CtsShortcutUpgradeVersion2";
    defaults = [
        "hostsidetests-shortcuts-deviceside-defaults"
        "cts_defaults"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    srcs = [
        "src/android/content/pm/cts/shortcut/upgrade/Consts.java"
        "src/android/content/pm/cts/shortcut/upgrade/Launcher.java"
        "src/android/content/pm/cts/shortcut/upgrade/MainActivity.java"
        "src/android/content/pm/cts/shortcut/upgrade/ShortcutManagerPostUpgradeTest.java"
        "src/android/content/pm/cts/shortcut/upgrade/ShortcutManagerPreUpgradeTest.java"
    ];
    resource_dirs = ["version2/res"];
    static_libs = [
        "compatibility-device-util-axt"
    ];
};

in { inherit CtsShortcutUpgradeVersion1 CtsShortcutUpgradeVersion2; }