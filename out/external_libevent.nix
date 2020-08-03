{ cc_library }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

libevent = cc_library {
    name = "libevent";
    host_supported = true;
    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    unique_host_soname = true;

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
    cflags = [
        "-D_BSD_SOURCE"
        "-O3"
        "-Wno-implicit-function-declaration"
        "-Wno-strict-aliasing"
        "-Wno-unused-parameter"
        "-Werror"
    ];
    export_include_dirs = ["include"];

    local_include_dirs = ["compat"];

    srcs = [
        #  core
        "buffer.c"
        "bufferevent.c"
        "bufferevent_filter.c"
        "bufferevent_pair.c"
        "bufferevent_ratelim.c"
        "bufferevent_sock.c"
        "event.c"
        "evmap.c"
        "evthread.c"
        "evutil.c"
        "evutil_rand.c"
        "evutil_time.c"
        "listener.c"
        "log.c"
        "signal.c"
        "strlcpy.c"

        #  extra
        "evdns.c"
        "event_tagging.c"
        "evrpc.c"
        "http.c"

        "poll.c"
        "select.c"
    ];

    target = {
        linux = {
            srcs = ["epoll.c"];
        };
        linux_bionic = {
            enabled = true;
        };
        darwin = {
            srcs = ["kqueue.c"];
        };
    };
};

in { inherit libevent; }
