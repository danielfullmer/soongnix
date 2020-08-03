{ cc_binary_host, cc_defaults, cc_test, cc_test_library }:
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

bionic_testlib_defaults = cc_defaults {
    name = "bionic_testlib_defaults";
    host_supported = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];
    ldflags = [
        "-Wl,--rpath,${ORIGIN}"
        "-Wl,--enable-new-dtags"
    ];
    relative_install_path = "bionic-loader-test-libs";
    gtest = false;
    sanitize = {
        address = false;
        coverage = false;
    };
    stl = "libc++_static";
    target = {
        darwin = {
            enabled = false;
        };
    };
};

#  -----------------------------------------------------------------------------
#  Libraries and helper binaries for ELF TLS
#  -----------------------------------------------------------------------------
libtest_elftls_shared_var = cc_test_library {
    name = "libtest_elftls_shared_var";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_shared_var.cpp"];
    cflags = ["-fno-emulated-tls"];
};

libtest_elftls_shared_var_ie = cc_test_library {
    name = "libtest_elftls_shared_var_ie";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_shared_var_ie.cpp"];
    cflags = ["-fno-emulated-tls"];
    shared_libs = ["libtest_elftls_shared_var"];
};

libtest_elftls_tprel = cc_test_library {
    name = "libtest_elftls_tprel";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_tprel.cpp"];
    cflags = ["-fno-emulated-tls"];
};

elftls_dlopen_ie_error_helper = cc_test {
    name = "elftls_dlopen_ie_error_helper";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_dlopen_ie_error_helper.cpp"];
    ldflags = ["-Wl,--rpath,${ORIGIN}/.."];
};

libtest_elftls_dynamic = cc_test_library {
    name = "libtest_elftls_dynamic";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_dynamic.cpp"];
    cflags = ["-fno-emulated-tls"];
    shared_libs = ["libtest_elftls_shared_var"];
};

libtest_elftls_dynamic_filler_1 = cc_test_library {
    name = "libtest_elftls_dynamic_filler_1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_dynamic_filler.cpp"];
    cflags = [
        "-fno-emulated-tls"
        "-DTLS_FILLER=100"
    ];
};

libtest_elftls_dynamic_filler_2 = cc_test_library {
    name = "libtest_elftls_dynamic_filler_2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_dynamic_filler.cpp"];
    cflags = [
        "-fno-emulated-tls"
        "-DTLS_FILLER=200"
    ];
};

libtest_elftls_dynamic_filler_3 = cc_test_library {
    name = "libtest_elftls_dynamic_filler_3";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["elftls_dynamic_filler.cpp"];
    cflags = [
        "-fno-emulated-tls"
        "-DTLS_FILLER=300"
    ];
};

#  -----------------------------------------------------------------------------
#  Library to test gnu-styled hash
#  -----------------------------------------------------------------------------
libgnu-hash-table-library = cc_test_library {
    name = "libgnu-hash-table-library";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlext_test_library.cpp"];
    ldflags = ["-Wl,--hash-style=gnu"];
    arch = {
        mips = {
            enabled = false;
        };
        mips64 = {
            enabled = false;
        };
    };
};

#  -----------------------------------------------------------------------------
#  Library to test sysv-styled hash
#  -----------------------------------------------------------------------------
libsysv-hash-table-library = cc_test_library {
    name = "libsysv-hash-table-library";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlext_test_library.cpp"];
    ldflags = ["-Wl,--hash-style=sysv"];
};

#  -----------------------------------------------------------------------------
#  Library used by dlext tests - with GNU RELRO program header
#  -----------------------------------------------------------------------------
#  In Android.mk to support creating symlinks

#  -----------------------------------------------------------------------------
#  Library used by dlext tests - without GNU RELRO program header
#  -----------------------------------------------------------------------------
libdlext_test_norelro = cc_test_library {
    name = "libdlext_test_norelro";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlext_test_library.cpp"];
    ldflags = ["-Wl,-z,norelro"];
    shared_libs = ["libtest_simple"];
};

#  -----------------------------------------------------------------------------
#  Library used by dlext tests - different name non-default location
#  -----------------------------------------------------------------------------
#  In Android.mk to support installing to /data

#  -----------------------------------------------------------------------------
#  Libraries used by dlext tests for open from a zip-file
#  -----------------------------------------------------------------------------
#  In Android.mk to support installing to /data

