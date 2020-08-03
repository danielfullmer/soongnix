{ android_library }:
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
        "tests/tapl/**/*.java"
        "src/com/android/launcher3/util/SecureSettingsObserver.java"
        "src/com/android/launcher3/ResourceUtils.java"
        "src/com/android/launcher3/testing/TestProtocol.java"
    ];
    manifest = "tests/tapl/AndroidManifest.xml";
    platform_apis = true;
};

in { inherit launcher-aosp-tapl; }
