{ bpf, cc_library_headers }:
let

#
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
#

netd_bpf_progs_headers = cc_library_headers {
    name = "netd_bpf_progs_headers";
    export_include_dirs = ["."];
};

#
#  bpf kernel programs
#
"clatd.o" = bpf {
    name = "clatd.o";
    srcs = ["clatd.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    include_dirs = [
        "system/netd/libnetdbpf/include"
        "system/netd/libnetdutils/include"
    ];
};

"netd.o" = bpf {
    name = "netd.o";
    srcs = ["netd.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    include_dirs = [
        "system/netd/libnetdbpf/include"
        "system/netd/libnetdutils/include"
    ];
};

"offload.o" = bpf {
    name = "offload.o";
    srcs = ["offload.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    include_dirs = [
        "system/netd/libnetdbpf/include"
        "system/netd/libnetdutils/include"
    ];
};

in { inherit "clatd.o" "netd.o" "offload.o" netd_bpf_progs_headers; }
