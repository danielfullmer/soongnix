{ java_library_static }:
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

CtsDynamicMimeCommon = java_library_static {
    name = "CtsDynamicMimeCommon";
    defaults = ["cts_defaults"];
    sdk_version = "test_current";
    srcs = [
        "src/android/dynamicmime/common/Constants.java"
        "src/android/dynamicmime/common/activity/FirstActivity.java"
        "src/android/dynamicmime/common/activity/SecondActivity.java"
        "src/android/dynamicmime/common/activity/TwoGroupsActivity.java"
        "src/android/dynamicmime/common/activity/TwoGroupsAndTypeActivity.java"
    ];
};

in { inherit CtsDynamicMimeCommon; }
