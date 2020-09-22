{ cc_benchmark, cc_binary, cc_binary_host, cc_defaults, cc_library, cc_library_static, cc_test, cc_test_library }:
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

libunwindstack_defaults = cc_defaults {
    name = "libunwindstack_defaults";
    defaults = ["libunwindstack_flags"];
    export_include_dirs = ["include"];

    srcs = [
        "ArmExidx.cpp"
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

    static_libs = [
        "libprocinfo"
    ];

    shared_libs = [
        "libbase"
        "liblog"
        "liblzma"
    ];
};

libunwindstack = cc_library {
    name = "libunwindstack";
    vendor_available = true;
    recovery_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    defaults = ["libunwindstack_defaults"];

    srcs = ["DexFile.cpp"];
    cflags = ["-DDEXFILE_SUPPORT"];
    shared_libs = ["libdexfile_support"];

    target = {
        vendor = {
            cflags = ["-UDEXFILE_SUPPORT"];
            exclude_srcs = ["DexFile.cpp"];
            exclude_shared_libs = ["libdexfile_support"];
        };
        recovery = {
            cflags = ["-UDEXFILE_SUPPORT"];
            exclude_srcs = ["DexFile.cpp"];
            exclude_shared_libs = ["libdexfile_support"];
        };
        native_bridge = {
            cflags = ["-UDEXFILE_SUPPORT"];
            exclude_srcs = ["DexFile.cpp"];
            exclude_shared_libs = ["libdexfile_support"];
        };
    };

    apex_available = [
        "//apex_available:platform"
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#  Static library without DEX support to avoid dependencies on the ART APEX.
libunwindstack_no_dex = cc_library_static {
    name = "libunwindstack_no_dex";
    recovery_available = true;
    defaults = ["libunwindstack_defaults"];

    visibility = [
        "//system/core/debuggerd"
        "//system/core/init"
        "//system/core/libbacktrace"
    ];
    apex_available = [
        "//apex_available:platform"
        "com.android.runtime"
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
    relative_install_path = "libunwindstack_test";
};

libunwindstack_testlib_flags = cc_defaults {
    name = "libunwindstack_testlib_flags";
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
        "tests/IsolatedSettings.cpp"
        "tests/JitDebugTest.cpp"
        "tests/LocalUpdatableMapsTest.cpp"
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
        "tests/VerifyBionicTerminationTest.cpp"
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
        "tests/files/offline/art_quick_osr_stub_arm/descriptor.data"
        "tests/files/offline/art_quick_osr_stub_arm/entry0.data"
        "tests/files/offline/art_quick_osr_stub_arm/entry1.data"
        "tests/files/offline/art_quick_osr_stub_arm/jit0.data"
        "tests/files/offline/art_quick_osr_stub_arm/jit1.data"
        "tests/files/offline/art_quick_osr_stub_arm/libart.so"
        "tests/files/offline/art_quick_osr_stub_arm/libc.so"
        "tests/files/offline/art_quick_osr_stub_arm/maps.txt"
        "tests/files/offline/art_quick_osr_stub_arm/regs.txt"
        "tests/files/offline/art_quick_osr_stub_arm/stack.data"
        "tests/files/offline/bad_eh_frame_hdr_arm64/libc.so"
        "tests/files/offline/bad_eh_frame_hdr_arm64/maps.txt"
        "tests/files/offline/bad_eh_frame_hdr_arm64/regs.txt"
        "tests/files/offline/bad_eh_frame_hdr_arm64/stack.data"
        "tests/files/offline/bad_eh_frame_hdr_arm64/waiter64"
        "tests/files/offline/debug_frame_first_x86/libc.so"
        "tests/files/offline/debug_frame_first_x86/maps.txt"
        "tests/files/offline/debug_frame_first_x86/regs.txt"
        "tests/files/offline/debug_frame_first_x86/stack.data"
        "tests/files/offline/debug_frame_first_x86/waiter"
        "tests/files/offline/debug_frame_load_bias_arm/libbinder.so"
        "tests/files/offline/debug_frame_load_bias_arm/libc.so"
        "tests/files/offline/debug_frame_load_bias_arm/maps.txt"
        "tests/files/offline/debug_frame_load_bias_arm/mediaserver"
        "tests/files/offline/debug_frame_load_bias_arm/regs.txt"
        "tests/files/offline/debug_frame_load_bias_arm/stack.data"
        "tests/files/offline/eh_frame_bias_x86/libc.so"
        "tests/files/offline/eh_frame_bias_x86/maps.txt"
        "tests/files/offline/eh_frame_bias_x86/regs.txt"
        "tests/files/offline/eh_frame_bias_x86/stack.data"
        "tests/files/offline/eh_frame_bias_x86/tombstoned"
        "tests/files/offline/eh_frame_bias_x86/vdso.so"
        "tests/files/offline/eh_frame_hdr_begin_x86_64/libc.so"
        "tests/files/offline/eh_frame_hdr_begin_x86_64/maps.txt"
        "tests/files/offline/eh_frame_hdr_begin_x86_64/regs.txt"
        "tests/files/offline/eh_frame_hdr_begin_x86_64/stack.data"
        "tests/files/offline/eh_frame_hdr_begin_x86_64/unwind_test64"
        "tests/files/offline/empty_arm64/libbinder.so"
        "tests/files/offline/empty_arm64/libc.so"
        "tests/files/offline/empty_arm64/maps.txt"
        "tests/files/offline/empty_arm64/netd"
        "tests/files/offline/empty_arm64/regs.txt"
        "tests/files/offline/empty_arm64/stack.data"
        "tests/files/offline/invalid_elf_offset_arm/maps.txt"
        "tests/files/offline/invalid_elf_offset_arm/regs.txt"
        "tests/files/offline/jit_debug_arm/137-cfi.odex"
        "tests/files/offline/jit_debug_arm/dalvikvm32"
        "tests/files/offline/jit_debug_arm/descriptor.data"
        "tests/files/offline/jit_debug_arm/descriptor1.data"
        "tests/files/offline/jit_debug_arm/entry0.data"
        "tests/files/offline/jit_debug_arm/entry1.data"
        "tests/files/offline/jit_debug_arm/entry2.data"
        "tests/files/offline/jit_debug_arm/entry3.data"
        "tests/files/offline/jit_debug_arm/entry4.data"
        "tests/files/offline/jit_debug_arm/entry5.data"
        "tests/files/offline/jit_debug_arm/entry6.data"
        "tests/files/offline/jit_debug_arm/jit0.data"
        "tests/files/offline/jit_debug_arm/jit1.data"
        "tests/files/offline/jit_debug_arm/jit2.data"
        "tests/files/offline/jit_debug_arm/jit3.data"
        "tests/files/offline/jit_debug_arm/jit4.data"
        "tests/files/offline/jit_debug_arm/jit5.data"
        "tests/files/offline/jit_debug_arm/jit6.data"
        "tests/files/offline/jit_debug_arm/libart.so"
        "tests/files/offline/jit_debug_arm/libartd.so"
        "tests/files/offline/jit_debug_arm/libarttestd.so"
        "tests/files/offline/jit_debug_arm/libc.so"
        "tests/files/offline/jit_debug_arm/maps.txt"
        "tests/files/offline/jit_debug_arm/regs.txt"
        "tests/files/offline/jit_debug_arm/stack.data"
        "tests/files/offline/jit_debug_x86/137-cfi.odex"
        "tests/files/offline/jit_debug_x86/dalvikvm32"
        "tests/files/offline/jit_debug_x86/descriptor.data"
        "tests/files/offline/jit_debug_x86/entry0.data"
        "tests/files/offline/jit_debug_x86/entry1.data"
        "tests/files/offline/jit_debug_x86/entry2.data"
        "tests/files/offline/jit_debug_x86/entry3.data"
        "tests/files/offline/jit_debug_x86/entry4.data"
        "tests/files/offline/jit_debug_x86/entry5.data"
        "tests/files/offline/jit_debug_x86/entry6.data"
        "tests/files/offline/jit_debug_x86/jit0.data"
        "tests/files/offline/jit_debug_x86/jit1.data"
        "tests/files/offline/jit_debug_x86/jit2.data"
        "tests/files/offline/jit_debug_x86/jit3.data"
        "tests/files/offline/jit_debug_x86/jit4.data"
        "tests/files/offline/jit_debug_x86/jit5.data"
        "tests/files/offline/jit_debug_x86/jit6.data"
        "tests/files/offline/jit_debug_x86/libartd.so"
        "tests/files/offline/jit_debug_x86/libarttestd.so"
        "tests/files/offline/jit_debug_x86/libc.so"
        "tests/files/offline/jit_debug_x86/maps.txt"
        "tests/files/offline/jit_debug_x86/regs.txt"
        "tests/files/offline/jit_debug_x86/stack.data"
        "tests/files/offline/jit_map_arm/jit_map0.so"
        "tests/files/offline/jit_map_arm/jit_map1.so"
        "tests/files/offline/jit_map_arm/libart.so"
        "tests/files/offline/jit_map_arm/libc.so"
        "tests/files/offline/jit_map_arm/maps.txt"
        "tests/files/offline/jit_map_arm/regs.txt"
        "tests/files/offline/jit_map_arm/stack.data"
        "tests/files/offline/gnu_debugdata_arm/libandroid_runtime.so"
        "tests/files/offline/gnu_debugdata_arm/maps.txt"
        "tests/files/offline/gnu_debugdata_arm/regs.txt"
        "tests/files/offline/gnu_debugdata_arm/stack.data"
        "tests/files/offline/load_bias_different_section_bias_arm64/libc.so"
        "tests/files/offline/load_bias_different_section_bias_arm64/linker64"
        "tests/files/offline/load_bias_different_section_bias_arm64/maps.txt"
        "tests/files/offline/load_bias_different_section_bias_arm64/regs.txt"
        "tests/files/offline/load_bias_different_section_bias_arm64/stack0.data"
        "tests/files/offline/load_bias_different_section_bias_arm64/stack1.data"
        "tests/files/offline/load_bias_different_section_bias_arm64/test"
        "tests/files/offline/load_bias_different_section_bias_arm64/vdso"
        "tests/files/offline/load_bias_ro_rx_x86_64/libc.so"
        "tests/files/offline/load_bias_ro_rx_x86_64/maps.txt"
        "tests/files/offline/load_bias_ro_rx_x86_64/perfetto_unittests"
        "tests/files/offline/load_bias_ro_rx_x86_64/regs.txt"
        "tests/files/offline/load_bias_ro_rx_x86_64/stack.data"
        "tests/files/offline/offset_arm/libc.so"
        "tests/files/offline/offset_arm/libunwindstack_test"
        "tests/files/offline/offset_arm/maps.txt"
        "tests/files/offline/offset_arm/regs.txt"
        "tests/files/offline/offset_arm/stack0.data"
        "tests/files/offline/offset_arm/stack1.data"
        "tests/files/offline/shared_lib_in_apk_arm64/ANGLEPrebuilt.apk"
        "tests/files/offline/shared_lib_in_apk_arm64/libc.so"
        "tests/files/offline/shared_lib_in_apk_arm64/linker64"
        "tests/files/offline/shared_lib_in_apk_arm64/maps.txt"
        "tests/files/offline/shared_lib_in_apk_arm64/regs.txt"
        "tests/files/offline/shared_lib_in_apk_arm64/stack0.data"
        "tests/files/offline/shared_lib_in_apk_arm64/stack1.data"
        "tests/files/offline/shared_lib_in_apk_arm64/vdso.so"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/lib_mem.data"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/libc.so"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/linker64"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/maps.txt"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/regs.txt"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/stack0.data"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/stack1.data"
        "tests/files/offline/shared_lib_in_apk_memory_only_arm64/vdso.so"
        "tests/files/offline/shared_lib_in_apk_single_map_arm64/libc.so"
        "tests/files/offline/shared_lib_in_apk_single_map_arm64/maps.txt"
        "tests/files/offline/shared_lib_in_apk_single_map_arm64/regs.txt"
        "tests/files/offline/shared_lib_in_apk_single_map_arm64/stack.data"
        "tests/files/offline/shared_lib_in_apk_single_map_arm64/test.apk"
        "tests/files/offline/signal_load_bias_arm/libc.so"
        "tests/files/offline/signal_load_bias_arm/libunwindstack_unit_test"
        "tests/files/offline/signal_load_bias_arm/maps.txt"
        "tests/files/offline/signal_load_bias_arm/regs.txt"
        "tests/files/offline/signal_load_bias_arm/stack0.data"
        "tests/files/offline/signal_load_bias_arm/stack1.data"
        "tests/files/offline/straddle_arm/libbase.so"
        "tests/files/offline/straddle_arm/libc.so"
        "tests/files/offline/straddle_arm/maps.txt"
        "tests/files/offline/straddle_arm/regs.txt"
        "tests/files/offline/straddle_arm/stack.data"
        "tests/files/offline/straddle_arm64/libunwindstack_test"
        "tests/files/offline/straddle_arm64/maps.txt"
        "tests/files/offline/straddle_arm64/regs.txt"
        "tests/files/offline/straddle_arm64/stack.data"
    ];
};

libunwindstack_test = cc_test {
    name = "libunwindstack_test";
    defaults = ["libunwindstack_testlib_flags"];
    isolated = true;

    srcs = [
        "tests/LocalUnwinderTest.cpp"
    ];
    required = [
        "libunwindstack_local"
    ];
};

#  Skip LocalUnwinderTest until atest understands required properly.
libunwindstack_unit_test = cc_test {
    name = "libunwindstack_unit_test";
    defaults = ["libunwindstack_testlib_flags"];
    isolated = true;
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

in { inherit gen_gnudebugdata libunwindstack libunwindstack_defaults libunwindstack_flags libunwindstack_local libunwindstack_no_dex libunwindstack_test libunwindstack_testlib_flags libunwindstack_tools libunwindstack_unit_test unwind unwind_benchmarks unwind_for_offline unwind_info unwind_reg_info unwind_symbols; }
