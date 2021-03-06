{ java_binary, java_binary_host }:
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

deployagent = java_binary {
    name = "deployagent";
    sdk_version = "24";
    srcs = [
        "deployagent/src/com/android/fastdeploy/DeployAgent.java"
        "deploylib/src/com/android/fastdeploy/PatchFormatException.java"
        "deploylib/src/com/android/fastdeploy/PatchUtils.java"
        "proto/ApkEntry.proto"
    ];
    static_libs = ["apkzlib_zip"];
    wrapper = "deployagent/deployagent.sh";
    proto = {
        type = "lite";
    };
    dex_preopt = {
        enabled = false;
    };
};

deploypatchgenerator = java_binary_host {
    name = "deploypatchgenerator";
    srcs = [
        "deploypatchgenerator/src/com/android/fastdeploy/DeployPatchGenerator.java"
        "deploylib/src/com/android/fastdeploy/PatchFormatException.java"
        "deploylib/src/com/android/fastdeploy/PatchUtils.java"
        "proto/ApkEntry.proto"
    ];
    static_libs = ["apkzlib"];
    manifest = "deploypatchgenerator/manifest.txt";
    proto = {
        type = "full";
    };
};

in { inherit deployagent deploypatchgenerator; }
