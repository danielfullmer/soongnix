{ cc_library }:
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

libnosprotos = cc_library {
    name = "libnosprotos";
    srcs = [
        "google/protobuf/descriptor.proto"
        "nugget/app/avb/avb.proto"
        "nugget/app/identity/identity.proto"
        "nugget/app/identity/identity_defs.proto"
        "nugget/app/identity/identity_types.proto"
        "nugget/app/keymaster/keymaster.proto"
        "nugget/app/keymaster/keymaster_defs.proto"
        "nugget/app/keymaster/keymaster_types.proto"
        "nugget/app/protoapi/control.proto"
        "nugget/app/protoapi/diagnostics_api.proto"
        "nugget/app/protoapi/gchips_types.proto"
        "nugget/app/protoapi/header.proto"
        "nugget/app/protoapi/testing_api.proto"
        "nugget/app/weaver/weaver.proto"
        "nugget/protobuf/options.proto"
    ];
    exclude_srcs = ["google/protobuf/descriptor.proto"]; #  Used for bazel build
    defaults = [
        "nos_proto_defaults"
        "nos_cc_host_supported_defaults"
    ];
    proto = {
        type = "full";
        canonical_path_from_root = false;
        export_proto_headers = true;
        include_dirs = [
            "external/nos/host/generic/nugget/proto"
            "external/protobuf/src"
        ];
    };

};

in { inherit libnosprotos; }
