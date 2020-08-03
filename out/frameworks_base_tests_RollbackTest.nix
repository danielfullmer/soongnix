{ android_test, android_test_helper_app, java_test_host }:
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

RollbackTestAppAv1 = android_test_helper_app {
    name = "RollbackTestAppAv1";
    manifest = "TestApp/Av1.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v1"];
};

RollbackTestAppAv2 = android_test_helper_app {
    name = "RollbackTestAppAv2";
    manifest = "TestApp/Av2.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v2"];
};

RollbackTestAppAv3 = android_test_helper_app {
    name = "RollbackTestAppAv3";
    manifest = "TestApp/Av3.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v3"];
};

RollbackTestAppACrashingV2 = android_test_helper_app {
    name = "RollbackTestAppACrashingV2";
    manifest = "TestApp/ACrashingV2.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v2"];
};

RollbackTestAppBv1 = android_test_helper_app {
    name = "RollbackTestAppBv1";
    manifest = "TestApp/Bv1.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v1"];
};

RollbackTestAppBv2 = android_test_helper_app {
    name = "RollbackTestAppBv2";
    manifest = "TestApp/Bv2.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v2"];
};

RollbackTestAppASplitV1 = android_test_helper_app {
    name = "RollbackTestAppASplitV1";
    manifest = "TestApp/Av1.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v1"];
    package_splits = ["anydpi"];
};

RollbackTestAppASplitV2 = android_test_helper_app {
    name = "RollbackTestAppASplitV2";
    manifest = "TestApp/Av2.xml";
    sdk_version = "current";
    srcs = ["TestApp/src/**/*.java"];
    resource_dirs = ["TestApp/res_v2"];
    package_splits = ["anydpi"];
};

RollbackTest = android_test {
    name = "RollbackTest";
    manifest = "RollbackTest/AndroidManifest.xml";
    srcs = ["RollbackTest/src/**/*.java"];
    static_libs = ["androidx.test.rules"];
    test_suites = ["general-tests"];
    java_resources = [
        ":RollbackTestAppAv1"
        ":RollbackTestAppAv2"
        ":RollbackTestAppAv3"
        ":RollbackTestAppACrashingV2"
        ":RollbackTestAppBv1"
        ":RollbackTestAppBv2"
        ":RollbackTestAppASplitV1"
        ":RollbackTestAppASplitV2"
    ];
    test_config = "RollbackTest.xml";
    #  TODO: sdk_version: "test_current" when Intent#resolveSystemservice is TestApi
};

StagedRollbackTest = java_test_host {
    name = "StagedRollbackTest";
    srcs = ["StagedRollbackTest/src/**/*.java"];
    libs = ["tradefed"];
    test_suites = ["general-tests"];
    test_config = "StagedRollbackTest.xml";
};

in { inherit RollbackTest RollbackTestAppACrashingV2 RollbackTestAppASplitV1 RollbackTestAppASplitV2 RollbackTestAppAv1 RollbackTestAppAv2 RollbackTestAppAv3 RollbackTestAppBv1 RollbackTestAppBv2 StagedRollbackTest; }
