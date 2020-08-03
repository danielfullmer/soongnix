{ art_cc_defaults, art_cc_library }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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

libart-disassembler-defaults = art_cc_defaults {
    name = "libart-disassembler-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "disassembler.cc"
        "disassembler_mips.cc"
        "disassembler_x86.cc"
    ];
    codegen = {
        arm = {
            srcs = ["disassembler_arm.cc"];
        };
        arm64 = {
            srcs = ["disassembler_arm64.cc"];
        };
        #  TODO: We should also conditionally include the MIPS32/MIPS64 and the
        #  x86/x86-64 disassembler definitions (b/119090273). However, using the
        #  following syntax here:
        #
        #    mips: {
        #        srcs: ["disassembler_mips.cc"]
        #    },
        #    mips64: {
        #        srcs: ["disassembler_mips.cc"]
        #    },
        #    x86: {
        #        srcs: ["disassembler_x86.cc"]
        #    },
        #    x86_64: {
        #        srcs: ["disassembler_x86.cc"]
        #    },
        #
        #  does not work, as it generates a file rejected by ninja with this
        #  error message (e.g. on host, where we include all the back ends by
        #  default):
        #
        #    FAILED: ninja: out/soong/build.ninja:320768: multiple rules generate out/soong/.intermediates/art/disassembler/libart-disassembler/linux_glibc_x86_64_static/obj/art/disassembler/disassembler_mips.o [-w dupbuild=err]
    };
    include_dirs = ["art/runtime"];

    shared_libs = [
        "libbase"
    ];
    header_libs = [
        "art_libartbase_headers"
    ];
    export_include_dirs = ["."];
};

libart-disassembler = art_cc_library {
    name = "libart-disassembler";
    defaults = ["libart-disassembler-defaults"];
    shared_libs = [
        #  For disassembler_arm*.
        "libvixl"
    ];
};

libartd-disassembler = art_cc_library {
    name = "libartd-disassembler";
    defaults = [
        "art_debug_defaults"
        "libart-disassembler-defaults"
    ];
    shared_libs = [
        #  For disassembler_arm*.
        "libvixld"
    ];
};

in { inherit libart-disassembler libart-disassembler-defaults libartd-disassembler; }
