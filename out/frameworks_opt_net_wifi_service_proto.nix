{ java_library }:
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

wifi-lite-protos = java_library {
    name = "wifi-lite-protos";
    proto = {
        type = "lite";
    };
    sdk_version = "system_current";
    srcs = ["src/scorecard.proto"];
};

wifi-nano-protos = java_library {
    name = "wifi-nano-protos";
    host_supported = true;
    proto = {
        type = "nano";
    };
    srcs = [
        "src/metrics.proto"
        ":system-messages-proto-src"
    ];
    sdk_version = "system_current";
    #  Pin java_version until jarjar is certified to support later versions. http://b/72703434
    java_version = "1.8";
    target = {
        host = {
            static_libs = ["libprotobuf-java-nano"];
        };
    };
};

in { inherit wifi-lite-protos wifi-nano-protos; }
