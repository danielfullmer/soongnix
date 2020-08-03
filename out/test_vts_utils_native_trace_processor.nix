{ cc_binary_host, cc_library_host_shared }:
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

libvts_traceprocessor = cc_library_host_shared {
    name = "libvts_traceprocessor";

    srcs = [
        "VtsTraceProcessor.cpp"
        "VtsCoverageProcessor.cpp"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libprotobuf-cpp-full"
        "libvts_multidevice_proto"
        "libvts_profiling_utils"
    ];
    static_libs = [
        "libjsoncpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

trace_processor = cc_binary_host {
    name = "trace_processor";

    srcs = ["TraceProcessorMain.cpp"];

    shared_libs = [
        "libbase"
        "libprotobuf-cpp-full"
        "libvts_multidevice_proto"
        "libvts_traceprocessor"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit libvts_traceprocessor trace_processor; }
