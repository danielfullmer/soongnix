{ cc_library_shared }:
let

#
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
#

libvts_multidevice_proto = cc_library_shared {

    name = "libvts_multidevice_proto";
    host_supported = true;

    srcs = [
        "AndroidSystemControlMessage.proto"
        "ComponentSpecificationMessage.proto"
        "VtsProfilingMessage.proto"
        "VtsReportMessage.proto"
        "VtsResourceControllerMessage.proto"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    proto = {
        export_proto_headers = true;
        type = "full";
    };

    target = {
        android = {
            srcs = ["VtsDriverControlMessage.proto"];
        };
        host = {
            cflags = [
                "-Wno-unused-parameter"
                "-Werror"
            ];
        };
    };
};

libvts_proto_fuzzer_proto = cc_library_shared {
    name = "libvts_proto_fuzzer_proto";
    proto = {
        export_proto_headers = true;
        type = "full";
    };
    srcs = [
        "ExecutionSpecificationMessage.proto"
    ];
    shared_libs = [
        "libprotobuf-cpp-full"
        "libvts_multidevice_proto"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit libvts_multidevice_proto libvts_proto_fuzzer_proto; }
