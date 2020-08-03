{ cc_defaults, cc_library, cc_library_headers, cc_library_static }:
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

nos_headers = cc_library_headers {
    name = "nos_headers";
    defaults = ["nos_cc_host_supported_defaults"];
    export_include_dirs = ["nugget/include"];
};

nos_proto_defaults = cc_defaults {
    name = "nos_proto_defaults";
    cflags = [
        "-Wno-unused-parameter"
    ];
};

nos_app_defaults = cc_defaults {
    name = "nos_app_defaults";
    defaults = ["nos_proto_defaults"];
    header_libs = ["nos_headers"];
    shared_libs = [
        "libnos"
        "libprotobuf-cpp-full"
    ];
};

nos_app_service_defaults = cc_defaults {
    name = "nos_app_service_defaults";
    defaults = [
        "nos_app_defaults"
        "nos_cc_defaults"
    ];
    shared_libs = ["libnosprotos"];
    export_shared_lib_headers = ["libnosprotos"];
};

#  Soong doesn't allow adding plugins to a protobuf compilation so we need to
#  invoke it directly. If we could pass a plugin, it could use insertion points
#  in the .pb.{cc,h} files rather than needing to generate new .client.{cpp,h}
#  files for each service.
GEN_SERVICE = "$(location aprotoc) --plugin=protoc-gen-nos-client-cpp=$(location protoc-gen-nos-client-cpp) $(in) -Iexternal/protobuf/src -Iexternal/nos/host/generic/nugget/proto";

GEN_SERVICE_SOURCE = GEN_SERVICE + " --nos-client-cpp_out=source:$(genDir) ";
GEN_SERVICE_HEADER = GEN_SERVICE + " --nos-client-cpp_out=header:$(genDir) ";
GEN_SERVICE_MOCK = GEN_SERVICE + " --nos-client-cpp_out=mock:$(genDir) ";

#  A special target to be statically linkeed into recovery which is a system
#  (not vendor) component.
libnos_for_recovery = cc_library_static {
    name = "libnos_for_recovery";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-zero-length-array"
    ];
    export_include_dirs = [
        "nugget/include"
        "libnos/include"
        "libnos_datagram/include"
        "libnos_transport/include"
    ];
    srcs = [
        "libnos/debug.cpp"
        "libnos_transport/transport.c"
        "libnos_transport/crc16.c"
    ];
    static_libs = [
        "libbase"
    ];
};

#  A special target to be statically linkeed into recovery which is a system
#  (not vendor) component.
libnos_citadel_for_recovery = cc_library_static {
    name = "libnos_citadel_for_recovery";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        ":libnos_client"
        "libnos_datagram/citadel.c"
    ];
    static_libs = [
        "libnos_for_recovery"
    ];
};

#  Language and vendor related defaults
nos_cc_defaults = cc_defaults {
    name = "nos_cc_defaults";
    clang = true;
    cflags = [
        "-pedantic"
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-zero-length-array"
    ];
    conlyflags = [
        "-std=c11"
    ];
    vendor = true;
    owner = "google";
};

#  Defaults for components under the hw subdirectory
nos_cc_hw_defaults = cc_defaults {
    name = "nos_cc_hw_defaults";
    defaults = ["nos_cc_defaults"];
    relative_install_path = "hw";
};

#  Defaults for components shared between the host and device
nos_cc_host_supported_defaults = cc_defaults {
    name = "nos_cc_host_supported_defaults";
    defaults = ["nos_cc_defaults"];
    host_supported = true;
};

libnos_client_citadel = cc_library {
    name = "libnos_client_citadel";
    srcs = [":libnos_client"];
    defaults = [
        "libnos_client_defaults"
        "nos_cc_defaults"
    ];
    shared_libs = ["libnos_datagram_citadel"];
};

in { inherit libnos_citadel_for_recovery libnos_client_citadel libnos_for_recovery nos_app_defaults nos_app_service_defaults nos_cc_defaults nos_cc_host_supported_defaults nos_cc_hw_defaults nos_headers nos_proto_defaults; }
