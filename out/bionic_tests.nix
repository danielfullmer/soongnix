{ cc_defaults, cc_test, cc_test_host, cc_test_library }:
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

bionic_tests_defaults = cc_defaults {
    name = "bionic_tests_defaults";
    host_supported = true;
    cpp_std = "experimental";
    target = {
        darwin = {
            enabled = false;
        };
    };
    cflags = [
        "-fstack-protector-all"
        "-g"
        "-Wall"
        "-Wextra"
        "-Wunused"
        "-Werror"
        "-fno-builtin"

        #  We want to test deprecated API too.
        "-Wno-deprecated-declarations"

        #  For glibc.
        "-D__STDC_LIMIT_MACROS"
    ];
    #  Make the bionic tests implicitly test bionic's shadow call stack support.
    arch = {
        arm64 = {
            cflags = ["-fsanitize=shadow-call-stack"];
        };
    };
    stl = "libc++";
    sanitize = {
        address = false;
    };
    bootstrap = true;
};

#  -----------------------------------------------------------------------------
#  All standard tests.
#  -----------------------------------------------------------------------------

#  Test diagnostics emitted by clang. The library that results is useless; we
#  just want to run '-Xclang -verify', which will fail if the diagnostics don't
#  match up with what the source file says they should be.
clang_diagnostic_tests = cc_test_library {
    name = "clang_diagnostic_tests";
    cflags = [
        "-Xclang"
        "-verify"
    ];
    srcs = ["sys_ioctl_diag_test.cpp"];
};

