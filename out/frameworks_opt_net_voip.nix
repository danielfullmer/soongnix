{ filegroup, java_library }:
let

#  Copyright 2010 Google Inc. All rights reserved.
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

opt-net-voip-srcs = filegroup {
    name = "opt-net-voip-srcs";
    srcs = [
        "src/java/android/net/**/*.java"
    ];
};

opt-net-voip-htmls = filegroup {
    name = "opt-net-voip-htmls";
    srcs = [
        "src/java/android/net/**/*.html"
    ];
};

voip-common = java_library {
    name = "voip-common";
    installable = true;
    srcs = [
        "src/java/**/*.java"
        "src/java/**/I*.aidl"
    ];
    aidl = {
        local_include_dirs = [
            "src/java"
        ];
    };
    required = ["librtp_jni"];
};

in { inherit opt-net-voip-htmls opt-net-voip-srcs voip-common; }
