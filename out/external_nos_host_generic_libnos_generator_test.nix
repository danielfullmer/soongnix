{ cc_test_host, genrule }:
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

"nos_generator_test_service_genc++" = genrule {
    name = "nos_generator_test_service_genc++";
    out = ["Hello.client.cpp"];
    srcs = ["nos/generator/test/test.proto"];
    tools = [
        "aprotoc"
        "protoc-gen-nos-client-cpp"
    ];
    cmd = ""; # TODO: soongnix
};

"nos_generator_test_service_genc++_headers" = genrule {
    name = "nos_generator_test_service_genc++_headers";
    out = ["Hello.client.h"];
    srcs = ["nos/generator/test/test.proto"];
    tools = [
        "aprotoc"
        "protoc-gen-nos-client-cpp"
    ];
    cmd = ""; # TODO: soongnix
};

"nos_generator_test_service_genc++_mock" = genrule {
    name = "nos_generator_test_service_genc++_mock";
    out = ["MockHello.client.h"];
    srcs = ["nos/generator/test/test.proto"];
    tools = [
        "aprotoc"
        "protoc-gen-nos-client-cpp"
    ];
    cmd = ""; # TODO: soongnix
};

protoc-gen-nos-client-cpp_test = cc_test_host {
    name = "protoc-gen-nos-client-cpp_test";
    generated_sources = ["nos_generator_test_service_genc++"];
    generated_headers = [
        "nos_generator_test_service_genc++_headers"
        "nos_generator_test_service_genc++_mock"
    ];
    srcs = [
        "test.cpp"
        "nos/generator/test/test.proto"
    ];
    defaults = ["nos_proto_defaults"];
    proto = {
        type = "full";
        canonical_path_from_root = false;
        include_dirs = [
            "external/protobuf/src"
            "external/nos/host/generic/nugget/proto"
        ];
    };
    header_libs = ["nos_headers"];
    static_libs = [
        "libgmock"
        "libnos_mock"
        "libnosprotos"
    ];
};

in { inherit "nos_generator_test_service_genc++" "nos_generator_test_service_genc++_headers" "nos_generator_test_service_genc++_mock" protoc-gen-nos-client-cpp_test; }
