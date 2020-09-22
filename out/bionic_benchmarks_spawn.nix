{ cc_benchmark, cc_binary, cc_defaults, cc_library_static }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the
#     distribution.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
#  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
#  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
#  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
#  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
#  OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
#  AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
#  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#  SUCH DAMAGE.
#

bionic_spawn_benchmark_targets = cc_defaults {
    name = "bionic_spawn_benchmark_targets";
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
        linux_glibc_x86 = {
            enabled = false;
        };
    };
};

libbionic_spawn_benchmark = cc_library_static {
    name = "libbionic_spawn_benchmark";
    defaults = ["bionic_spawn_benchmark_targets"];

    srcs = ["spawn_benchmark.cpp"];
    export_include_dirs = ["include"];
    static_libs = [
        "libbase"
        "libgoogle-benchmark"
        "liblog"
    ];
};

bionic-spawn-benchmarks = cc_benchmark {
    name = "bionic-spawn-benchmarks";
    defaults = ["bionic_spawn_benchmark_targets"];

    srcs = ["spawn_benchmarks.cpp"];
    static_libs = [
        "libbase"
        "libbionic_spawn_benchmark"
        "liblog"
    ];

    #  Install these binaries in the same directory as the main benchmark binary.
    data = [
        ":bench_noop"
        ":bench_noop_nostl"
        ":bench_noop_static"
    ];
};

noop_binary_defaults = cc_defaults {
    name = "noop_binary_defaults";
    defaults = ["bionic_spawn_benchmark_targets"];

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
};

bench_noop = cc_binary {
    defaults = ["noop_binary_defaults"];
    name = "bench_noop";
    srcs = ["noop.cpp"];

    #  When this binary is installed to host/linux-x86/bin, its runpath is ${ORIGIN}/../lib64, which
    #  is fine for finding host/linux-x86/lib64/libc++.so. When it's installed to
    #  host/linux-x86/benchmarktest64/bionic-spawn-benchmarks, the runpath needs an extra "..".
    target = {
        linux_glibc_x86_64 = {
            ldflags = [
                "-Wl,--rpath,\${ORIGIN}/../../lib64"
            ];
        };
    };
};

bench_noop_nostl = cc_binary {
    defaults = ["noop_binary_defaults"];
    name = "bench_noop_nostl";
    srcs = ["noop.cpp"];
    stl = "none";
};

bench_noop_static = cc_binary {
    defaults = ["noop_binary_defaults"];
    name = "bench_noop_static";
    srcs = ["noop.cpp"];
    static_executable = true;
    stl = "libc++_static";
};

in { inherit bench_noop bench_noop_nostl bench_noop_static bionic-spawn-benchmarks bionic_spawn_benchmark_targets libbionic_spawn_benchmark noop_binary_defaults; }