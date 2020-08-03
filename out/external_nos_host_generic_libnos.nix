{ cc_defaults, cc_library, filegroup }:
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

libnos = cc_library {
    name = "libnos";
    srcs = [
        "debug.cpp"
    ];
    defaults = ["nos_cc_host_supported_defaults"];
    header_libs = ["nos_headers"];
    shared_libs = ["libnos_datagram"];
    export_include_dirs = ["include"];
    export_shared_lib_headers = ["libnos_datagram"];
};

#  This part of libnos must be linked with the target's implementation of
#  libnos_datagram. A library should be created for this such as:
#
#  cc_library {
#      name: "libnos_client_xxx",
#      srcs: [":libnos_client"],
#      defaults: ["libnos_client_defaults"],
#      shared_libs: ["libnos_datagram_xxx"],
#  }
#
#  Components that directly use `NuggetClient` must link against it. Other
#  components should be written against `NuggetClientInterface` and can simply
#  link against `libnos`.

libnos_client = filegroup {
    name = "libnos_client";
    srcs = ["NuggetClient.cpp"];
};

libnos_client_defaults = cc_defaults {
    name = "libnos_client_defaults";
    header_libs = ["nos_headers"];
    shared_libs = [
        "libnos"
        "libnos_transport"
    ];
};

in { inherit libnos libnos_client libnos_client_defaults; }
