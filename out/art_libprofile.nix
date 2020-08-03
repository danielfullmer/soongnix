{ art_cc_library, art_cc_test, cc_defaults }:
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

libprofile_defaults = cc_defaults {
    name = "libprofile_defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "profile/profile_compilation_info.cc"
    ];
    target = {
        android = {
            shared_libs = [
                "libartbase"
                "libartpalette"
                "libdexfile"
                "libbase"
            ];
            static_libs = [
                #  ZipArchive support, the order matters here to get all symbols.
                "libziparchive"
                "libz"
            ];
            export_shared_lib_headers = ["libbase"];
        };
        not_windows = {
            shared_libs = [
                "libartbase"
                "libartpalette"
                "libdexfile"
                "libziparchive"
                "libz"
                "libbase"
            ];
            export_shared_lib_headers = ["libbase"];
        };
        windows = {
            cflags = ["-Wno-thread-safety"];
            static_libs = [
                "libartbase"
                "libartpalette"
                "libdexfile"
                "libziparchive"
                "libz"
                "libbase"
            ];
            export_static_lib_headers = ["libbase"];
        };
        darwin = {
            enabled = true;
        };
    };
    # generated_sources: ["art_libartbase_operator_srcs"],
    cflags = ["-DBUILDING_LIBART=1"];
    export_include_dirs = ["."];
    #  ART's macros.h depends on libbase's macros.h.
    #  Note: runtime_options.h depends on cmdline. But we don't really want to export this
    #        generically. dex2oat takes care of it itself.
};

libprofile_static_base_defaults = cc_defaults {
    name = "libprofile_static_base_defaults";
    static_libs = [
        "libbase"
        "libz"
        "libziparchive"
    ];
};

libprofile_static_defaults = cc_defaults {
    name = "libprofile_static_defaults";
    defaults = [
        "libprofile_static_base_defaults"
        "libartbase_static_defaults"
        "libdexfile_static_defaults"
    ];
    static_libs = ["libprofile"];
};

libprofiled_static_defaults = cc_defaults {
    name = "libprofiled_static_defaults";
    defaults = [
        "libprofile_static_base_defaults"
        "libartbased_static_defaults"
        "libdexfiled_static_defaults"
    ];
    static_libs = ["libprofiled"];
};

libprofile = art_cc_library {
    name = "libprofile";
    defaults = ["libprofile_defaults"];
    #  Leave the symbols in the shared library so that stack unwinders can
    #  produce meaningful name resolution.
    strip = {
        keep_symbols = true;
    };
    shared_libs = [
        "libbase"
        "libziparchive"
    ];
    export_shared_lib_headers = ["libbase"];
    target = {
        windows = {
            enabled = true;
            shared = {
                enabled = false;
            };
        };
    };
};

libprofiled = art_cc_library {
    name = "libprofiled";
    defaults = [
        "art_debug_defaults"
        "libprofile_defaults"
    ];
    shared_libs = [
        "libbase"
        "libziparchive"
    ];
    export_shared_lib_headers = ["libbase"];
};

#  For now many of these tests still use CommonRuntimeTest, almost universally because of
#  ScratchFile and related.
#  TODO: Remove CommonRuntimeTest dependency from these tests.
art_libprofile_tests = art_cc_test {
    name = "art_libprofile_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = [
        "profile/profile_compilation_info_test.cc"
    ];
    shared_libs = [
        "libartbased"
        "libdexfiled"
        "libartbased"
        "libziparchive"
    ];
};

in { inherit art_libprofile_tests libprofile libprofile_defaults libprofile_static_base_defaults libprofile_static_defaults libprofiled libprofiled_static_defaults; }
