{ android_library, android_test_helper_app }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

CtsShortcutBackupPublisher4old = android_test_helper_app {
    name = "CtsShortcutBackupPublisher4old";
    defaults = [
        "cts_defaults"
        "hostsidetests-shortcuts-deviceside-defaults"
    ];

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    static_libs = [
        "CtsShortcutBackupPublisher4oldLib"
        "compatibility-device-util-axt"
    ];
};

CtsShortcutBackupPublisher4oldLib = android_library {
    name = "CtsShortcutBackupPublisher4oldLib";
    manifest = "AndroidManifest-lib.xml";
    srcs = [
        "src/android/content/pm/cts/shortcut/backup/publisher4/MainActivity.java"
        "src/android/content/pm/cts/shortcut/backup/publisher4/ShortcutManagerPostBackupTest.java"
        "src/android/content/pm/cts/shortcut/backup/publisher4/ShortcutManagerPreBackupTest.java"
    ];
    defaults = [
        "cts_defaults"
        "hostsidetests-shortcuts-deviceside-defaults"
    ];
};

in { inherit CtsShortcutBackupPublisher4old CtsShortcutBackupPublisher4oldLib; }
