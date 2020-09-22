{ art_cc_library, art_cc_test, cc_defaults, cc_library, cc_library_headers, cc_library_static, gensrcs }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

libdexfile_defaults = cc_defaults {
    name = "libdexfile_defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "dex/art_dex_file_loader.cc"
        "dex/compact_dex_file.cc"
        "dex/compact_offset_table.cc"
        "dex/descriptors_names.cc"
        "dex/dex_file.cc"
        "dex/dex_file_exception_helpers.cc"
        "dex/dex_file_layout.cc"
        "dex/dex_file_loader.cc"
        "dex/dex_file_tracking_registrar.cc"
        "dex/dex_file_verifier.cc"
        "dex/dex_instruction.cc"
        "dex/modifiers.cc"
        "dex/primitive.cc"
        "dex/signature.cc"
        "dex/standard_dex_file.cc"
        "dex/type_lookup_table.cc"
        "dex/utf.cc"
    ];

    target = {
        android = {
            static_libs = [
                "libziparchive"
                "libz"
            ];
            shared_libs = [
                #  For MemMap.
                "libartpalette"
                "liblog"
                #  For common macros.
                "libbase"
            ];
            export_shared_lib_headers = [
                "libbase"
            ];
        };
        not_windows = {
            shared_libs = [
                "libziparchive"
                "libz"
                #  For MemMap.
                "libartpalette"
                "liblog"
                #  For common macros.
                "libbase"
            ];
            export_shared_lib_headers = [
                "libbase"
            ];
        };
        windows = {
            static_libs = [
                "libziparchive"
                "libz"
                #  For MemMap.
                "libartpalette"
                "liblog"
                #  For common macros.
                "libbase"
            ];
            export_static_lib_headers = [
                "libbase"
            ];
            cflags = ["-Wno-thread-safety"];
        };
        darwin = {
            enabled = true;
        };
    };
    generated_sources = ["dexfile_operator_srcs"];
    export_include_dirs = ["."];
};

libdexfile_static_base_defaults = cc_defaults {
    name = "libdexfile_static_base_defaults";
    static_libs = [
        "libbase"
        "liblog"
        "libz"
        "libziparchive"
    ];
};

libdexfile_static_defaults = cc_defaults {
    name = "libdexfile_static_defaults";
    defaults = [
        "libartbase_static_defaults"
        "libdexfile_static_base_defaults"
    ];
    defaults_visibility = [
        "//art:__subpackages__"
    ];
    static_libs = ["libdexfile"];
};

libdexfiled_static_defaults = cc_defaults {
    name = "libdexfiled_static_defaults";
    defaults = [
        "libartbased_static_defaults"
        "libdexfile_static_base_defaults"
    ];
    static_libs = ["libdexfiled"];
};

dexfile_operator_srcs = gensrcs {
    name = "dexfile_operator_srcs";
    cmd = "$(location generate_operator_out) art/libdexfile $(in) > $(out)";
    tools = ["generate_operator_out"];
    srcs = [
        "dex/dex_file.h"
        "dex/dex_file_layout.h"
        "dex/dex_instruction.h"
        "dex/dex_instruction_utils.h"
        "dex/invoke_type.h"
        "dex/method_reference.h"
    ];
    output_extension = "operator_out.cc";
};

libdexfile = art_cc_library {
    name = "libdexfile";
    defaults = [
        "libdexfile_defaults"
        "libart_nativeunwind_defaults"
    ];
    target = {
        android = {
            shared_libs = [
                "libartbase"
            ];
            export_shared_lib_headers = [
                "libartbase"
            ];
        };
        not_windows = {
            shared_libs = [
                "libartbase"
            ];
            export_shared_lib_headers = [
                "libartbase"
            ];
        };
        windows = {
            enabled = true;
            shared = {
                enabled = false;
            };
            static_libs = [
                "libartbase"
            ];
            export_static_lib_headers = [
                "libartbase"
            ];
        };
    };
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

libdexfiled = art_cc_library {
    name = "libdexfiled";
    defaults = [
        "art_debug_defaults"
        "libdexfile_defaults"
    ];
    target = {
        android = {
            shared_libs = [
                "libartbased"
            ];
            export_shared_lib_headers = [
                "libartbased"
            ];
        };
        not_windows = {
            shared_libs = [
                "libartbased"
            ];
            export_shared_lib_headers = [
                "libartbased"
            ];
        };
        windows = {
            enabled = true;
            shared = {
                enabled = false;
            };
            static_libs = [
                "libartbased"
            ];
            export_static_lib_headers = [
                "libartbased"
            ];
        };
    };
    apex_available = [
        "com.android.art.debug"
    ];
};

art_libdexfile_tests = art_cc_test {
    name = "art_libdexfile_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = [
        "dex/art_dex_file_loader_test.cc"
        "dex/class_accessor_test.cc"
        "dex/code_item_accessors_test.cc"
        "dex/compact_dex_file_test.cc"
        "dex/compact_offset_table_test.cc"
        "dex/descriptors_names_test.cc"
        "dex/test_dex_file_builder_test.cc"
        "dex/dex_file_loader_test.cc"
        "dex/dex_file_verifier_test.cc"
        "dex/dex_instruction_test.cc"
        "dex/primitive_test.cc"
        "dex/string_reference_test.cc"
        "dex/type_lookup_table_test.cc"
        "dex/utf_test.cc"
    ];
    shared_libs = [
        "libbacktrace"
        "libziparchive"
    ];
};

