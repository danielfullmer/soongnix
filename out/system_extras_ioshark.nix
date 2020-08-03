{ cc_binary, cc_binary_host, cc_defaults }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

ioshark_defaults = cc_defaults {
    name = "ioshark_defaults";

    cflags = [
        "-g"
        "-O2"
        "-Wall"
        "-Werror"
    ];

    target = {
        darwin = {
            enabled = false;
        };
        host = {
            cflags = [
                "-D_GNU_SOURCE"
            ];
        };
    };
};

ioshark_bench = cc_binary {
    name = "ioshark_bench";
    defaults = ["ioshark_defaults"];
    srcs = [
        "ioshark_bench.c"
        "ioshark_bench_subr.c"
        "ioshark_bench_mmap.c"
    ];
};

compile_ioshark = cc_binary_host {
    name = "compile_ioshark";
    defaults = ["ioshark_defaults"];
    srcs = [
        "compile_ioshark.c"
        "compile_ioshark_subr.c"
    ];
};

dump_ioshark_filenames = cc_binary_host {
    name = "dump_ioshark_filenames";
    defaults = ["ioshark_defaults"];
    srcs = ["dump_ioshark_filenames.c"];
};

convert_format = cc_binary_host {
    name = "convert_format";
    defaults = ["ioshark_defaults"];
    srcs = ["convert_format.c"];
};

in { inherit compile_ioshark convert_format dump_ioshark_filenames ioshark_bench ioshark_defaults; }
