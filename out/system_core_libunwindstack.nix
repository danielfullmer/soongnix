{ cc_benchmark, cc_binary, cc_binary_host, cc_defaults, cc_library, cc_test, cc_test_library }:
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

libunwindstack_flags = cc_defaults {
    name = "libunwindstack_flags";

    host_supported = true;

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];

    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
        };
    };
};

libunwindstack = cc_library {
    name = "libunwindstack";
    vendor_available = true;
    recovery_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    defaults = ["libunwindstack_flags"];
    export_include_dirs = ["include"];

    srcs = [
        "ArmExidx.cpp"
        "DexFile.cpp"
        "DexFiles.cpp"
        "DwarfCfa.cpp"
        "DwarfEhFrameWithHdr.cpp"
        "DwarfMemory.cpp"
        "DwarfOp.cpp"
        "DwarfSection.cpp"
        "Elf.cpp"
        "ElfInterface.cpp"
        "ElfInterfaceArm.cpp"
        "Global.cpp"
        "JitDebug.cpp"
        "Log.cpp"
        "MapInfo.cpp"
        "Maps.cpp"
        "Memory.cpp"
        "LocalUnwinder.cpp"
        "Regs.cpp"
        "RegsArm.cpp"
        "RegsArm64.cpp"
        "RegsX86.cpp"
        "RegsX86_64.cpp"
        "RegsMips.cpp"
        "RegsMips64.cpp"
        "Unwinder.cpp"
        "Symbols.cpp"
    ];

    cflags = [
        "-Wexit-time-destructors"
    ];

    target = {
        #  Always disable optimizations for host to make it easier to debug.
        host = {
            cflags = [
                "-O0"
                "-g"
            ];
        };
        vendor = {
            cflags = ["-DNO_LIBDEXFILE_SUPPORT"];
            exclude_srcs = [
                "DexFile.cpp"
                "DexFiles.cpp"
            ];
            exclude_shared_libs = [
                "libdexfile_support"
            ];
        };
        recovery = {
            cflags = ["-DNO_LIBDEXFILE_SUPPORT"];
            exclude_srcs = [
                "DexFile.cpp"
                "DexFiles.cpp"
            ];
            exclude_shared_libs = [
                "libdexfile_support"
            ];
        };
    };

    arch = {
        x86 = {
            srcs = ["AsmGetRegsX86.S"];
        };
        x86_64 = {
            srcs = ["AsmGetRegsX86_64.S"];
        };
        mips = {
            srcs = ["AsmGetRegsMips.S"];
        };
        mips64 = {
            srcs = ["AsmGetRegsMips64.S"];
        };
    };

    whole_static_libs = [
        "libdemangle"
    ];

    static_libs = [
        "libprocinfo"
    ];

    shared_libs = [
        "libbase"
        "libdexfile_support"
        "liblog"
        "liblzma"
    ];
};

# -------------------------------------------------------------------------
#  Unit Tests
# -------------------------------------------------------------------------
libunwindstack_local = cc_test_library {
    name = "libunwindstack_local";
    defaults = ["libunwindstack_flags"];
    srcs = ["tests/TestLocal.cpp"];

    cflags = [
        "-O0"
        "-g"
    ];

    shared_libs = [
        "libunwindstack"
    ];
};

