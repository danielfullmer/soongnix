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
                "libartbase"
                "libartpalette"
                "liblog"
                #  For common macros.
                "libbase"
            ];
            export_shared_lib_headers = [
                "libartbase"
                "libbase"
            ];
        };
        not_windows = {
            shared_libs = [
                "libziparchive"
                "libz"
                #  For MemMap.
                "libartbase"
                "libartpalette"
                "liblog"
                #  For common macros.
                "libbase"
            ];
            export_shared_lib_headers = [
                "libartbase"
                "libbase"
            ];
        };
        windows = {
            static_libs = [
                "libziparchive"
                "libz"
                #  For MemMap.
                "libartbase"
                "libartpalette"
                "liblog"
                #  For common macros.
                "libbase"
            ];
            export_static_lib_headers = [
                "libartbase"
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
    defaults = ["libdexfile_defaults"];
    #  Leave the symbols in the shared library so that stack unwinders can
    #  produce meaningful name resolution.
    strip = {
        keep_symbols = true;
    };
    target = {
        windows = {
            enabled = true;
            shared = {
                enabled = false;
            };
        };
    };
};

libdexfiled = art_cc_library {
    name = "libdexfiled";
    defaults = [
        "art_debug_defaults"
        "libdexfile_defaults"
    ];
    target = {
        windows = {
            enabled = true;
            shared = {
                enabled = false;
            };
        };
    };
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
    include_dirs = [
        "external/zlib"
    ];
};

libdexfile_external_headers = cc_library_headers {
    name = "libdexfile_external_headers";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    header_libs = ["libbase_headers"];
    export_header_lib_headers = ["libbase_headers"];
    export_include_dirs = ["external/include"];

    target = {
        windows = {
            enabled = true;
        };
    };
};

libdexfile_external = cc_library {
    name = "libdexfile_external";
    host_supported = true;
    srcs = [
        "external/dex_file_ext.cc"
    ];
    header_libs = ["libdexfile_external_headers"];
    shared_libs = [
        "libbase"
        "libdexfile"
    ];

    stubs = {
        symbol_file = "external/libdexfile_external.map.txt";
        versions = ["1"];
    };
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
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    srcs = [
        "external/dex_file_supp.cc"
    ];
    required = ["libdexfile_external"];
    shared_libs = ["liblog"];
    header_libs = ["libdexfile_external_headers"];
    export_header_lib_headers = ["libdexfile_external_headers"];
    target = {
        recovery = {
            cflags = ["-DNO_DEXFILE_SUPPORT"];
        };
        vendor = {
            cflags = ["-DNO_DEXFILE_SUPPORT"];
        };
    };
};

#  The same source file is used in two tests here, so unlike other ART gtests it
#  doesn't use test_per_src. Its test target is
#  test-art-{host,target}-gtest-art_libdexfile_support_tests.
art_libdexfile_support_tests = art_cc_test {
    name = "art_libdexfile_support_tests";
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

libdexfile_support_static = cc_library_static {
    name = "libdexfile_support_static";
    host_supported = true;
    defaults = ["libdexfile_static_defaults"];
    srcs = [
        "external/dex_file_supp.cc"
    ];
    cflags = ["-DSTATIC_LIB"];
    #  Using whole_static_libs here only as a "poor man's transitivity" kludge.
    whole_static_libs = [
        "libbase"
        "libdexfile"
        "libdexfile_external"
        "liblog"
        "libz"
        "libziparchive"
    ];
    header_libs = ["libdexfile_external_headers"];
    export_header_lib_headers = ["libdexfile_external_headers"];
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

in { inherit art_libdexfile_external_tests art_libdexfile_support_static_tests art_libdexfile_support_tests art_libdexfile_tests dexfile_operator_srcs libdexfile libdexfile_defaults libdexfile_external libdexfile_external_headers libdexfile_static_base_defaults libdexfile_static_defaults libdexfile_support libdexfile_support_static libdexfiled libdexfiled_static_defaults; }
