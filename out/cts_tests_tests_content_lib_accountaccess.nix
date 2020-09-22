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

accountaccesslib = java_library {
    name = "accountaccesslib";
    srcs = [
        "src/com.android.cts.content/AlwaysSyncableSyncService.java"
        "src/com.android.cts.content/FlakyTestRule.java"
        "src/com.android.cts.content/NotAlwaysSyncableSyncService.java"
        "src/com.android.cts.content/StubActivity.java"
        "src/com.android.cts.content/SyncAdapter.java"
        "src/com.android.cts.content/Utils.java"
    ];
    static_libs = [
        "mockito-target"
        "ub-uiautomator"
        "compatibility-device-util-axt"
    ];
};

in { inherit accountaccesslib; }
