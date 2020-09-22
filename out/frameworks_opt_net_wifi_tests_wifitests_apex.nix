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

#  A test version of wifi apex.
#  It has a version code that should beat a "real" APEX and enables end-to-end
#  installation testing on devices with the latests real data.
"test_com.android.wifi" = apex_test {
    name = "test_com.android.wifi";
    visibility = [
        "//system/apex/tests"
    ];
    defaults = ["com.android.wifi-defaults"];
    manifest = "test_apex_manifest.json";
    file_contexts = ":com.android.wifi-file_contexts";
    #  Test APEX, should never be installed
    installable = false;
};

in { inherit "test_com.android.wifi"; }
