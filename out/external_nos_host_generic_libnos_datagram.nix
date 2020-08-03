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

libnos_datagram = cc_library {
    name = "libnos_datagram";
    defaults = ["nos_cc_host_supported_defaults"];
    export_include_dirs = ["include"];
};

libnos_datagram_citadel = cc_library {
    name = "libnos_datagram_citadel";
    srcs = ["citadel.c"];
    defaults = ["nos_cc_defaults"];
    shared_libs = [
        "liblog"
        "libnos_datagram"
    ];
};

in { inherit libnos_datagram libnos_datagram_citadel; }
