{ android_test_helper_app, filegroup, java_defaults }:
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

ClassLoaderFactoryTestSecondary = android_test_helper_app {
    name = "ClassLoaderFactoryTestSecondary";
    srcs = ["src-ex/**/*.java"];
    manifest = "src-ex/AndroidManifest.xml";
};

cts-classloaderfactorytest-srcs = filegroup {
    name = "cts-classloaderfactorytest-srcs";
    srcs = ["src/**/*.java"];
};

cts_classloaderfactorytest_defaults = java_defaults {
    name = "cts_classloaderfactorytest_defaults";
    static_libs = [
        "androidx.test.rules"
        "ctstestrunner-axt"
        "junit"
    ];
    java_resources = [":ClassLoaderFactoryTestSecondary"];
    sdk_version = "test_current";
};

in { inherit ClassLoaderFactoryTestSecondary cts-classloaderfactorytest-srcs cts_classloaderfactorytest_defaults; }
