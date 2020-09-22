{ java_library_static }:
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

devicepolicyprotosnano = java_library_static {
    name = "devicepolicyprotosnano";
    proto = {
        type = "nano";
    };
    srcs = [
        "device_policy.proto"
        "device_policy_enums.proto"
    ];
    java_version = "1.8";
    target = {
        android = {
            jarjar_rules = "jarjar-rules.txt";
        };
        host = {
            static_libs = ["libprotobuf-java-nano"];
        };
    };
    sdk_version = "core_platform";
};

in { inherit devicepolicyprotosnano; }
