{ cc_binary, cc_defaults, cc_library, cc_library_shared, cc_library_static, cc_test }:
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

simpleperf_defaults = cc_defaults {
    name = "simpleperf_defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wimplicit-fallthrough"

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
};

libsimpleperf_elf_read_static_reqs_defaults = cc_defaults {
    name = "libsimpleperf_elf_read_static_reqs_defaults";
    static_libs = [
        "libLLVMObject"
        "libLLVMBitReader"
        "libLLVMMC"
        "libLLVMMCParser"
        "libLLVMCore"
        "libLLVMSupport"
        "liblzma"
        "libz"
        "libziparchive"
    ];
    target = {
        #  Required for LLVM.
        darwin = {
            host_ldlibs = [
                "-lncurses"
            ];
        };
        linux_glibc = {
            host_ldlibs = [
                "-lncurses"
            ];
        };
    };
};

libsimpleperf_elf_read = cc_library_static {
    name = "libsimpleperf_elf_read";
    defaults = [
        "simpleperf_defaults"
        "libsimpleperf_elf_read_static_reqs_defaults"
    ];
    host_supported = true;

    export_include_dirs = [
        "."
    ];

    static_libs = [
        "libbase"
    ];

    srcs = [
        "read_apk.cpp"
        "read_elf.cpp"
        "utils.cpp"
    ];

    group_static_libs = true;
    use_version_lib = true;
};

simpleperf_cflags = cc_defaults {
    name = "simpleperf_cflags";
    target = {
        host = {
            cflags = [
                "-DUSE_BIONIC_UAPI_HEADERS"
                "-fvisibility=hidden"
            ];
            include_dirs = ["bionic/libc/kernel"];
        };
        darwin = {
            cflags = ["-DNO_LIBDEXFILE_SUPPORT"];
            local_include_dirs = ["nonlinux_support/include"];
        };
        windows = {
            cflags = ["-DNO_LIBDEXFILE_SUPPORT"];
            local_include_dirs = ["nonlinux_support/include"];
        };
    };
};

