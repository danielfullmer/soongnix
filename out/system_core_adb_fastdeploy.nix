{ android_test, java_binary, java_library, java_test_host }:
let

#
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
#
deployagent_lib = java_library {
    name = "deployagent_lib";
    sdk_version = "24";
    srcs = [
        "deployagent/src/com/android/fastdeploy/ApkArchive.java"
        "deployagent/src/com/android/fastdeploy/DeployAgent.java"
        "deployagent/src/com/android/fastdeploy/PatchFormatException.java"
        "deployagent/src/com/android/fastdeploy/PatchUtils.java"
        "proto/ApkEntry.proto"
    ];
    proto = {
        type = "lite";
    };
};

deployagent = java_binary {
    name = "deployagent";
    sdk_version = "24";
    static_libs = [
        "deployagent_lib"
    ];
    dex_preopt = {
        enabled = false;
    };
};

FastDeployTests = android_test {
    name = "FastDeployTests";

    manifest = "AndroidManifest.xml";

    srcs = [
        "deployagent/test/com/android/fastdeploy/ApkArchiveTest.java"
    ];

    static_libs = [
        "androidx.test.core"
        "androidx.test.runner"
        "androidx.test.rules"
        "deployagent_lib"
        "mockito-target-inline-minus-junit4"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];

    data = [
        "testdata/sample.apk"
        "testdata/sample.cd"
    ];

    optimize = {
        enabled = false;
    };
};

FastDeployHostTests = java_test_host {
    name = "FastDeployHostTests";
    srcs = [
        "deployagent/test/com/android/fastdeploy/FastDeployTest.java"
    ];
    data = [
        "testdata/helloworld5.apk"
        "testdata/helloworld7.apk"
    ];
    libs = [
        "compatibility-host-util"
        "cts-tradefed"
        "tradefed"
    ];
    test_suites = [
        "general-tests"
    ];
};

in { inherit FastDeployHostTests FastDeployTests deployagent deployagent_lib; }
