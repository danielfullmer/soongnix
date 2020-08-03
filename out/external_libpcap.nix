{ cc_defaults, cc_library, cc_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

libpcap_defaults = cc_defaults {
    name = "libpcap_defaults";
    cflags = [
        "-D_BSD_SOURCE"
        "-DHAVE_CONFIG_H"
        "-Dlint"
        "-D_U_=__attribute__((__unused__))"
        "-Wall"
        "-Werror"
        "-Wno-macro-redefined"
        "-Wno-pointer-arith"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-Wno-unused-result"
        "-Wno-tautological-compare"
    ];
};

libpcap = cc_library {
    name = "libpcap";
    host_supported = true;
    vendor_available = true;
    defaults = ["libpcap_defaults"];

    #  (Matches order in libpcap's Makefile.)
    srcs = [
        "pcap-linux.c"
        "pcap-usb-linux.c"
        "pcap-netfilter-linux-android.c"
        "fad-getad.c"
        "pcap.c"
        "gencode.c"
        "optimize.c"
        "nametoaddr.c"
        "etherent.c"
        "fmtutils.c"
        "savefile.c"
        "sf-pcap.c"
        "sf-pcapng.c"
        "pcap-common.c"
        "bpf_image.c"
        "bpf_filter.c"
        "bpf_dump.c"
        "scanner.c"
        "grammar.c"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };

    export_include_dirs = ["."];
};

#
#  Tests.
#

libpcap_test = cc_test {
    name = "libpcap_test";
    defaults = ["libpcap_defaults"];
    gtest = false;
    #  (Matches order in libpcap's Makefile.)
    srcs = [
        "testprogs/can_set_rfmon_test.c"
        "testprogs/capturetest.c"
        "testprogs/filtertest.c"
        "testprogs/findalldevstest.c"
        "testprogs/opentest.c"
        "testprogs/reactivatetest.c"
        "testprogs/selpolltest.c"
        "testprogs/threadsignaltest.c"
        "testprogs/valgrindtest.c"
    ];
    static_libs = ["libpcap"];
    test_per_src = true;
};

in { inherit libpcap libpcap_defaults libpcap_test; }