libdexfile_external_headers = cc_library_headers {
    name = "libdexfile_external_headers";
    visibility = ["//visibility:public"];
    host_supported = true;
    header_libs = ["libbase_headers"];
    export_header_lib_headers = ["libbase_headers"];
    export_include_dirs = ["external/include"];

    target = {
        windows = {
            enabled = true;
        };
    };

    apex_available = [
        "//apex_available:platform"
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#  Make dex_instruction_list.h available for tools/jvmti-agents/titrace
libdexfile_all_headers = cc_library_headers {
    name = "libdexfile_all_headers";
    visibility = ["//art:__subpackages__"];
    host_supported = true;
    export_include_dirs = ["."];

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

libdexfile_external-defaults = cc_defaults {
    name = "libdexfile_external-defaults";
    host_supported = true;
    srcs = [
        "external/dex_file_ext.cc"
    ];
    header_libs = ["libdexfile_external_headers"];
    shared_libs = [
        "libbase"
    ];
    stubs = {
        symbol_file = "external/libdexfile_external.map.txt";
        versions = ["1"];
    };
    export_header_lib_headers = ["libdexfile_external_headers"];
};

libdexfile_external = cc_library {
    name = "libdexfile_external";
    defaults = [
        "art_defaults"
        "libdexfile_external-defaults"
    ];
    visibility = ["//visibility:public"];
    target = {
        darwin = {
            enabled = true;
        };
    };
    shared_libs = [
        "libdexfile"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

libdexfiled_external = cc_library {
    name = "libdexfiled_external";
    defaults = [
        "art_debug_defaults"
        "libdexfile_external-defaults"
    ];
    target = {
        darwin = {
            enabled = true;
        };
    };
    shared_libs = [
        "libdexfiled"
    ];
    apex_available = [
        "com.android.art.debug"
    ];
};

art_libdexfile_external_tests = art_cc_test {
    name = "art_libdexfile_external_tests";
    host_supported = true;
    test_per_src = true; #  For consistency with other ART gtests.
    srcs = [
        "external/dex_file_ext_c_test.c"
    ];
    header_libs = ["libdexfile_external_headers"];
};

#  Support library with a C++ API for accessing the libdexfile API for external
#  (non-ART) users.
#
#  This library dlopens libdexfile_external on first use, so there is no build
#  time dependency on dex file logic. It is therefore safe to use from binaries
#  compiled without dex file support, given they won't encounter any dex file
#  stack frames.
libdexfile_support = cc_library {
    name = "libdexfile_support";
    visibility = ["//visibility:public"];
    host_supported = true;
    srcs = [
        "external/dex_file_supp.cc"
    ];
    runtime_libs = ["libdexfile_external"];
    shared_libs = ["liblog"];
    header_libs = ["libdexfile_external_headers"];
    export_header_lib_headers = ["libdexfile_external_headers"];

    apex_available = [
        "//apex_available:platform"
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#  The same source file is used in two tests here, so unlike other ART gtests it
#  doesn't use test_per_src. Its test target is
#  test-art-{host,target}-gtest-art_libdexfile_support_tests.
art_libdexfile_support_tests = art_cc_test {
    name = "art_libdexfile_support_tests";
    defaults = [
        "art_test_defaults"
    ];
    host_supported = true;
    srcs = [
        "external/dex_file_supp_test.cc"
    ];
    shared_libs = [
        "libartbase"
        "libbase"
        "libdexfile_external"
        "libdexfile_support"
    ];
};

libdexfile_support_static_defaults = cc_defaults {
    name = "libdexfile_support_static_defaults";
    host_supported = true;
    srcs = [
        "external/dex_file_supp.cc"
    ];
    cflags = ["-DSTATIC_LIB"];
    #  Using whole_static_libs here only as a "poor man's transitivity" kludge.
    whole_static_libs = [
        "libbase"
        "liblog"
        "libz"
        "libziparchive"
    ];
    header_libs = ["libdexfile_external_headers"];
    export_header_lib_headers = ["libdexfile_external_headers"];
};

libdexfile_support_static = cc_library_static {
    name = "libdexfile_support_static";
    visibility = [
        "//art:__subpackages__"
        #  Required for the simpleperf binary in the NDK. No other modules than
        #  //system/extras/simpleperf:simpleperf_ndk are allowed to use it.
        "//system/extras/simpleperf"
    ];
    defaults = [
        "libdexfile_static_defaults"
        "libdexfile_support_static_defaults"
    ];
    whole_static_libs = [
        "libdexfile"
        "libdexfile_external"
    ];
};

libdexfiled_support_static = cc_library_static {
    name = "libdexfiled_support_static";
    defaults = [
        "libdexfile_support_static_defaults"
        "libdexfiled_static_defaults"
    ];
    whole_static_libs = [
        "libdexfiled"
        "libdexfiled_external"
    ];
};

#  The same source file is used in two tests here, so unlike other ART gtests it
#  doesn't use test_per_src. Its test target is
#  test-art-{host,target}-gtest-art_libdexfile_support_static_tests.
art_libdexfile_support_static_tests = art_cc_test {
    name = "art_libdexfile_support_static_tests";
    host_supported = true;
    srcs = [
        "external/dex_file_supp_test.cc"
    ];
    static_libs = [
        "libbase"
        "libdexfile_support_static"
    ];
};

in { inherit art_libdexfile_external_tests art_libdexfile_support_static_tests art_libdexfile_support_tests art_libdexfile_tests dexfile_operator_srcs libdexfile libdexfile_all_headers libdexfile_defaults libdexfile_external libdexfile_external-defaults libdexfile_external_headers libdexfile_static_base_defaults libdexfile_static_defaults libdexfile_support libdexfile_support_static libdexfile_support_static_defaults libdexfiled libdexfiled_external libdexfiled_static_defaults libdexfiled_support_static; }
