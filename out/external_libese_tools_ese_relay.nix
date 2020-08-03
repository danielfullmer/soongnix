{ cc_binary, cc_defaults }:
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

ese-relay-defaults = cc_defaults {
    name = "ese-relay-defaults";
    host_supported = false;
    proprietary = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    cflags = [
        "-std=c99"
        "-D_FORTIFY_SOURCE=2"
        "-Wall"
        "-Werror"
        "-Wno-error=unused-variable"
    ];
    srcs = ["ese_relay.c"];
    shared_libs = [
        "liblog"
        "libese"
    ];
};

ese-relay-pn80t-nq-nci = cc_binary {
    name = "ese-relay-pn80t-nq-nci";
    defaults = ["ese-relay-defaults"];
    srcs = ["ese_relay_pn80t_nq_nci.c"];
    shared_libs = [
        "libese-hw-nxp-pn80t-nq-nci"
        "libese-teq1"
    ];
};

ese-relay-pn80t-spidev = cc_binary {
    name = "ese-relay-pn80t-spidev";
    defaults = ["ese-relay-defaults"];
    srcs = ["ese_relay_pn80t_spidev.c"];
    shared_libs = [
        "libese-hw-nxp-pn80t-spidev"
        "libese-teq1"
    ];
};

ese-relay-fake = cc_binary {
    name = "ese-relay-fake";
    defaults = ["ese-relay-defaults"];
    srcs = ["ese_relay_fake.c"];
    shared_libs = ["libese-hw-fake"];
    host_supported = true;
};

in { inherit ese-relay-defaults ese-relay-fake ese-relay-pn80t-nq-nci ese-relay-pn80t-spidev; }
