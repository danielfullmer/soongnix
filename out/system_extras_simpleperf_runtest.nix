{ cc_binary, cc_defaults }:
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

simpleperf_runtest_defaults = cc_defaults {
    name = "simpleperf_runtest_defaults";
    host_supported = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wunused"
        "-O0"
    ];
    compile_multilib = "both";
    multilib = {
        lib64 = {
            suffix = "64";
        };
        lib32 = {
            suffix = "32";
        };
    };
    target = {
        darwin = {
            enabled = false;
        };
    };
};

simpleperf_runtest_one_function = cc_binary {
    name = "simpleperf_runtest_one_function";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["one_function.cpp"];
};

simpleperf_runtest_two_functions = cc_binary {
    name = "simpleperf_runtest_two_functions";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["two_functions.cpp"];
};

simpleperf_runtest_function_fork = cc_binary {
    name = "simpleperf_runtest_function_fork";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["function_fork.cpp"];
};

simpleperf_runtest_function_pthread = cc_binary {
    name = "simpleperf_runtest_function_pthread";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["function_pthread.cpp"];
};

simpleperf_runtest_comm_change = cc_binary {
    name = "simpleperf_runtest_comm_change";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["comm_change.cpp"];
};

simpleperf_runtest_function_recursive = cc_binary {
    name = "simpleperf_runtest_function_recursive";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["function_recursive.cpp"];
};

simpleperf_runtest_function_indirect_recursive = cc_binary {
    name = "simpleperf_runtest_function_indirect_recursive";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["function_indirect_recursive.cpp"];
};

simpleperf_runtest_run_and_sleep = cc_binary {
    name = "simpleperf_runtest_run_and_sleep";
    defaults = ["simpleperf_runtest_defaults"];
    srcs = ["run_and_sleep.cpp"];
};

in { inherit simpleperf_runtest_comm_change simpleperf_runtest_defaults simpleperf_runtest_function_fork simpleperf_runtest_function_indirect_recursive simpleperf_runtest_function_pthread simpleperf_runtest_function_recursive simpleperf_runtest_one_function simpleperf_runtest_run_and_sleep simpleperf_runtest_two_functions; }
