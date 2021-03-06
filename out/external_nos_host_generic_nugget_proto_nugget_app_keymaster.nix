{ cc_library, genrule }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

"nos_app_keymaster_service_genc++" = genrule {
    name = "nos_app_keymaster_service_genc++";
    out = ["Keymaster.client.cpp"];
    srcs = ["keymaster.proto"];
    tools = [
        "aprotoc"
        "protoc-gen-nos-client-cpp"
    ];
    cmd = ""; # TODO soongnix
};

"nos_app_keymaster_service_genc++_headers" = genrule {
    name = "nos_app_keymaster_service_genc++_headers";
    out = ["Keymaster.client.h"];
    srcs = ["keymaster.proto"];
    tools = [
        "aprotoc"
        "protoc-gen-nos-client-cpp"
    ];
    cmd = ""; # TODO soongnix
};

"nos_app_keymaster_service_genc++_mock" = genrule {
    name = "nos_app_keymaster_service_genc++_mock";
    out = ["MockKeymaster.client.h"];
    srcs = ["keymaster.proto"];
    tools = [
        "aprotoc"
        "protoc-gen-nos-client-cpp"
    ];
    cmd = ""; # TODO soongnix
};

nos_app_keymaster = cc_library {
    name = "nos_app_keymaster";
    generated_sources = ["nos_app_keymaster_service_genc++"];
    generated_headers = ["nos_app_keymaster_service_genc++_headers"];
    defaults = ["nos_app_service_defaults"];
    export_generated_headers = ["nos_app_keymaster_service_genc++_headers"];
};

in { inherit "nos_app_keymaster_service_genc++" "nos_app_keymaster_service_genc++_headers" "nos_app_keymaster_service_genc++_mock" nos_app_keymaster; }
