{ cc_binary, cc_defaults, cc_library_static, filegroup }:
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

perfprofd_defaults = cc_defaults {
    name = "perfprofd_defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"

        #  Try some more extreme warnings.
        "-Wpedantic"
        "-Wunreachable-code-aggressive"
        #  And disable some dumb things.
        "-Wno-zero-length-array"
        "-Wno-c99-extensions"
        "-Wno-language-extension-token"
        "-Wno-gnu-zero-variadic-macro-arguments"
        "-Wno-nested-anon-types"
        "-Wno-gnu-statement-expression"
        "-Wno-vla-extension"
    ];
    cppflags = [
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

perfprofd_debug_defaults = cc_defaults {
    name = "perfprofd_debug_defaults";

    cflags = [
        "-O0"
        "-g"
        "-UNDEBUG"
    ];

    #  Add sanitizers that work w/o extra libraries. This is important
    #  for atest etc to work.
    sanitize = {
        integer_overflow = true;
        undefined = true;
    };

    #   TODO: Re-enable when ART's ASAN flags are correctly propagated.
    #     target: {
    #         // On the host add ASAN.
    #         host: {
    #             sanitize: {
    #                 address: true,
    #             },
    #         },
    #     }
};

perfprofd_record_proto = filegroup {
    name = "perfprofd_record_proto";
    srcs = [
        "perfprofd_record.proto"
    ];
};

#  Static library for the record proto and its I/O.

libperfprofd_record_proto = cc_library_static {
    name = "libperfprofd_record_proto";
    defaults = [
        "perfprofd_defaults"
    ];
    host_supported = true;

    static_libs = [
        "libbase"
        "libprotobuf-cpp-lite"
        "libquipper"
        "libz"
    ];
    srcs = [
        "perfprofd_io.cc"
        ":perfprofd_record_proto"
    ];

    proto = {
        export_proto_headers = true;
        include_dirs = ["external/perf_data_converter/src/quipper"];
        type = "lite";
    };

    export_include_dirs = ["."]; #  Really only the -fwd.h.
    export_static_lib_headers = ["libquipper"];
};

perfprofd_config_proto = filegroup {
    name = "perfprofd_config_proto";
    srcs = [
        "perfprofd_config.proto"
    ];
};

libperfprofd_proto_config = cc_library_static {
    name = "libperfprofd_proto_config";
    defaults = [
        "perfprofd_defaults"
    ];
    host_supported = true;

    static_libs = [
        "libprotobuf-cpp-lite"
    ];
    srcs = [
        ":perfprofd_config_proto"
    ];

    proto = {
        export_proto_headers = true;
        type = "lite";
    };

    export_include_dirs = ["."]; #  Really only the -fwd.h.
};

#
#  Static library containing guts of AWP daemon.
#

libperfprofdcore_defaults = cc_defaults {
    name = "libperfprofdcore_defaults";
    defaults = [
        "perfprofd_defaults"
    ];
    host_supported = true;

    static_libs = [
        "libbase"
        "libperfprofd_proto_config"
        "libprotobuf-cpp-lite"
        "libsimpleperf_dex_read"
        "libsimpleperf_elf_read"
    ];
    whole_static_libs = [
        "libperfprofd_dropbox"
        "libperfprofd_record_proto"
        "libquipper"
    ];
    srcs = [
        "perf_data_converter.cc"
        "configreader.cc"
        "cpuconfig.cc"
        "perfprofdcore.cc"
        "perfprofd_cmdline.cc"
        "perfprofd_perf.cc"
        "symbolizer.cc"
    ];

    cflags = [
        "-Wno-gnu-anonymous-struct"
    ];

    export_include_dirs = ["."];

    target = {
        android = {
            static_libs = [
                "libhealthhalutils"
            ];
            shared_libs = [
                "android.hardware.health@2.0"
                "libhidlbase"
            ];
        };
    };
};

libperfprofdcore = cc_library_static {
    name = "libperfprofdcore";
    defaults = [
        "libart_static_defaults"
        "libperfprofdcore_defaults"
    ];
};

#  Debug version.
libperfprofdcored = cc_library_static {
    name = "libperfprofdcored";
    defaults = [
        "libartd_static_defaults"
        "libperfprofdcore_defaults"
        "perfprofd_debug_defaults"
    ];
};

#
#  Main daemon
#
perfprofd = cc_binary {
    name = "perfprofd";
    defaults = [
        "libart_static_defaults"
        "perfprofd_defaults"
        "libsimpleperf_dex_read_static_reqs_defaults"
        "libsimpleperf_elf_read_static_reqs_defaults"
    ];

    srcs = [
        "perfprofdmain.cc"
    ];

    static_libs = [
        "libhealthhalutils"
        "libperfprofdcore"
        "libperfprofd_binder"
        "libperfprofd_proto_config"
        "libsimpleperf_dex_read"
        "libsimpleperf_elf_read"
    ];
    group_static_libs = true;

    shared_libs = [
        "android.hardware.health@2.0"
        "liblog"
        "libprotobuf-cpp-lite"
        "libbase"
        "libbinder"
        "libhidlbase"
        "libservices"
        "libutils"
    ];

    init_rc = ["perfprofd.rc"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };

    #  We're technically independent, but ensure simpleperf is there.
    required = [
        "simpleperf"
    ];
};

subdirs = [
    "binder_interface"
    "tests"
];

in { inherit libperfprofd_proto_config libperfprofd_record_proto libperfprofdcore libperfprofdcore_defaults libperfprofdcored perfprofd perfprofd_config_proto perfprofd_debug_defaults perfprofd_defaults perfprofd_record_proto; }