libBionicStandardTests = cc_test_library {
    name = "libBionicStandardTests";
    defaults = ["bionic_tests_defaults"];
    srcs = [
        "__aeabi_read_tp_test.cpp"
        "alloca_test.cpp"
        "android_get_device_api_level.cpp"
        "arpa_inet_test.cpp"
        "async_safe_test.cpp"
        "assert_test.cpp"
        "buffer_tests.cpp"
        "bug_26110743_test.cpp"
        "byteswap_test.cpp"
        "complex_test.cpp"
        "complex_force_long_double_test.cpp"
        "ctype_test.cpp"
        "dirent_test.cpp"
        "elf_test.cpp"
        "endian_test.cpp"
        "errno_test.cpp"
        "error_test.cpp"
        "eventfd_test.cpp"
        "fcntl_test.cpp"
        "fdsan_test.cpp"
        "fenv_test.cpp"
        "float_test.cpp"
        "ftw_test.cpp"
        "getauxval_test.cpp"
        "getcwd_test.cpp"
        "glob_test.cpp"
        "grp_pwd_test.cpp"
        "grp_pwd_file_test.cpp"
        "iconv_test.cpp"
        "ifaddrs_test.cpp"
        "ifunc_test.cpp"
        "inttypes_test.cpp"
        "iso646_test.c"
        "langinfo_test.cpp"
        "leak_test.cpp"
        "libgen_basename_test.cpp"
        "libgen_test.cpp"
        "limits_test.cpp"
        "linux_swab_test.cpp"
        "locale_test.cpp"
        "malloc_iterate_test.cpp"
        "malloc_test.cpp"
        "math_test.cpp"
        "math_force_long_double_test.cpp"
        "membarrier_test.cpp"
        "mntent_test.cpp"
        "netdb_test.cpp"
        "net_if_test.cpp"
        "netinet_ether_test.cpp"
        "netinet_in_test.cpp"
        "netinet_ip_icmp_test.cpp"
        "netinet_udp_test.cpp"
        "nl_types_test.cpp"
        "poll_test.cpp"
        "pthread_test.cpp"
        "pty_test.cpp"
        "regex_test.cpp"
        "resolv_test.cpp"
        "sched_test.cpp"
        "scs_test.cpp"
        "scsi_sg_test.cpp"
        "search_test.cpp"
        "semaphore_test.cpp"
        "setjmp_test.cpp"
        "signal_test.cpp"
        "spawn_test.cpp"
        "stack_protector_test.cpp"
        "stack_protector_test_helper.cpp"
        "stack_unwinding_test.cpp"
        "stdalign_test.cpp"
        "stdarg_test.cpp"
        "stdatomic_test.cpp"
        "stdbool_test.c"
        "stdint_test.cpp"
        "stdio_nofortify_test.cpp"
        "stdio_test.cpp"
        "stdio_ext_test.cpp"
        "stdlib_test.cpp"
        "stdnoreturn_test.cpp"
        "string_nofortify_test.cpp"
        "string_test.cpp"
        "string_posix_strerror_r_test.cpp"
        "strings_nofortify_test.cpp"
        "strings_test.cpp"
        "sstream_test.cpp"
        "sys_epoll_test.cpp"
        "sys_mman_test.cpp"
        "sys_msg_test.cpp"
        "sys_param_test.cpp"
        "sys_personality_test.cpp"
        "sys_prctl_test.cpp"
        "sys_procfs_test.cpp"
        "sys_ptrace_test.cpp"
        "sys_quota_test.cpp"
        "sys_random_test.cpp"
        "sys_resource_test.cpp"
        "sys_select_test.cpp"
        "sys_sem_test.cpp"
        "sys_sendfile_test.cpp"
        "sys_shm_test.cpp"
        "sys_signalfd_test.cpp"
        "sys_socket_test.cpp"
        "sys_stat_test.cpp"
        "sys_statvfs_test.cpp"
        "sys_syscall_test.cpp"
        "sys_sysinfo_test.cpp"
        "sys_sysmacros_test.cpp"
        "sys_time_test.cpp"
        "sys_timex_test.cpp"
        "sys_ttydefaults_test.cpp"
        "sys_types_test.cpp"
        "sys_uio_test.cpp"
        "sys_un_test.cpp"
        "sys_vfs_test.cpp"
        "sys_xattr_test.cpp"
        "system_properties_test.cpp"
        "system_properties_test2.cpp"
        "termios_test.cpp"
        "tgmath_test.c"
        "time_test.cpp"
        "uchar_test.cpp"
        "unistd_nofortify_test.cpp"
        "unistd_test.cpp"
        "utmp_test.cpp"
        "wchar_test.cpp"
        "wctype_test.cpp"
    ];

    include_dirs = [
        "bionic/libc"
    ];

    target = {
        bionic = {
            whole_static_libs = [
                "libasync_safe"
                "libprocinfo"
                "libsystemproperties"
            ];
        };
    };

    static_libs = [
        "libtinyxml2"
        "liblog"
        "libbase"
    ];
    shared = {
        enabled = false;
    };

    generated_headers = ["generated_android_ids"];
};

libBionicElfTlsTests = cc_test_library {
    name = "libBionicElfTlsTests";
    defaults = ["bionic_tests_defaults"];
    srcs = [
        "elftls_test.cpp"
    ];
    include_dirs = [
        "bionic/libc"
    ];
    shared = {
        enabled = false;
    };
    cflags = [
        "-fno-emulated-tls"
    ];
};

libBionicElfTlsLoaderTests = cc_test_library {
    name = "libBionicElfTlsLoaderTests";
    defaults = ["bionic_tests_defaults"];
    srcs = [
        "elftls_dl_test.cpp"
    ];
    include_dirs = [
        "bionic/libc"
    ];
    static_libs = [
        "liblog"
        "libbase"
    ];
    shared = {
        enabled = false;
    };
    cflags = [
        "-fno-emulated-tls"
    ];
};

#  -----------------------------------------------------------------------------
#  Fortify tests.
#  -----------------------------------------------------------------------------

bionic_fortify_tests_defaults = cc_defaults {
    name = "bionic_fortify_tests_defaults";
    cflags = [
        "-U_FORTIFY_SOURCE"
    ];
    srcs = ["fortify_test_main.cpp"];
    target = {
        host = {
            clang_cflags = ["-D__clang__"];
        };
    };
};

