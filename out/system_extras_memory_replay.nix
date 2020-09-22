{ cc_benchmark, cc_binary, cc_defaults, cc_test }:
let

#
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
#

memory_flag_defaults = cc_defaults {
    name = "memory_flag_defaults";
    host_supported = false;

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    compile_multilib = "both";
};

memory_replay_defaults = cc_defaults {
    name = "memory_replay_defaults";
    defaults = ["memory_flag_defaults"];

    srcs = [
        "Alloc.cpp"
        "File.cpp"
        "NativeInfo.cpp"
        "Pointers.cpp"
        "Thread.cpp"
        "Threads.cpp"
    ];

    shared_libs = [
        "libbase"
        "libziparchive"
    ];

    static_libs = [
        "libasync_safe"
    ];
};

memory_replay = cc_binary {
    name = "memory_replay";
    defaults = ["memory_replay_defaults"];

    srcs = ["main.cpp"];

    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
};

memory_replay_tests = cc_test {
    name = "memory_replay_tests";
    defaults = ["memory_replay_defaults"];
    isolated = true;

    srcs = [
        "tests/AllocTest.cpp"
        "tests/FileTest.cpp"
        "tests/NativeInfoTest.cpp"
        "tests/PointersTest.cpp"
        "tests/ThreadTest.cpp"
        "tests/ThreadsTest.cpp"
    ];

    local_include_dirs = ["tests"];

    target = {
        android = {
            test_suites = ["device-tests"];
        };
    };

    data = [
        "tests/test.txt"
        "tests/test.zip"
    ];
};

trace_benchmark = cc_benchmark {
    name = "trace_benchmark";
    defaults = ["memory_flag_defaults"];

    srcs = [
        "Alloc.cpp"
        "TraceBenchmark.cpp"
        "File.cpp"
    ];

    shared_libs = [
        "libbase"
        "libziparchive"
    ];

    data = [
        "traces/angry_birds2.zip"
        "traces/camera.zip"
        "traces/candy_crush_saga.zip"
        "traces/gmail.zip"
        "traces/maps.zip"
        "traces/photos.zip"
        "traces/pubg.zip"
        "traces/surfaceflinger.zip"
        "traces/system_server.zip"
        "traces/systemui.zip"
        "traces/youtube.zip"
    ];
};

in { inherit memory_flag_defaults memory_replay memory_replay_defaults memory_replay_tests trace_benchmark; }
