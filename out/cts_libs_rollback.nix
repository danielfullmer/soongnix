{ android_test_helper_app, java_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

RollbackManagerTestAppA1 = android_test_helper_app {
    name = "RollbackManagerTestAppA1";
    manifest = "testapp/A1.xml";
    sdk_version = "current";
    srcs = ["testapp/src/**/*.java"];
    resource_dirs = ["testapp/res_v1"];
};

RollbackManagerTestAppA2 = android_test_helper_app {
    name = "RollbackManagerTestAppA2";
    manifest = "testapp/A2.xml";
    sdk_version = "current";
    srcs = ["testapp/src/**/*.java"];
    resource_dirs = ["testapp/res_v2"];
};

cts-rollback-lib = java_library {
    name = "cts-rollback-lib";
    srcs = ["src/**/*.java"];
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
    ];
    sdk_version = "test_current";
    java_resources = [
        ":RollbackManagerTestAppA1"
        ":RollbackManagerTestAppA2"
    ];
};

in { inherit RollbackManagerTestAppA1 RollbackManagerTestAppA2 cts-rollback-lib; }