#  If building this fails, then we have both FORTIFY and ASAN enabled, which
#  isn't desirable. (Ideally, we'd emit FORTIFY diagnostics even with ASAN
#  enabled, but that's not a reality today.) This is meant to be otherwise
#  unused.
fortify_disabled_for_asan = cc_test_library {
    name = "fortify_disabled_for_asan";
    cflags = [
        "-Werror"
        "-D_FORTIFY_SOURCE=2"
        #  "sanitize: address" doesn't work on platforms where libasan isn't
        #  enabled. Since the intent is just to build this, we can get away with
        #  passing this flag on its own.
        "-fsanitize=address"
    ];
    #  Ignore that we don't have ASAN symbols linked in.
    allow_undefined_symbols = true;
    srcs = ["fortify_filecheck_diagnostics_test.cpp"];
};

#  Ensure we don't use FORTIFY'ed functions with the static analyzer/clang-tidy:
#  it can confuse these tools pretty easily. If this builds successfully, then
#  __clang_analyzer__ overrode FORTIFY. Otherwise, FORTIFY was incorrectly
#  enabled. The library that results from building this is meant to be unused.
fortify_disabled_for_tidy = cc_test_library {
    name = "fortify_disabled_for_tidy";
    cflags = [
        "-Werror"
        "-D_FORTIFY_SOURCE=2"
        "-D__clang_analyzer__"
    ];
    srcs = ["fortify_filecheck_diagnostics_test.cpp"];
};

libfortify1-tests-clang = cc_test_library {
    name = "libfortify1-tests-clang";
    defaults = [
        "bionic_fortify_tests_defaults"
        "bionic_tests_defaults"
    ];
    cflags = [
        "-D_FORTIFY_SOURCE=1"
        "-DTEST_NAME=Fortify1_clang"
    ];
    shared = {
        enabled = false;
    };
};

libfortify2-tests-clang = cc_test_library {
    name = "libfortify2-tests-clang";
    defaults = [
        "bionic_fortify_tests_defaults"
        "bionic_tests_defaults"
    ];
    cflags = [
        "-D_FORTIFY_SOURCE=2"
        "-DTEST_NAME=Fortify2_clang"
    ];
    shared = {
        enabled = false;
    };
};

#  -----------------------------------------------------------------------------
#  Library of all tests (excluding the dynamic linker tests).
#  -----------------------------------------------------------------------------
libBionicTests = cc_test_library {
    name = "libBionicTests";
    defaults = ["bionic_tests_defaults"];
    whole_static_libs = [
        "libBionicStandardTests"
        "libBionicElfTlsTests"
        "libfortify1-tests-clang"
        "libfortify2-tests-clang"
    ];
    shared = {
        enabled = false;
    };
};

