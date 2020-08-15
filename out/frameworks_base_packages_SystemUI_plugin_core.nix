{ java_library }:
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

PluginCoreLib = java_library {
    sdk_version = "current";
    name = "PluginCoreLib";
    srcs = [
        "src/com/android/systemui/plugins/Plugin.java"
        "src/com/android/systemui/plugins/PluginFragment.java"
        "src/com/android/systemui/plugins/PluginListener.java"
        "src/com/android/systemui/plugins/annotations/Dependencies.java"
        "src/com/android/systemui/plugins/annotations/DependsOn.java"
        "src/com/android/systemui/plugins/annotations/ProvidesInterface.java"
        "src/com/android/systemui/plugins/annotations/Requirements.java"
        "src/com/android/systemui/plugins/annotations/Requires.java"
    ];
};

in { inherit PluginCoreLib; }
