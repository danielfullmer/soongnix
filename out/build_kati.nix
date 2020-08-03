{ cc_benchmark_host, cc_binary_host, cc_defaults, cc_library_host_static, cc_test_host }:
let

#  Copyright 2016 Google Inc. All rights reserved
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

ckati_defaults = cc_defaults {
    name = "ckati_defaults";
    cflags = [
        "-W"
        "-Wall"
        "-Werror"
        "-DNOLOG"
    ];
    tidy_checks = [
        "-google-global-names-in-headers"
        "-google-build-using-namespace"
        "-google-explicit-constructor"
    ];
};

libckati = cc_library_host_static {
    name = "libckati";
    defaults = ["ckati_defaults"];
    srcs = [
        "affinity.cc"
        "command.cc"
        "dep.cc"
        "eval.cc"
        "exec.cc"
        "expr.cc"
        "file.cc"
        "file_cache.cc"
        "fileutil.cc"
        "find.cc"
        "flags.cc"
        "func.cc"
        "io.cc"
        "log.cc"
        "ninja.cc"
        "parser.cc"
        "regen.cc"
        "rule.cc"
        "stats.cc"
        "stmt.cc"
        "string_piece.cc"
        "stringprintf.cc"
        "strutil.cc"
        "symtab.cc"
        "thread_pool.cc"
        "timeutil.cc"
        "var.cc"
        "version_unknown.cc"
    ];
};

ckati = cc_binary_host {
    name = "ckati";
    defaults = ["ckati_defaults"];
    srcs = ["main.cc"];
    whole_static_libs = ["libckati"];
    target = {
        linux_glibc = {
            shared_libs = ["libjemalloc"];
        };
    };
};

ckati_stamp_dump = cc_binary_host {
    name = "ckati_stamp_dump";
    defaults = ["ckati_defaults"];
    srcs = ["regen_dump.cc"];
    static_libs = ["libckati"];
};

ckati_test = cc_test_host {
    name = "ckati_test";
    defaults = ["ckati_defaults"];
    test_per_src = true;
    srcs = [
        "find_test.cc"
        "ninja_test.cc"
        "string_piece_test.cc"
        "strutil_bench.cc"
        "strutil_test.cc"
    ];
    gtest = false;
    static_libs = ["libckati"];
};

ckati_fileutil_bench = cc_benchmark_host {
    name = "ckati_fileutil_bench";
    defaults = ["ckati_defaults"];
    srcs = [
        "fileutil_bench.cc"
    ];
    static_libs = ["libckati"];
};

in { inherit ckati ckati_defaults ckati_fileutil_bench ckati_stamp_dump ckati_test libckati; }
