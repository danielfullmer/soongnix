{ cc_binary, cc_defaults }:
let

#  Copyright 2018 The Android Open Source Project
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

blktrace_defaults = cc_defaults {
    name = "blktrace_defaults";
    include_dirs = [
        "external/blktrace"
        "external/blktrace/btt"
    ];
    cflags = [
        "-O2"
        "-g"
        "-W"
        "-Wall"
        "-D_GNU_SOURCE"
        "-D_LARGEFILE_SOURCE"
        "-D_FILE_OFFSET_BITS=64"
        "-Wno-implicit-function-declaration"
        "-Wno-pointer-arith"
        "-Wno-unused-function"
    ];
};

blkparse = cc_binary {
    name = "blkparse";
    defaults = ["blktrace_defaults"];
    srcs = [
        "blkparse.c"
        "blkparse_fmt.c"
        "rbtree.c"
        "act_mask.c"
        "strverscmp.c"
    ];

};

blktrace = cc_binary {
    name = "blktrace";
    defaults = ["blktrace_defaults"];
    srcs = [
        "blktrace.c"
        "act_mask.c"
    ];
};

verify_blkparse = cc_binary {
    name = "verify_blkparse";
    defaults = ["blktrace_defaults"];
    srcs = ["verify_blkparse.c"];
    include_dirs = ["external/blktrace/"];
};

blkrawverify = cc_binary {
    name = "blkrawverify";
    defaults = ["blktrace_defaults"];
    srcs = ["blkrawverify.c"];
};

blkiomon = cc_binary {
    name = "blkiomon";
    defaults = ["blktrace_defaults"];
    srcs = [
        "blkiomon.c"
        "rbtree.c"
    ];
};

btt = cc_binary {
    name = "btt";
    defaults = ["blktrace_defaults"];
    srcs = [
        "btt/args.c"
        "btt/bt_timeline.c"
        "btt/devmap.c"
        "btt/devs.c"
        "btt/dip_rb.c"
        "btt/iostat.c"
        "btt/latency.c"
        "btt/misc.c"
        "btt/output.c"
        "btt/proc.c"
        "btt/seek.c"
        "btt/trace.c"
        "btt/trace_complete.c"
        "btt/trace_im.c"
        "btt/trace_issue.c"
        "btt/trace_queue.c"
        "btt/trace_remap.c"
        "btt/trace_requeue.c"
        "rbtree.c"
        "btt/mmap.c"
        "btt/trace_plug.c"
        "btt/bno_dump.c"
        "btt/unplug_hist.c"
        "btt/q2d.c"
        "btt/aqd.c"
        "btt/plat.c"
        "btt/p_live.c"
        "btt/rstats.c"
    ];
};

in { inherit blkiomon blkparse blkrawverify blktrace blktrace_defaults btt verify_blkparse; }