libunwindstack_test = cc_test {
    name = "libunwindstack_test";
    defaults = ["libunwindstack_flags"];

    srcs = [
        "tests/ArmExidxDecodeTest.cpp"
        "tests/ArmExidxExtractTest.cpp"
        "tests/DexFileTest.cpp"
        "tests/DexFilesTest.cpp"
        "tests/DwarfCfaLogTest.cpp"
        "tests/DwarfCfaTest.cpp"
        "tests/DwarfDebugFrameTest.cpp"
        "tests/DwarfEhFrameTest.cpp"
        "tests/DwarfEhFrameWithHdrTest.cpp"
        "tests/DwarfMemoryTest.cpp"
        "tests/DwarfOpLogTest.cpp"
        "tests/DwarfOpTest.cpp"
        "tests/DwarfSectionTest.cpp"
        "tests/DwarfSectionImplTest.cpp"
        "tests/ElfCacheTest.cpp"
        "tests/ElfFake.cpp"
        "tests/ElfInterfaceArmTest.cpp"
        "tests/ElfInterfaceTest.cpp"
        "tests/ElfTest.cpp"
        "tests/ElfTestUtils.cpp"
        "tests/JitDebugTest.cpp"
        "tests/LocalUnwinderTest.cpp"
        "tests/LogFake.cpp"
        "tests/MapInfoCreateMemoryTest.cpp"
        "tests/MapInfoGetBuildIDTest.cpp"
        "tests/MapInfoGetElfTest.cpp"
        "tests/MapInfoGetLoadBiasTest.cpp"
        "tests/MapInfoTest.cpp"
        "tests/MapsTest.cpp"
        "tests/MemoryBufferTest.cpp"
        "tests/MemoryCacheTest.cpp"
        "tests/MemoryFake.cpp"
        "tests/MemoryFileTest.cpp"
        "tests/MemoryLocalTest.cpp"
        "tests/MemoryOfflineBufferTest.cpp"
        "tests/MemoryOfflineTest.cpp"
        "tests/MemoryRangeTest.cpp"
        "tests/MemoryRangesTest.cpp"
        "tests/MemoryRemoteTest.cpp"
        "tests/MemoryTest.cpp"
        "tests/RegsInfoTest.cpp"
        "tests/RegsIterateTest.cpp"
        "tests/RegsStepIfSignalHandlerTest.cpp"
        "tests/RegsTest.cpp"
        "tests/SymbolsTest.cpp"
        "tests/TestUtils.cpp"
        "tests/UnwindOfflineTest.cpp"
        "tests/UnwindTest.cpp"
        "tests/UnwinderTest.cpp"
    ];

    cflags = [
        "-O0"
        "-g"
    ];

    shared_libs = [
        "libbase"
        "liblog"
        "liblzma"
        "libunwindstack"
        "libdexfile_support"
    ];

    static_libs = [
        "libgmock"
    ];

    test_suites = ["device-tests"];
    data = [
        "tests/files/elf32.xz"
        "tests/files/elf64.xz"
        "tests/files/offline/art_quick_osr_stub_arm/*"
        "tests/files/offline/bad_eh_frame_hdr_arm64/*"
        "tests/files/offline/debug_frame_first_x86/*"
        "tests/files/offline/debug_frame_load_bias_arm/*"
        "tests/files/offline/eh_frame_hdr_begin_x86_64/*"
        "tests/files/offline/jit_debug_arm/*"
        "tests/files/offline/jit_debug_x86/*"
        "tests/files/offline/jit_map_arm/*"
        "tests/files/offline/gnu_debugdata_arm/*"
        "tests/files/offline/offset_arm/*"
        "tests/files/offline/shared_lib_in_apk_arm64/*"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/*"
        "tests/files/offline/shared_lib_in_apk_single_map_arm64/*"
        "tests/files/offline/straddle_arm/*"
        "tests/files/offline/straddle_arm64/*"
    ];
    required = [
        "libunwindstack_local"
    ];
};

# -------------------------------------------------------------------------
#  Tools
# -------------------------------------------------------------------------
libunwindstack_tools = cc_defaults {
    name = "libunwindstack_tools";
    defaults = ["libunwindstack_flags"];

    shared_libs = [
        "libunwindstack"
        "libbase"
        "liblzma"
    ];
    target = {
        #  Always disable optimizations for host to make it easier to debug.
        host = {
            cflags = [
                "-O0"
                "-g"
            ];
        };
    };
};

unwind = cc_binary {
    name = "unwind";
    defaults = ["libunwindstack_tools"];

    srcs = [
        "tools/unwind.cpp"
    ];
};

unwind_info = cc_binary {
    name = "unwind_info";
    defaults = ["libunwindstack_tools"];

    srcs = [
        "tools/unwind_info.cpp"
    ];
};

unwind_symbols = cc_binary {
    name = "unwind_symbols";
    defaults = ["libunwindstack_tools"];

    srcs = [
        "tools/unwind_symbols.cpp"
    ];
};

unwind_for_offline = cc_binary {
    name = "unwind_for_offline";
    defaults = ["libunwindstack_tools"];

    srcs = [
        "tools/unwind_for_offline.cpp"
    ];
};

unwind_reg_info = cc_binary {
    name = "unwind_reg_info";
    defaults = ["libunwindstack_tools"];

    srcs = [
        "tools/unwind_reg_info.cpp"
    ];
};

# -------------------------------------------------------------------------
#  Benchmarks
# -------------------------------------------------------------------------
unwind_benchmarks = cc_benchmark {
    name = "unwind_benchmarks";
    host_supported = true;
    defaults = ["libunwindstack_flags"];

    #  Disable optimizations so that all of the calls are not optimized away.
    cflags = [
        "-O0"
    ];

    srcs = [
        "benchmarks/unwind_benchmarks.cpp"
    ];

    shared_libs = [
        "libbase"
        "libunwindstack"
    ];
};

#  Generates the elf data for use in the tests for .gnu_debugdata frames.
#  Once these files are generated, use the xz command to compress the data.
gen_gnudebugdata = cc_binary_host {
    name = "gen_gnudebugdata";
    defaults = ["libunwindstack_flags"];

    srcs = [
        "tests/GenGnuDebugdata.cpp"
    ];
};

in { inherit gen_gnudebugdata libunwindstack libunwindstack_flags libunwindstack_local libunwindstack_test libunwindstack_tools unwind unwind_benchmarks unwind_for_offline unwind_info unwind_reg_info unwind_symbols; }
