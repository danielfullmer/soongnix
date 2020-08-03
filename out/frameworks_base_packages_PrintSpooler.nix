{ android_app }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

PrintSpooler = android_app {
    name = "PrintSpooler";

    resource_dirs = ["res"];

    srcs = [
        "src/**/*.java"
        "src/com/android/printspooler/renderer/IPdfRenderer.aidl"
        "src/com/android/printspooler/renderer/IPdfEditor.aidl"
    ];

    platform_apis = true;

    jni_libs = ["libprintspooler_jni"];
    static_libs = [
        "android-support-v7-recyclerview"
        "android-support-compat"
        "android-support-media-compat"
        "android-support-core-utils"
        "android-support-core-ui"
        "android-support-fragment"
        "android-support-annotations"
    ];
};

in { inherit PrintSpooler; }
