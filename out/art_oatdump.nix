{ art_cc_binary, art_cc_test, cc_defaults }:
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

oatdump-defaults = cc_defaults {
    name = "oatdump-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = ["oatdump.cc"];
    header_libs = [
        "art_cmdlineparser_headers"
    ];
};

oatdump = art_cc_binary {
    name = "oatdump";
    defaults = ["oatdump-defaults"];
    shared_libs = [
        "libart"
        "libart-compiler"
        "libart-dexlayout"
        "libart-disassembler"
        "libdexfile"
        "libartbase"
        "libprofile"
        "libbase"
    ];
};

oatdumpd = art_cc_binary {
    name = "oatdumpd";
    defaults = [
        "art_debug_defaults"
        "oatdump-defaults"
    ];
    shared_libs = [
        "libartd"
        "libartd-compiler"
        "libartd-dexlayout"
        "libartd-disassembler"
        "libdexfiled"
        "libartbased"
        "libprofiled"
        "libbase"
    ];
};

oatdumps-defaults = cc_defaults {
    name = "oatdumps-defaults";
    device_supported = false;
    static_executable = true;
    defaults = [
        "oatdump-defaults"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
    ldflags = [
        #  We need this because GC stress mode makes use of
        #  _Unwind_GetIP and _Unwind_Backtrace and the symbols are also
        #  defined in libgcc_eh.a(unwind-dw2.o)
        #  TODO: Having this is not ideal as it might obscure errors.
        #  Try to get rid of it.
        "-z muldefs"
    ];
    static_libs = ["libsigchain_dummy"];
};

oatdumps = art_cc_binary {
    name = "oatdumps";
    defaults = [
        "libart_static_defaults"
        "libartbase_static_defaults"
        "libdexfile_static_defaults"
        "libprofile_static_defaults"
        "libart-compiler_static_defaults"
        "libart-dexlayout_static_defaults"
        "oatdumps-defaults"
    ];
    static_libs = [
        "libart-disassembler"
        "libvixl"
    ];
    #  We need this to resolve libartpalette symbols
    #  correctly. Multiple source libraries depend on it.
    #  TODO(b/122885634): This is also necessary for the static lib ordering bug
    #  with APEX stubs.
    group_static_libs = true;
};

oatdumpds = art_cc_binary {
    name = "oatdumpds";
    defaults = [
        "art_debug_defaults"
        "libartd_static_defaults"
        "libartbased_static_defaults"
        "libdexfiled_static_defaults"
        "libprofiled_static_defaults"
        "libartd-compiler_static_defaults"
        "libartd-dexlayout_static_defaults"
        "oatdumps-defaults"
    ];
    target = {
        linux_glibc_x86_64 = {
            use_clang_lld = true;
        };
    };
    static_libs = [
        "libartd-disassembler"
        "libvixld"
    ];
    group_static_libs = true;
};

art_oatdump_tests = art_cc_test {
    name = "art_oatdump_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = [
        "oatdump_app_test.cc"
        "oatdump_test.cc"
        "oatdump_image_test.cc"
    ];
};

in { inherit art_oatdump_tests oatdump oatdump-defaults oatdumpd oatdumpds oatdumps oatdumps-defaults; }