#  ----------------------------------------------------------------------------
#  Library with soname which does not match filename
#  ----------------------------------------------------------------------------
#  In Android.mk to support zipped and aligned tests

#  -----------------------------------------------------------------------------
#  Library used by dlext tests - zipped and aligned
#  -----------------------------------------------------------------------------
#  In Android.mk to support zipped and aligned tests

#  -----------------------------------------------------------------------------
#  Library used by dlfcn tests
#  -----------------------------------------------------------------------------
libtest_simple = cc_test_library {
    name = "libtest_simple";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_simple.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library used by dlext direct unload on the namespace boundary tests
#  -----------------------------------------------------------------------------
libtest_missing_symbol = cc_test_library {
    name = "libtest_missing_symbol";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_missing_symbol.cpp"];
    allow_undefined_symbols = true;
    relative_install_path = "bionic-loader-test-libs/public_namespace_libs";
};

#  -----------------------------------------------------------------------------
#  Library used by dlext indirect unload on the namespace boundary tests
#
#  These libraries produce following dependency graph:
#  libtest_missing_symbol_root (private ns)
#  +-> libbnstest_public (public ns)
#  +-> libtest_missing_symbol_child_public (public ns)
#      +-> libnstest_public (public ns)
#  +-> libtest_missing_symbol_child_private (private_ns)
#      +-> libnstest_public (public_ns)
#
#  All libraries except libtest_missing_symbol are located in
#  private_namespace_libs/
#  -----------------------------------------------------------------------------
libtest_missing_symbol_child_public = cc_test_library {
    name = "libtest_missing_symbol_child_public";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    relative_install_path = "bionic-loader-test-libs/public_namespace_libs";
    shared_libs = ["libnstest_public"];
};

libtest_missing_symbol_child_private = cc_test_library {
    name = "libtest_missing_symbol_child_private";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    relative_install_path = "bionic-loader-test-libs/private_namespace_libs";
    shared_libs = ["libnstest_public"];
};

libtest_missing_symbol_root = cc_test_library {
    name = "libtest_missing_symbol_root";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_missing_symbol.cpp"];
    relative_install_path = "bionic-loader-test-libs/private_namespace_libs";
    allow_undefined_symbols = true;
    shared_libs = [
        "libnstest_public"
        "libtest_missing_symbol_child_public"
        "libtest_missing_symbol_child_private"
    ];
};

#  -----------------------------------------------------------------------------
#  -----------------------------------------------------------------------------
#  Library used by dlfcn nodelete tests
#  -----------------------------------------------------------------------------
libtest_nodelete_1 = cc_test_library {
    name = "libtest_nodelete_1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_nodelete_1.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library used by dlfcn nodelete tests
#  -----------------------------------------------------------------------------
libtest_nodelete_2 = cc_test_library {
    name = "libtest_nodelete_2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_nodelete_2.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library used by dlfcn nodelete tests
#  -----------------------------------------------------------------------------
libtest_nodelete_dt_flags_1 = cc_test_library {
    name = "libtest_nodelete_dt_flags_1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_nodelete_dt_flags_1.cpp"];
    ldflags = ["-Wl,-z,nodelete"];
};

#  -----------------------------------------------------------------------------
#  Build test helper libraries for linker namespaces
#
#  This set of libraries is used to verify linker namespaces.
#
#  Test cases
#  1. Check that private libraries loaded in different namespaces are
#     different. Check that dlsym does not confuse them.
#  2. Check that public libraries loaded in different namespaces are shared
#     between them.
#  3. Check that namespace sticks on dlopen
#  4. Check that having access to shared library (libnstest_public.so)
#     does not expose symbols from dependent library (libnstest_public_internal.so)
#
#  Dependency tree (visibility)
#  libnstest_root.so (this should be local to the namespace)
#  +-> libnstest_public.so
#      +-> libnstest_public_internal.so
#  +-> libnstest_private.so
#
#  libnstest_dlopened.so (library in private namespace dlopened from libnstest_root.so)
#  -----------------------------------------------------------------------------
libnstest_root = cc_test_library {
    name = "libnstest_root";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["namespaces_root.cpp"];
    relative_install_path = "bionic-loader-test-libs/private_namespace_libs";
    shared_libs = [
        "libnstest_public"
        "libnstest_private"
    ];
    #  The dlext.ns_anonymous test copies the loaded segments of this shared
    #  object into a new mapping, so every segment must be readable. Turn off
    #  eXecute-Only-Memory. See http://b/123034666.
    xom = false;
};

libnstest_public_internal = cc_test_library {
    name = "libnstest_public_internal";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["namespaces_public_internal.cpp"];
    relative_install_path = "bionic-loader-test-libs/public_namespace_libs";
};

libnstest_public = cc_test_library {
    name = "libnstest_public";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["namespaces_public.cpp"];
    relative_install_path = "bionic-loader-test-libs/public_namespace_libs";
    shared_libs = ["libnstest_public_internal"];
};

libnstest_private = cc_test_library {
    name = "libnstest_private";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["namespaces_private.cpp"];
    relative_install_path = "bionic-loader-test-libs/private_namespace_libs";
};

libnstest_dlopened = cc_test_library {
    name = "libnstest_dlopened";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["namespaces_dlopened.cpp"];
    relative_install_path = "bionic-loader-test-libs/private_namespace_libs";
};

#  -----------------------------------------------------------------------------
#  Build test helper libraries for linker namespaces for allow all shared libs
#
#  This set of libraries is used to verify linker namespaces for allow all
#  shared libs.
#
#  Test cases
#  1. Check that namespace a exposes libnstest_ns_a_public1 to
#     namespace b while keeping libnstest_ns_a_public1_internal as an
#     internal lib.
#  2. Check that namespace b exposes all libraries to namespace a.
#
#  Dependency tree (visibility)
#  libnstest_ns_b_public2.so  (ns:b)
#  +-> libnstest_ns_a_public1.so  (ns:a)
#      +-> libnstest_ns_a_public2_internal.so  (ns:a)
#      +-> libnstest_ns_b_public3.so  (ns:b)
#
#  -----------------------------------------------------------------------------
libnstest_ns_a_public1 = cc_test_library {
    name = "libnstest_ns_a_public1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["libnstest_ns_a_public1.cpp"];
    relative_install_path = "bionic-loader-test-libs/ns_a";
    shared_libs = [
        "libnstest_ns_a_public1_internal"
        "libnstest_ns_b_public3"
    ];
};

libnstest_ns_a_public1_internal = cc_test_library {
    name = "libnstest_ns_a_public1_internal";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["libnstest_ns_a_public1_internal.cpp"];
    relative_install_path = "bionic-loader-test-libs/ns_a";
};

libnstest_ns_b_public2 = cc_test_library {
    name = "libnstest_ns_b_public2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["libnstest_ns_b_public2.cpp"];
    relative_install_path = "bionic-loader-test-libs/ns_b";
    shared_libs = ["libnstest_ns_a_public1"];
};

libnstest_ns_b_public3 = cc_test_library {
    name = "libnstest_ns_b_public3";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["libnstest_ns_b_public3.cpp"];
    relative_install_path = "bionic-loader-test-libs/ns_b";
};

#  -----------------------------------------------------------------------------
#  Build DT_RUNPATH test helper libraries
#  -----------------------------------------------------------------------------
#  include $(LOCAL_PATH)/Android.build.dt_runpath.mk

#  -----------------------------------------------------------------------------
#  Build library with two parents
#  -----------------------------------------------------------------------------
#  include $(LOCAL_PATH)/Android.build.dlopen_2_parents_reloc.mk

#  -----------------------------------------------------------------------------
#  Build libtest_check_order_dlsym.so with its dependencies.
#  -----------------------------------------------------------------------------
#  include $(LOCAL_PATH)/Android.build.dlopen_check_order_dlsym.mk

#  -----------------------------------------------------------------------------
#  Build libtest_check_order_siblings.so with its dependencies.
#  -----------------------------------------------------------------------------
#  include $(LOCAL_PATH)/Android.build.dlopen_check_order_reloc_siblings.mk

#  -----------------------------------------------------------------------------
#  Build libtest_check_order_root.so with its dependencies.
#  -----------------------------------------------------------------------------
#  include $(LOCAL_PATH)/Android.build.dlopen_check_order_reloc_main_executable.mk

#  -----------------------------------------------------------------------------
#  Build libtest_versioned_lib.so with its dependencies.
#  -----------------------------------------------------------------------------
#  include $(LOCAL_PATH)/Android.build.versioned_lib.mk

#  -----------------------------------------------------------------------------
#  Build libraries needed by pthread_atfork tests
#  -----------------------------------------------------------------------------
#  include $(LOCAL_PATH)/Android.build.pthread_atfork.mk

#  -----------------------------------------------------------------------------
#  Library with dependency loop used by dlfcn tests
#
#  libtest_with_dependency_loop -> a -> b -> c -> a
#  -----------------------------------------------------------------------------
libtest_with_dependency_loop = cc_test_library {
    name = "libtest_with_dependency_loop";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_loopy_root.cpp"];
    shared_libs = ["libtest_with_dependency_loop_a"];
};

#  -----------------------------------------------------------------------------
#  libtest_with_dependency_loop_a.so
#  -----------------------------------------------------------------------------
libtest_with_dependency_loop_a = cc_test_library {
    name = "libtest_with_dependency_loop_a";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_loopy_a.cpp"];
    shared_libs = ["libtest_with_dependency_loop_b_tmp"];
};

#  -----------------------------------------------------------------------------
#  libtest_with_dependency_loop_b.so
#
#  this is temporary placeholder - will be removed
#  -----------------------------------------------------------------------------
libtest_with_dependency_loop_b_tmp = cc_test_library {
    name = "libtest_with_dependency_loop_b_tmp";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_loopy_invalid.cpp"];
    ldflags = ["-Wl,-soname=libtest_with_dependency_loop_b.so"];
};

#  -----------------------------------------------------------------------------
#  libtest_with_dependency_loop_b.so
#  -----------------------------------------------------------------------------
libtest_with_dependency_loop_b = cc_test_library {
    name = "libtest_with_dependency_loop_b";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_loopy_b.cpp"];
    shared_libs = ["libtest_with_dependency_loop_c"];
};

#  -----------------------------------------------------------------------------
#  libtest_with_dependency_loop_c.so
#  -----------------------------------------------------------------------------
libtest_with_dependency_loop_c = cc_test_library {
    name = "libtest_with_dependency_loop_c";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_loopy_c.cpp"];
    shared_libs = ["libtest_with_dependency_loop_a"];
};

#  -----------------------------------------------------------------------------
#  libtest_relo_check_dt_needed_order.so
#  |
#  +-> libtest_relo_check_dt_needed_order_1.so
#  |
#  +-> libtest_relo_check_dt_needed_order_2.so
#  -----------------------------------------------------------------------------

libtest_relo_check_dt_needed_order = cc_test_library {
    name = "libtest_relo_check_dt_needed_order";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_relo_check_dt_needed_order.cpp"];
    shared_libs = [
        "libtest_relo_check_dt_needed_order_1"
        "libtest_relo_check_dt_needed_order_2"
    ];
};

libtest_relo_check_dt_needed_order_1 = cc_test_library {
    name = "libtest_relo_check_dt_needed_order_1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_relo_check_dt_needed_order_1.cpp"];
};

libtest_relo_check_dt_needed_order_2 = cc_test_library {
    name = "libtest_relo_check_dt_needed_order_2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_relo_check_dt_needed_order_2.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library with dependency used by dlfcn tests
#  -----------------------------------------------------------------------------
#  In Android.mk to support dependency on libdlext_test

#  -----------------------------------------------------------------------------
#  Library used by ifunc tests
#  -----------------------------------------------------------------------------
libtest_ifunc = cc_test_library {
    name = "libtest_ifunc";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_ifunc.cpp"];

    arch = {
        mips = {
            enabled = false;
        };
        mips64 = {
            enabled = false;
        };
    };
};

libtest_ifunc_variable = cc_test_library {
    name = "libtest_ifunc_variable";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_ifunc_variable.cpp"];
    shared_libs = ["libtest_ifunc_variable_impl"];

    arch = {
        mips = {
            enabled = false;
        };
        mips64 = {
            enabled = false;
        };
    };
};

libtest_ifunc_variable_impl = cc_test_library {
    name = "libtest_ifunc_variable_impl";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_ifunc_variable_impl.cpp"];

    arch = {
        mips = {
            enabled = false;
        };
        mips64 = {
            enabled = false;
        };
    };
};

#  -----------------------------------------------------------------------------
#  Library used by atexit tests
#  -----------------------------------------------------------------------------

libtest_atexit = cc_test_library {
    name = "libtest_atexit";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["atexit_testlib.cpp"];
};

#  -----------------------------------------------------------------------------
#  This library is used by dl_load test to check symbol preempting
#  by main executable
#  -----------------------------------------------------------------------------
libdl_preempt_test_1 = cc_test_library {
    name = "libdl_preempt_test_1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dl_preempt_library_1.cpp"];
};

#  -----------------------------------------------------------------------------
#  This library is used by dl_load test to check symbol preempting
#  by libdl_preempt_test_1.so
#  -----------------------------------------------------------------------------
libdl_preempt_test_2 = cc_test_library {
    name = "libdl_preempt_test_2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dl_preempt_library_2.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library with DF_1_GLOBAL
#  -----------------------------------------------------------------------------
libdl_test_df_1_global = cc_test_library {
    name = "libdl_test_df_1_global";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dl_df_1_global.cpp"];
    ldflags = ["-Wl,-z,global"];

    target = {
        host = {
            #  TODO (dimitry): host ld.gold does not yet support -z global
            #  remove this line once it is updated.
            ldflags = ["-fuse-ld=bfd"];
        };
    };
};

#  -----------------------------------------------------------------------------
#  Library using symbol from libdl_test_df_1_global
#  -----------------------------------------------------------------------------
libtest_dlsym_df_1_global = cc_test_library {
    name = "libtest_dlsym_df_1_global";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dl_df_1_use_global.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library with DF_1_GLOBAL which will be dlopened
#  (note: libdl_test_df_1_global above will be included in DT_NEEDED)
#  -----------------------------------------------------------------------------
libtest_dlopen_df_1_global = cc_test_library {
    name = "libtest_dlopen_df_1_global";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dl_df_1_global_dummy.cpp"];
    ldflags = ["-Wl,-z,global"];

    target = {
        host = {
            #  TODO (dimitry): host ld.gold does not yet support -z global
            #  remove this line once it is updated.
            ldflags = ["-fuse-ld=bfd"];
        };
    };
};

#  -----------------------------------------------------------------------------
#  Library with weak function
#  -----------------------------------------------------------------------------
libtest_dlsym_weak_func = cc_test_library {
    name = "libtest_dlsym_weak_func";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlsym_weak_function.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library to check RTLD_LOCAL with dlsym in 'this'
#  -----------------------------------------------------------------------------
libtest_dlsym_from_this = cc_test_library {
    name = "libtest_dlsym_from_this";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlsym_from_this_symbol.cpp"];
    shared_libs = ["libtest_dlsym_from_this_child"];
};

#  -----------------------------------------------------------------------------
libtest_dlsym_from_this_child = cc_test_library {
    name = "libtest_dlsym_from_this_child";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlsym_from_this_functions.cpp"];
    shared_libs = ["libtest_dlsym_from_this_grandchild"];
};

#  -----------------------------------------------------------------------------
libtest_dlsym_from_this_grandchild = cc_test_library {
    name = "libtest_dlsym_from_this_grandchild";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlsym_from_this_symbol2.cpp"];
};

#  -----------------------------------------------------------------------------
#  Empty library
#  -----------------------------------------------------------------------------
libtest_empty = cc_test_library {
    name = "libtest_empty";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library for inaccessible shared library test
#  -----------------------------------------------------------------------------
libtestshared = cc_test_library {
    name = "libtestshared";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    relative_install_path = "bionic-loader-test-libs/inaccessible_libs";
};

#  -----------------------------------------------------------------------------
#  Library with weak undefined function
#  -----------------------------------------------------------------------------
libtest_dlopen_weak_undefined_func = cc_test_library {
    name = "libtest_dlopen_weak_undefined_func";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_weak_undefined.cpp"];
};

#  -----------------------------------------------------------------------------
#  Check that RTLD_NEXT of a libc symbol works in dlopened library
#  -----------------------------------------------------------------------------
libtest_check_rtld_next_from_library = cc_test_library {
    name = "libtest_check_rtld_next_from_library";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["check_rtld_next_from_library.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library with constructor that calls dlopen() b/7941716
#  -----------------------------------------------------------------------------
libtest_dlopen_from_ctor = cc_test_library {
    name = "libtest_dlopen_from_ctor";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_dlopen_from_ctor.cpp"];
};

#  -----------------------------------------------------------------------------
#  Libraries used to check init/fini call order
#  -----------------------------------------------------------------------------
libtest_init_fini_order_root = cc_test_library {
    name = "libtest_init_fini_order_root";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_init_fini_root.cpp"];
    shared_libs = [
        "libtest_init_fini_order_child"
        "libtest_init_fini_order_grand_child"
    ];
};

libtest_init_fini_order_root2 = cc_test_library {
    name = "libtest_init_fini_order_root2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_init_fini_root.cpp"];
    shared_libs = [
        "libtest_init_fini_order_grand_child"
        "libtest_init_fini_order_child"
    ];
};

libtest_init_fini_order_child = cc_test_library {
    name = "libtest_init_fini_order_child";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_init_fini_child.cpp"];
    shared_libs = ["libtest_init_fini_order_grand_child"];
};

libtest_init_fini_order_grand_child = cc_test_library {
    name = "libtest_init_fini_order_grand_child";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_init_fini_grand_child.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library that depends on the library with constructor that calls dlopen() b/7941716
#  -----------------------------------------------------------------------------
libtest_dlopen_from_ctor_main = cc_test_library {
    name = "libtest_dlopen_from_ctor_main";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    shared_libs = ["libtest_dlopen_from_ctor"];
};

#  -----------------------------------------------------------------------------
#  Libraries with non-trivial thread_local variable to test dlclose()
#  -----------------------------------------------------------------------------
libtest_thread_local_dtor = cc_test_library {
    name = "libtest_thread_local_dtor";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["thread_local_dtor.cpp"];
};

libtest_thread_local_dtor2 = cc_test_library {
    name = "libtest_thread_local_dtor2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["thread_local_dtor2.cpp"];
};

#  -----------------------------------------------------------------------------
#  Library dt_needs libtest_thread_local_dtor/2 (to check no-unload on load_group)
#  -----------------------------------------------------------------------------
libtest_indirect_thread_local_dtor = cc_test_library {
    name = "libtest_indirect_thread_local_dtor";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    shared_libs = [
        "libtest_thread_local_dtor"
        "libtest_thread_local_dtor2"
    ];
};

#  -----------------------------------------------------------------------------
#  Tool to use to align the shared libraries in a zip file.
#  -----------------------------------------------------------------------------
bionic_tests_zipalign = cc_binary_host {
    name = "bionic_tests_zipalign";
    srcs = ["bionic_tests_zipalign.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "libziparchive"
        "liblog"
        "libbase"
        "libz"
        "libutils"
    ];
};

libcfi-test = cc_test_library {
    name = "libcfi-test";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["cfi_test_lib.cpp"];
    sanitize = {
        cfi = false;
    };
};

libcfi-test-bad = cc_test_library {
    name = "libcfi-test-bad";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["cfi_test_bad_lib.cpp"];
    sanitize = {
        cfi = false;
    };
};

cfi_test_helper = cc_test {
    name = "cfi_test_helper";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["cfi_test_helper.cpp"];
    ldflags = ["-rdynamic"];
};

cfi_test_helper2 = cc_test {
    name = "cfi_test_helper2";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["cfi_test_helper2.cpp"];
    shared_libs = ["libcfi-test"];
    ldflags = ["-Wl,--rpath,${ORIGIN}/.."];
};

preinit_getauxval_test_helper = cc_test {
    name = "preinit_getauxval_test_helper";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["preinit_getauxval_test_helper.cpp"];
};

preinit_syscall_test_helper = cc_test {
    name = "preinit_syscall_test_helper";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["preinit_syscall_test_helper.cpp"];
};

ld_preload_test_helper = cc_test {
    name = "ld_preload_test_helper";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ld_preload_test_helper.cpp"];
    shared_libs = ["ld_preload_test_helper_lib1"];
    ldflags = ["-Wl,--rpath,${ORIGIN}/.."];
};

ld_preload_test_helper_lib1 = cc_test_library {
    name = "ld_preload_test_helper_lib1";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ld_preload_test_helper_lib1.cpp"];
};

ld_preload_test_helper_lib2 = cc_test_library {
    name = "ld_preload_test_helper_lib2";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ld_preload_test_helper_lib2.cpp"];
};

ld_config_test_helper = cc_test {
    name = "ld_config_test_helper";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ld_config_test_helper.cpp"];
    shared_libs = ["ld_config_test_helper_lib1"];
    ldflags = ["-Wl,--rpath,${ORIGIN}/.."];
};

ld_config_test_helper_lib1 = cc_test_library {
    name = "ld_config_test_helper_lib1";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ld_config_test_helper_lib1.cpp"];
    shared_libs = ["ld_config_test_helper_lib2"];
    relative_install_path = "bionic-loader-test-libs/ns2";
};

ld_config_test_helper_lib2 = cc_test_library {
    name = "ld_config_test_helper_lib2";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ld_config_test_helper_lib2.cpp"];
    relative_install_path = "bionic-loader-test-libs/ns2";
};

ld_config_test_helper_lib3 = cc_test_library {
    name = "ld_config_test_helper_lib3";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ld_config_test_helper_lib3.cpp"];
};

exec_linker_helper = cc_test {
    name = "exec_linker_helper";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["exec_linker_helper.cpp"];
    shared_libs = ["exec_linker_helper_lib"];
    ldflags = ["-Wl,--rpath,${ORIGIN}/.."];
};

exec_linker_helper_lib = cc_test_library {
    name = "exec_linker_helper_lib";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["exec_linker_helper_lib.cpp"];
};

libsegment_gap_outer = cc_test_library {
    name = "libsegment_gap_outer";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["segment_gap_outer.cpp"];
    ldflags = ["-Wl,-T,bionic/tests/libs/segment_gap_outer.lds"];
};

libsegment_gap_inner = cc_test_library {
    name = "libsegment_gap_inner";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["segment_gap_inner.cpp"];
};

in { inherit bionic_testlib_defaults bionic_tests_zipalign cfi_test_helper cfi_test_helper2 elftls_dlopen_ie_error_helper exec_linker_helper exec_linker_helper_lib ld_config_test_helper ld_config_test_helper_lib1 ld_config_test_helper_lib2 ld_config_test_helper_lib3 ld_preload_test_helper ld_preload_test_helper_lib1 ld_preload_test_helper_lib2 libcfi-test libcfi-test-bad libdl_preempt_test_1 libdl_preempt_test_2 libdl_test_df_1_global libdlext_test_norelro libgnu-hash-table-library libnstest_dlopened libnstest_ns_a_public1 libnstest_ns_a_public1_internal libnstest_ns_b_public2 libnstest_ns_b_public3 libnstest_private libnstest_public libnstest_public_internal libnstest_root libsegment_gap_inner libsegment_gap_outer libsysv-hash-table-library libtest_atexit libtest_check_rtld_next_from_library libtest_dlopen_df_1_global libtest_dlopen_from_ctor libtest_dlopen_from_ctor_main libtest_dlopen_weak_undefined_func libtest_dlsym_df_1_global libtest_dlsym_from_this libtest_dlsym_from_this_child libtest_dlsym_from_this_grandchild libtest_dlsym_weak_func libtest_elftls_dynamic libtest_elftls_dynamic_filler_1 libtest_elftls_dynamic_filler_2 libtest_elftls_dynamic_filler_3 libtest_elftls_shared_var libtest_elftls_shared_var_ie libtest_elftls_tprel libtest_empty libtest_ifunc libtest_ifunc_variable libtest_ifunc_variable_impl libtest_indirect_thread_local_dtor libtest_init_fini_order_child libtest_init_fini_order_grand_child libtest_init_fini_order_root libtest_init_fini_order_root2 libtest_missing_symbol libtest_missing_symbol_child_private libtest_missing_symbol_child_public libtest_missing_symbol_root libtest_nodelete_1 libtest_nodelete_2 libtest_nodelete_dt_flags_1 libtest_relo_check_dt_needed_order libtest_relo_check_dt_needed_order_1 libtest_relo_check_dt_needed_order_2 libtest_simple libtest_thread_local_dtor libtest_thread_local_dtor2 libtest_with_dependency_loop libtest_with_dependency_loop_a libtest_with_dependency_loop_b libtest_with_dependency_loop_b_tmp libtest_with_dependency_loop_c libtestshared preinit_getauxval_test_helper preinit_syscall_test_helper; }
