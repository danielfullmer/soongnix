{ cc_binary }:
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

iperf = cc_binary {
    name = "iperf";
    srcs = [
        "src/cjson.c"
        "src/dscp.c"
        "src/iperf_api.c"
        "src/iperf_auth.c"
        "src/iperf_client_api.c"
        "src/iperf_error.c"
        "src/iperf_locale.c"
        "src/iperf_sctp.c"
        "src/iperf_server_api.c"
        "src/iperf_tcp.c"
        "src/iperf_time.c"
        "src/iperf_udp.c"
        "src/iperf_util.c"
        "src/main.c"
        "src/net.c"
        "src/t_api.c"
        "src/t_timer.c"
        "src/t_units.c"
        "src/t_uuid.c"
        "src/tcp_info.c"
        "src/timer.c"
        "src/units.c"
    ];
    exclude_srcs = [
        "src/t_api.c"
        "src/t_timer.c"
        "src/t_units.c"
        "src/t_uuid.c"
    ];
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        #  https://github.com/esnet/iperf/pull/855
        "-Wno-format"
        "-Wno-constant-conversion"
    ];
};

in { inherit iperf; }