libBionicLoaderTests = cc_test_library {
    name = "libBionicLoaderTests";
    defaults = [
        "bionic_tests_defaults"
        "llvm-defaults"
    ];
    srcs = [
        "atexit_test.cpp"
        "dl_test.cpp"
        "dlfcn_symlink_support.cpp"
        "dlfcn_test.cpp"
        "link_test.cpp"
        "pthread_dlfcn_test.cpp"
    ];
    static_libs = [
        "libbase"
    ];
    include_dirs = [
        "bionic/libc"
    ];
    shared = {
        enabled = false;
    };
    target = {
        android = {
            srcs = [
                "cfi_test.cpp"
                "dlext_test.cpp"
                "libdl_test.cpp"
            ];
            static_libs = [
                "libmeminfo"
                "libprocinfo"
                "libziparchive"
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

#  -----------------------------------------------------------------------------
#  Library of bionic customized gtest main function, with normal gtest output format,
#  which is needed by bionic cts test.
#  -----------------------------------------------------------------------------
libBionicCtsGtestMain = cc_test_library {
    name = "libBionicCtsGtestMain";
    defaults = ["bionic_tests_defaults"];
    srcs = [
        "gtest_globals_cts.cpp"
        "gtest_main.cpp"
    ];
    shared = {
        enabled = false;
    };
    whole_static_libs = [
        "libgtest_isolated"
    ];
};

#  -----------------------------------------------------------------------------
#  Tests for the device using bionic's .so. Run with:
#    adb shell /data/nativetest/bionic-unit-tests/bionic-unit-tests
#    adb shell /data/nativetest64/bionic-unit-tests/bionic-unit-tests
#  -----------------------------------------------------------------------------
bionic_unit_tests_defaults = cc_defaults {
    name = "bionic_unit_tests_defaults";
    host_supported = false;
    gtest = false;

    defaults = [
        "bionic_tests_defaults"
    ];

    whole_static_libs = [
        "libBionicTests"
        "libBionicLoaderTests"
        "libBionicElfTlsLoaderTests"
    ];

    static_libs = [
        "libtinyxml2"
        "liblog"
        "libbase"
        "libgtest_isolated"
    ];

    srcs = [
        #  TODO: Include __cxa_thread_atexit_test.cpp to glibc tests once it is upgraded (glibc 2.18+)
        "__cxa_thread_atexit_test.cpp"
        "gtest_globals.cpp"
        "gtest_main.cpp"
        "thread_local_test.cpp"
    ];

    conlyflags = [
        "-fexceptions"
        "-fnon-call-exceptions"
    ];

    ldflags = ["-Wl,--export-dynamic"];

    include_dirs = ["bionic/libc"];

    stl = "libc++_static";

    target = {
        android = {
            shared_libs = [
                "ld-android"
                "libandroidicu"
                "libdl"
                "libdl_android"
                "libdl_preempt_test_1"
                "libdl_preempt_test_2"
                "libdl_test_df_1_global"
                "libtest_elftls_shared_var"
                "libtest_elftls_tprel"
            ];
            static_libs = [
                #  The order of these libraries matters, do not shuffle them.
                "libbase"
                "libmeminfo"
                "libziparchive"
                "libz"
                "libutils"
                "libLLVMObject"
                "libLLVMBitReader"
                "libLLVMMC"
                "libLLVMMCParser"
                "libLLVMCore"
                "libLLVMSupport"
            ];
            ldflags = [
                "-Wl,--rpath,\${ORIGIN}/../bionic-loader-test-libs"
                "-Wl,--enable-new-dtags"
            ];
        };
    };

    required = [
        "cfi_test_helper"
        "cfi_test_helper2"
        "elftls_dlopen_ie_error_helper"
        "exec_linker_helper"
        "exec_linker_helper_lib"
        "libtest_dt_runpath_a"
        "libtest_dt_runpath_b"
        "libtest_dt_runpath_c"
        "libtest_dt_runpath_x"
        "libtest_dt_runpath_y"
        "libatest_simple_zip"
        "libcfi-test"
        "libcfi-test-bad"
        "libdlext_test_different_soname"
        "libdlext_test_fd"
        "libdlext_test_norelro"
        "libdlext_test_recursive"
        "libdlext_test_runpath_zip_zipaligned"
        "libdlext_test"
        "libdlext_test_zip"
        "libdlext_test_zip_zipaligned"
        "libdl_preempt_test_1"
        "libdl_preempt_test_2"
        "libdl_test_df_1_global"
        "libgnu-hash-table-library"
        "libsysv-hash-table-library"
        "libtestshared"
        "libtest_atexit"
        "libtest_check_order_dlsym_1_left"
        "libtest_check_order_dlsym_2_right"
        "libtest_check_order_dlsym_3_c"
        "libtest_check_order_dlsym_a"
        "libtest_check_order_dlsym_b"
        "libtest_check_order_dlsym_d"
        "libtest_check_order_dlsym"
        "libtest_check_order_reloc_root_1"
        "libtest_check_order_reloc_root_2"
        "libtest_check_order_reloc_root"
        "libtest_check_order_reloc_siblings_1"
        "libtest_check_order_reloc_siblings_2"
        "libtest_check_order_reloc_siblings_3"
        "libtest_check_order_reloc_siblings_a"
        "libtest_check_order_reloc_siblings_b"
        "libtest_check_order_reloc_siblings_c_1"
        "libtest_check_order_reloc_siblings_c_2"
        "libtest_check_order_reloc_siblings_c"
        "libtest_check_order_reloc_siblings_d"
        "libtest_check_order_reloc_siblings_e"
        "libtest_check_order_reloc_siblings_f"
        "libtest_check_order_reloc_siblings"
        "libtest_check_rtld_next_from_library"
        "libtest_dlopen_df_1_global"
        "libtest_dlopen_from_ctor_main"
        "libtest_dlopen_from_ctor"
        "libtest_dlopen_weak_undefined_func"
        "libtest_dlsym_df_1_global"
        "libtest_dlsym_from_this_child"
        "libtest_dlsym_from_this_grandchild"
        "libtest_dlsym_from_this"
        "libtest_dlsym_weak_func"
        "libtest_dt_runpath_d"
        "libtest_elftls_dynamic"
        "libtest_elftls_dynamic_filler_1"
        "libtest_elftls_dynamic_filler_2"
        "libtest_elftls_dynamic_filler_3"
        "libtest_elftls_shared_var"
        "libtest_elftls_shared_var_ie"
        "libtest_elftls_tprel"
        "libtest_empty"
        "libtest_ifunc_variable_impl"
        "libtest_ifunc_variable"
        "libtest_ifunc"
        "libtest_init_fini_order_child"
        "libtest_init_fini_order_grand_child"
        "libtest_init_fini_order_root2"
        "libtest_init_fini_order_root"
        "libtest_missing_symbol_child_public"
        "libtest_missing_symbol_child_private"
        "libtest_missing_symbol_root"
        "libtest_missing_symbol"
        "libtest_nodelete_1"
        "libtest_nodelete_2"
        "libtest_nodelete_dt_flags_1"
        "libtest_pthread_atfork"
        "libtest_relo_check_dt_needed_order_1"
        "libtest_relo_check_dt_needed_order_2"
        "libtest_relo_check_dt_needed_order"
        "libtest_simple"
        "libtest_two_parents_child"
        "libtest_two_parents_parent1"
        "libtest_two_parents_parent2"
        "libtest_versioned_lib"
        "libtest_versioned_libv1"
        "libtest_versioned_libv2"
        "libtest_versioned_otherlib_empty"
        "libtest_versioned_otherlib"
        "libtest_versioned_uselibv1"
        "libtest_versioned_uselibv2_other"
        "libtest_versioned_uselibv2"
        "libtest_versioned_uselibv3_other"
        "libtest_with_dependency_loop_a"
        "libtest_with_dependency_loop_b"
        "libtest_with_dependency_loop_c"
        "libtest_with_dependency_loop"
        "libtest_with_dependency"
        "libtest_indirect_thread_local_dtor"
        "libtest_invalid-empty_shdr_table.so"
        "libtest_invalid-rw_load_segment.so"
        "libtest_invalid-unaligned_shdr_offset.so"
        "libtest_invalid-zero_shdr_table_content.so"
        "libtest_invalid-zero_shdr_table_offset.so"
        "libtest_invalid-zero_shentsize.so"
        "libtest_invalid-zero_shstrndx.so"
        "libtest_invalid-textrels.so"
        "libtest_invalid-textrels2.so"
        "libtest_thread_local_dtor"
        "libtest_thread_local_dtor2"
        "preinit_getauxval_test_helper"
        "preinit_syscall_test_helper"
        "libnstest_private_external"
        "libnstest_dlopened"
        "libnstest_private"
        "libnstest_root_not_isolated"
        "libnstest_root"
        "libnstest_public"
        "libnstest_public_internal"
        "libnstest_ns_a_public1"
        "libnstest_ns_a_public1_internal"
        "libnstest_ns_b_public2"
        "libnstest_ns_b_public3"
        "libsegment_gap_inner"
        "libsegment_gap_outer"
        "ld_preload_test_helper"
        "ld_preload_test_helper_lib1"
        "ld_preload_test_helper_lib2"
        "ld_config_test_helper"
        "ld_config_test_helper_lib1"
        "ld_config_test_helper_lib2"
        "ld_config_test_helper_lib3"
    ];
};

bionic-unit-tests = cc_test {
    name = "bionic-unit-tests";
    defaults = [
        "bionic_unit_tests_defaults"
    ];
};

bionic-unit-tests-scudo = cc_test {
    name = "bionic-unit-tests-scudo";
    defaults = [
        "bionic_unit_tests_defaults"
    ];

    shared_libs = [
        "libc_scudo"
    ];
};

#  -----------------------------------------------------------------------------
#  Tests for the device linked against bionic's static library. Run with:
#    adb shell /data/nativetest/bionic-unit-tests-static/bionic-unit-tests-static
#    adb shell /data/nativetest64/bionic-unit-tests-static/bionic-unit-tests-static
#  -----------------------------------------------------------------------------
bionic-unit-tests-static = cc_test {
    name = "bionic-unit-tests-static";
    gtest = false;
    defaults = ["bionic_tests_defaults"];
    host_supported = false;

    srcs = [
        "gtest_preinit_debuggerd.cpp"
        "gtest_globals.cpp"
        "gtest_main.cpp"

        #  The Bionic allocator has its own C++ API. It isn't packaged into its
        #  own library, so it can only be tested when it's part of libc.a.
        "bionic_allocator_test.cpp"
    ];
    include_dirs = [
        "bionic/libc"
    ];
    whole_static_libs = [
        "libBionicTests"
    ];

    static_libs = [
        "libm"
        "libc"
        "libdl"
        "libtinyxml2"
        "liblog"
        "libbase"
        "libdebuggerd_handler"
        "libgtest_isolated"
        "libtest_elftls_shared_var"
        "libtest_elftls_tprel"
    ];

    static_executable = true;
    stl = "libc++_static";
};

#  -----------------------------------------------------------------------------
#  Tests to run on the host and linked against glibc. Run with:
#    cd bionic/tests; mm bionic-unit-tests-glibc-run
#  -----------------------------------------------------------------------------

bionic-unit-tests-glibc = cc_test_host {
    name = "bionic-unit-tests-glibc";
    gtest = false;
    defaults = ["bionic_tests_defaults"];

    srcs = [
        "atexit_test.cpp"
        "dlfcn_symlink_support.cpp"
        "dlfcn_test.cpp"
        "dl_test.cpp"
        "gtest_globals.cpp"
        "gtest_main.cpp"
        "pthread_dlfcn_test.cpp"
    ];

    shared_libs = [
        "libdl_preempt_test_1"
        "libdl_preempt_test_2"
        "libdl_test_df_1_global"
        "libtest_elftls_shared_var"
        "libtest_elftls_tprel"
    ];

    whole_static_libs = [
        "libBionicStandardTests"
        "libBionicElfTlsTests"
        "libBionicElfTlsLoaderTests"
        "libfortify1-tests-clang"
        "libfortify2-tests-clang"
    ];

    static_libs = [
        "libbase"
        "liblog"
        "libcutils"
        "libgtest_isolated"
    ];

    host_ldlibs = [
        "-lresolv"
        "-lutil"
    ];

    include_dirs = [
        "bionic/libc"
    ];

    ldflags = [
        "-Wl,--rpath,\${ORIGIN}/../bionic-loader-test-libs"
        "-Wl,--export-dynamic"
    ];

    sanitize = {
        never = false;
    };

    target = {
        linux_bionic = {
            enabled = false;
        };
    };
};

subdirs = ["*"];

in { inherit bionic-unit-tests bionic-unit-tests-glibc bionic-unit-tests-scudo bionic-unit-tests-static bionic_fortify_tests_defaults bionic_tests_defaults bionic_unit_tests_defaults clang_diagnostic_tests fortify_disabled_for_asan fortify_disabled_for_tidy libBionicCtsGtestMain libBionicElfTlsLoaderTests libBionicElfTlsTests libBionicLoaderTests libBionicStandardTests libBionicTests libfortify1-tests-clang libfortify2-tests-clang; }
