{ android_test_helper_app }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

ShareUidApp = android_test_helper_app {
    name = "ShareUidApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/process/activity/SharePidActivity.java"
        "src/com/android/cts/process/activity/SharePidSubActivity.java"
    ];
    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit ShareUidApp; }
