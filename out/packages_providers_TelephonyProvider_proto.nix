{ filegroup, java_library_static }:
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

telephonyprovider-proto-sources = filegroup {
    name = "telephonyprovider-proto-sources";
    srcs = ["src/carrierId.proto"];
};

telephonyprovider-protos = java_library_static {
    name = "telephonyprovider-protos";
    proto = {
        type = "nano";
        output_params = [
            "store_unknown_fields=true"
            "enum_style=java"
        ];
    };
    srcs = [":telephonyprovider-proto-sources"];
    static_libs = ["libprotobuf-java-nano"];
    sdk_version = "core_platform";
    jarjar_rules = "jarjar-rules.txt";
    #  Pin java_version until jarjar is certified to support later versions. http://b/72703434
    java_version = "1.8";
};

in { inherit telephonyprovider-proto-sources telephonyprovider-protos; }