#  linked as a separate library because using OpenCSD headers needs to enable exception
libsimpleperf_etm_decoder = cc_library_static {
    name = "libsimpleperf_etm_decoder";
    defaults = [
        "simpleperf_cflags"
        "libsimpleperf_elf_read_static_reqs_defaults"
    ];
    host_supported = true;
    srcs = ["ETMDecoder.cpp"];
    cppflags = [
        #  flags needed to include libopencsd_decoder headers
        "-Wno-ignored-qualifiers"
        "-Wno-unused-parameter"
        "-Wno-switch"
        "-Wno-unused-private-field"
        "-Wno-implicit-fallthrough"
        "-fexceptions"
    ];
    rtti = true;
    static_libs = [
        "libopencsd_decoder"
        "libbase"
        "liblog"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

simpleperf_static_libs = cc_defaults {
    name = "simpleperf_static_libs";
    defaults = [
        "libsimpleperf_elf_read_static_reqs_defaults"
        "simpleperf_cflags"
    ];
    host_supported = true;
    static_libs = [
        "libsimpleperf_etm_decoder"
        "libbase"
        "liblog"
        "libutils"
        "libprotobuf-cpp-lite"
        "libopencsd_decoder"
    ];
    target = {
        linux = {
            static_libs = [
                "libunwindstack"
                "libcutils"
                "libprocinfo"
                "libevent"
            ];
        };
        android = {
            static_libs = [
                "libc"
            ];
        };
        host = {
            stl = "libc++_static";
        };
        windows = {
            enabled = true;
        };
    };
    use_version_lib = true;
};

simpleperf_shared_libs = cc_defaults {
    name = "simpleperf_shared_libs";
    defaults = [
        "simpleperf_cflags"
    ];
    host_supported = true;
    shared_libs = [
        "libbase"
        "liblzma"
        "libprotobuf-cpp-lite"
        "libziparchive"
    ];
    static_libs = [
        "libsimpleperf_etm_decoder"
        "libopencsd_decoder"
    ];
    target = {
        linux = {
            shared_libs = [
                "libcutils"
                "libdexfile_support"
                "libevent"
                "libprocinfo"
                "libunwindstack"
            ];
        };
        darwin = {
            host_ldlibs = [
                "-lncurses"
            ];
        };
        linux_glibc = {
            host_ldlibs = [
                "-lncurses"
            ];
        };
        host = {
            static_libs = [
                "libLLVMObject"
                "libLLVMBitReader"
                "libLLVMMC"
                "libLLVMMCParser"
                "libLLVMCore"
                "libLLVMSupport"
            ];
        };
        windows = {
            enabled = true;
        };
    };
    use_version_lib = true;
};

simpleperf_libs_for_tests = cc_defaults {
    name = "simpleperf_libs_for_tests";
    defaults = ["simpleperf_shared_libs"];
    target = {
        android = {
            #  32-bit libLLVM_android isn't shipped on device. So use static llvm libs in tests.
            static_libs = [
                "libLLVMObject"
                "libLLVMBitReader"
                "libLLVMMC"
                "libLLVMMCParser"
                "libLLVMCore"
                "libLLVMSupport"
            ];
        };
    };
};

libsimpleperf_srcs = cc_defaults {
    name = "libsimpleperf_srcs";
    srcs = [
        "cmd_dumprecord.cpp"
        "cmd_help.cpp"
        "cmd_inject.cpp"
        "cmd_kmem.cpp"
        "cmd_report.cpp"
        "cmd_report_sample.cpp"
        "command.cpp"
        "dso.cpp"
        "event_attr.cpp"
        "event_type.cpp"
        "perf_regs.cpp"
        "read_apk.cpp"
        "read_elf.cpp"
        "record.cpp"
        "record_file_reader.cpp"
        "report_sample.proto"
        "thread_tree.cpp"
        "tracing.cpp"
        "utils.cpp"
    ];
    target = {
        linux = {
            srcs = [
                "CallChainJoiner.cpp"
                "cmd_api.cpp"
                "cmd_debug_unwind.cpp"
                "cmd_list.cpp"
                "cmd_record.cpp"
                "cmd_stat.cpp"
                "cmd_trace_sched.cpp"
                "environment.cpp"
                "ETMRecorder.cpp"
                "event_fd.cpp"
                "event_selection_set.cpp"
                "IOEventLoop.cpp"
                "JITDebugReader.cpp"
                "OfflineUnwinder.cpp"
                "read_dex_file.cpp"
                "record_file_writer.cpp"
                "RecordReadThread.cpp"
                "workload.cpp"
            ];
        };
        darwin = {
            srcs = ["nonlinux_support/nonlinux_support.cpp"];
        };
        windows = {
            srcs = ["nonlinux_support/nonlinux_support.cpp"];
        };
    };
};

libsimpleperf = cc_library_static {
    name = "libsimpleperf";
    defaults = [
        "libsimpleperf_srcs"
        "simpleperf_static_libs"
    ];
    compile_multilib = "both";
    proto = {
        type = "lite";
    };
    static_libs = [
        "libbuildversion"
    ];
    use_version_lib = false;

    target = {
        linux = {
            #  See note for libdexfile_support_static in simpleperf_ndk.
            static_libs = ["libdexfile_support"];
        };
    };
};

#  simpleperf shipped in system image
simpleperf = cc_binary {
    name = "simpleperf";
    defaults = [
        "simpleperf_shared_libs"
    ];
    host_supported = false;
    srcs = [
        "main.cpp"
    ];
    static_libs = ["libsimpleperf"];
    target = {
        android = {
            shared_libs = [
                "libLLVM_android"
            ];
        };
    };
};

#  simpleperf released in ndk
simpleperf_ndk = cc_binary {
    name = "simpleperf_ndk";
    defaults = [
        "simpleperf_static_libs"
    ];
    dist = {
        targets = ["simpleperf"];
    };
    srcs = [
        "main.cpp"
    ];
    static_libs = [
        "libsimpleperf"
    ];

    compile_multilib = "both";
    multilib = {
        lib64 = {
            suffix = "64";
        };
    };

    target = {
        android = {
            static_executable = true;
        };
        android_arm = {
            dist = {
                dir = "simpleperf/android/arm";
            };
        };
        android_arm64 = {
            dist = {
                dir = "simpleperf/android/arm64";
            };
        };
        android_x86 = {
            dist = {
                dir = "simpleperf/android/x86";
            };
        };
        android_x86_64 = {
            dist = {
                dir = "simpleperf/android/x86_64";
            };
        };
        darwin = {
            dist = {
                dir = "simpleperf/darwin/x86";
            };
        };
        darwin_x86_64 = {
            dist = {
                dir = "simpleperf/darwin/x86_64";
            };
        };
        linux = {
            #  In the NDK we need libdexfile_support_static which links
            #  libdexfile_external and its ART dependencies statically. However
            #  in other libraries we must use libdexfile_support, which dlopen's
            #  libdexfile_external.so from the ART APEX, to avoid getting ART
            #  internals in the system image.
            static_libs = ["libdexfile_support_static"];
        };
        linux_glibc_x86 = {
            dist = {
                dir = "simpleperf/linux/x86";
            };
        };
        linux_glibc_x86_64 = {
            dist = {
                dir = "simpleperf/linux/x86_64";
            };
        };
        windows_x86 = {
            dist = {
                dir = "simpleperf/windows/x86";
            };
        };
        windows_x86_64 = {
            dist = {
                dir = "simpleperf/windows/x86_64";
            };
        };
    };
};

#  It's linked to user's program, to get profile counters and samples for specific code ranges.
libsimpleperf_record = cc_library {
    name = "libsimpleperf_record";
    defaults = [
        "simpleperf_static_libs"
    ];
    export_include_dirs = ["include"];
    ldflags = ["-Wl,--exclude-libs,ALL"];
    srcs = [
        "record_lib_interface.cpp"
    ];
    static_libs = [
        "libsimpleperf"
    ];
    target = {
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
        linux = {
            #  See note for libdexfile_support_static in simpleperf_ndk.
            static_libs = ["libdexfile_support"];
        };
    };
};

#  It's the shared library used on host by python scripts to report samples in different ways.
libsimpleperf_report = cc_library_shared {
    name = "libsimpleperf_report";
    defaults = [
        "simpleperf_static_libs"
    ];
    dist = {
        targets = ["simpleperf"];
    };
    srcs = [
        "report_lib_interface.cpp"
    ];
    static_libs = ["libsimpleperf"];

    target = {
        android = {
            enabled = false;
        };
        linux = {
            ldflags = ["-Wl,--exclude-libs,ALL"];
            #  See note for libdexfile_support_static in simpleperf_ndk. This is
            #  part of the NDK, so use libdexfile_support_static.
            static_libs = ["libdexfile_support_static"];
        };
        darwin = {
            dist = {
                dir = "simpleperf/darwin/x86";
            };
        };
        darwin_x86_64 = {
            dist = {
                dir = "simpleperf/darwin/x86_64";
            };
        };
        linux_glibc_x86 = {
            dist = {
                dir = "simpleperf/linux/x86";
            };
        };
        linux_glibc_x86_64 = {
            dist = {
                dir = "simpleperf/linux/x86_64";
            };
        };
        windows_x86 = {
            dist = {
                dir = "simpleperf/windows/x86";
            };
        };
        windows_x86_64 = {
            dist = {
                dir = "simpleperf/windows/x86_64";
            };
        };
    };
};

simpleperf_test_srcs = cc_defaults {
    name = "simpleperf_test_srcs";
    srcs = [
        "cmd_inject_test.cpp"
        "cmd_kmem_test.cpp"
        "cmd_report_test.cpp"
        "cmd_report_sample_test.cpp"
        "command_test.cpp"
        "dso_test.cpp"
        "gtest_main.cpp"
        "read_apk_test.cpp"
        "read_elf_test.cpp"
        "record_test.cpp"
        "sample_tree_test.cpp"
        "thread_tree_test.cpp"
        "utils_test.cpp"
    ];
    target = {
        linux = {
            srcs = [
                "CallChainJoiner_test.cpp"
                "cmd_api_test.cpp"
                "cmd_debug_unwind_test.cpp"
                "cmd_dumprecord_test.cpp"
                "cmd_list_test.cpp"
                "cmd_record_test.cpp"
                "cmd_stat_test.cpp"
                "cmd_trace_sched_test.cpp"
                "environment_test.cpp"
                "IOEventLoop_test.cpp"
                "OfflineUnwinder_test.cpp"
                "read_dex_file_test.cpp"
                "record_file_test.cpp"
                "RecordReadThread_test.cpp"
                "workload_test.cpp"
            ];
        };
    };
};

simpleperf_unit_test = cc_test {
    name = "simpleperf_unit_test";
    defaults = [
        "simpleperf_test_srcs"
        "simpleperf_libs_for_tests"
    ];
    static_libs = [
        "libgmock"
        "libsimpleperf"
    ];
    target = {
        android = {
            test_suites = ["device-tests"];
        };
    };
    data = [
        "testdata/DisplayBitmaps.apk"
        "testdata/DisplayBitmapsTest.apk"
        "testdata/EndlessTunnel.apk"
        "testdata/base.vdex"
        "testdata/cpp_api.apk"
        "testdata/data/"
        "testdata/elf"
        "testdata/elf_file_source.cpp"
        "testdata/elf_with_mini_debug_info"
        "testdata/etm/"
        "testdata/generated_by_linux_perf.data"
        "testdata/has_embedded_native_libs_apk_perf.data"
        "testdata/invalid_perf.data"
        "testdata/java_api.apk"
        "testdata/kallsyms"
        "testdata/libc.so"
        "testdata/libsgmainso-6.4.36.so"
        "testdata/perf.data"
        "testdata/perf_b.data"
        "testdata/perf_for_build_id_check.data"
        "testdata/perf_g_fp.data"
        "testdata/perf_no_unwind.data"
        "testdata/perf_sched_stat_runtime.data"
        "testdata/perf_test_max_stack_and_percent_limit.data"
        "testdata/perf_unwind_embedded_lib_in_apk.data"
        "testdata/perf_with_app_package_name.data"
        "testdata/perf_with_big_trace_data.data"
        "testdata/perf_with_callchain_record.data"
        "testdata/perf_with_interpreter_frames.data"
        "testdata/perf_with_ip_zero_in_callchain.data"
        "testdata/perf_with_kernel_symbol.data"
        "testdata/perf_with_kernel_symbols_available_false.data"
        "testdata/perf_with_kernel_symbols_available_true.data"
        "testdata/perf_with_kmem_slab_callgraph.data"
        "testdata/perf_with_mini_debug_info.data"
        "testdata/perf_with_multiple_pids_and_tids.data"
        "testdata/perf_with_symbols.data"
        "testdata/perf_with_symbols_for_nonzero_minvaddr_dso.data"
        "testdata/perf_with_trace_offcpu.data"
        "testdata/perf_with_tracepoint_event.data"
        "testdata/perf_with_two_event_types.data"
        "testdata/wrong_ip_callchain_perf.data"
        "testdata/data/app/"
        "testdata/data/correct_symfs_for_build_id_check/"
        "testdata/data/symfs_for_no_symbol_table_warning/"
        "testdata/data/symfs_for_read_elf_file_warning/"
        "testdata/data/symfs_with_build_id_list/"
        "testdata/data/symfs_with_wrong_build_id_list/"
        "testdata/data/symfs_without_build_id/"
        "testdata/data/t2"
        "testdata/data/wrong_symfs_for_build_id_check/"
        "testdata/data/app/com.example.hellojni-1/"
        "testdata/data/app/simpleperf.demo.cpp_api/"
        "testdata/data/app/com.example.hellojni-1/base.apk"
        "testdata/data/app/simpleperf.demo.cpp_api/base.apk"
        "testdata/data/correct_symfs_for_build_id_check/elf_for_build_id_check"
        "testdata/data/symfs_for_no_symbol_table_warning/elf"
        "testdata/data/symfs_for_read_elf_file_warning/elf"
        "testdata/data/symfs_with_build_id_list/build_id_list"
        "testdata/data/symfs_with_build_id_list/elf_for_build_id_check"
        "testdata/data/symfs_with_wrong_build_id_list/build_id_list"
        "testdata/data/symfs_without_build_id/elf"
        "testdata/data/wrong_symfs_for_build_id_check/elf_for_build_id_check"
        "testdata/etm/etm_test_loop"
        "testdata/etm/perf.data"
        "testdata/etm/perf_inject.data"
    ];
};

simpleperf_cpu_hotplug_test = cc_test {
    name = "simpleperf_cpu_hotplug_test";
    defaults = [
        "simpleperf_libs_for_tests"
    ];
    srcs = [
        "cpu_hotplug_test.cpp"
    ];
    static_libs = ["libsimpleperf"];
    target = {
        android = {
            test_suites = ["device-tests"];
        };
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
    };
};

libsimpleperf_cts_test = cc_library_static {
    name = "libsimpleperf_cts_test";
    defaults = [
        "simpleperf_test_srcs"
        "simpleperf_libs_for_tests"
    ];
    host_supported = false;
    cflags = [
        "-DIN_CTS_TEST"
    ];
    static_libs = [
        "libgtest"
    ];
    whole_static_libs = [
        "libgmock"
        "libsimpleperf"
    ];
};

simpleperf_record_test = cc_test {
    name = "simpleperf_record_test";
    defaults = [
        "simpleperf_libs_for_tests"
    ];
    srcs = [
        "record_lib_test.cpp"
    ];
    shared_libs = ["libsimpleperf_record"];
    target = {
        android = {
            test_suites = ["device-tests"];
        };
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
    };
};

in { inherit libsimpleperf libsimpleperf_cts_test libsimpleperf_elf_read libsimpleperf_elf_read_static_reqs_defaults libsimpleperf_etm_decoder libsimpleperf_record libsimpleperf_report libsimpleperf_srcs simpleperf simpleperf_cflags simpleperf_cpu_hotplug_test simpleperf_defaults simpleperf_libs_for_tests simpleperf_ndk simpleperf_record_test simpleperf_shared_libs simpleperf_static_libs simpleperf_test_srcs simpleperf_unit_test; }
