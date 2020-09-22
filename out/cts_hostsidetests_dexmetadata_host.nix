{ java_test_host }:
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

CtsDexMetadataHostTestCases = java_test_host {
    name = "CtsDexMetadataHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/dexmetadata/BaseInstallMultiple.java"
        "src/com/android/cts/dexmetadata/InstallDexMetadataHostTest.java"
    ];
    java_resource_dirs = ["res"];
    libs = [
        "compatibility-host-util"
        "cts-tradefed"
        "tradefed"
    ];
    #  tag this module as test artifact for cts
    test_suites = [
        "cts"
        "general-tests"
    ];
    data = [":CtsDexMetadataDeviceTestApp"];
};

in { inherit CtsDexMetadataHostTestCases; }