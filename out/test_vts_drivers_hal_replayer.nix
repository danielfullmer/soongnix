{ cc_binary }:
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

vts_hal_replayer = cc_binary {
    name = "vts_hal_replayer";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    srcs = [
        "VtsHidlHalReplayer.cpp"
        "VtsHidlHalReplayerMain.cpp"
    ];

    shared_libs = [
        "libbase"
        "libprotobuf-cpp-full"
        "libvts_common"
        "libvts_multidevice_proto"
        "libvts_profiling_utils"
        "libvts_resource_manager"
    ];
};

in { inherit vts_hal_replayer; }
