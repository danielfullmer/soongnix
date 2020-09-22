{ art_cc_library, cc_defaults, gensrcs }:
let

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

#  Build variants {target} x {debug,ndebug} x {32,64}

#  This depends on the Perfetto client API. This uses the ProducerPort to
#  communicate to the system trace. This is an API whose ABI is maintained
#  to be backwards compatible, see
#  https://android.googlesource.com/platform/external/perfetto/+/refs/heads/master/protos/perfetto/ipc/producer_port.proto.

art_perfetto_hprof_operator_srcs = gensrcs {
    name = "art_perfetto_hprof_operator_srcs";
    cmd = "$(location generate_operator_out) art/perfetto_hprof $(in) > $(out)";
    tools = ["generate_operator_out"];
    srcs = [
        "perfetto_hprof.h"
    ];
    output_extension = "operator_out.cc";
};

perfetto_hprof-defaults = cc_defaults {
    name = "perfetto_hprof-defaults";
    host_supported = false;
    srcs = ["perfetto_hprof.cc"];
    defaults = ["art_defaults"];
    include_dirs = [
        "external/perfetto/include"
        "external/perfetto/protos"
    ];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it requires
    #  to be same ISA as what it is attached to.
    compile_multilib = "both";

    shared_libs = [
        "libbase"
        "liblog"
        "libdexfile"
    ];
    static_libs = [
        "libperfetto_client_experimental"
        "perfetto_trace_protos"
    ];
    generated_sources = [
        "perfetto_protos_perfetto_config_profiling_zero_gen"
        "art_perfetto_hprof_operator_srcs"
    ];
    generated_headers = [
        "perfetto_protos_perfetto_config_profiling_zero_gen_headers"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
    header_libs = [
        "libnativehelper_header_only"
    ];
};

libperfetto_hprof = art_cc_library {
    name = "libperfetto_hprof";
    defaults = ["perfetto_hprof-defaults"];
    shared_libs = [
        "libart"
        "libartbase"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

libperfetto_hprofd = art_cc_library {
    name = "libperfetto_hprofd";
    defaults = [
        "art_debug_defaults"
        "perfetto_hprof-defaults"
    ];
    shared_libs = [
        "libartd"
        "libartbased"
    ];
    apex_available = [
        "com.android.art.debug"
    ];
};

in { inherit art_perfetto_hprof_operator_srcs libperfetto_hprof libperfetto_hprofd perfetto_hprof-defaults; }
