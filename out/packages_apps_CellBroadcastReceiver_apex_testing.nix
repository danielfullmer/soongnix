{ apex_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

"test_com.android.cellbroadcast" = apex_test {
    name = "test_com.android.cellbroadcast";
    visibility = [
        "//system/apex/tests"
    ];
    defaults = ["com.android.cellbroadcast-defaults"];
    apps = [
        "CellBroadcastApp"
        "CellBroadcastServiceModule"
    ];
    manifest = "test_manifest.json";
    file_contexts = ":com.android.cellbroadcast-file_contexts";
    #  Test APEX, should never be installed
    installable = false;
};

in { inherit "test_com.android.cellbroadcast"; }
