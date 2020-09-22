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
        "-Wl,--rpath,\${ORIGIN}"
        "-Wl,--enable-new-dtags"
    ];
    relative_install_path = "bionic-loader-test-libs";
    gtest = false;
    sanitize = {
        address = false;
        fuzzer = false;
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
    ldflags = ["-Wl,--rpath,\${ORIGIN}/.."];
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
libdlext_test = cc_test_library {
    name = "libdlext_test";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlext_test_library.cpp"];
    ldflags = ["-Wl,-z,relro"];
    shared_libs = ["libtest_simple"];
};

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
#  Library used by dlext tests - recursive use of RELRO sharing
#  -----------------------------------------------------------------------------
libdlext_test_recursive = cc_test_library {
    name = "libdlext_test_recursive";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlext_test_recursive_library.cpp"];
    ldflags = ["-Wl,-z,relro"];
    shared_libs = ["libdlext_test"];
};

#  -----------------------------------------------------------------------------
#  Library used by dlext tests - different name non-default location
#  -----------------------------------------------------------------------------
libdlext_test_fd = cc_test_library {
    name = "libdlext_test_fd";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["dlext_test_library.cpp"];
    ldflags = ["-Wl,--rpath,\${ORIGIN}/.."];
    relative_install_path = "bionic-loader-test-libs/libdlext_test_fd";
    shared_libs = ["libtest_simple"];
};

#  -----------------------------------------------------------------------------
#  Libraries used by dlext tests for open from a zip-file
#  -----------------------------------------------------------------------------
libdlext_test_zip = cc_test_library {
    name = "libdlext_test_zip";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["dlext_test_library.cpp"];
    shared_libs = ["libatest_simple_zip"];
    relative_install_path = "bionic-loader-test-libs/libdlext_test_zip";
};

libatest_simple_zip = cc_test_library {
    name = "libatest_simple_zip";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["dlopen_testlib_simple.cpp"];
    relative_install_path = "bionic-loader-test-libs/libatest_simple_zip";
};

#  ----------------------------------------------------------------------------
#  Library with soname which does not match filename
#  ----------------------------------------------------------------------------
libdlext_test_different_soname = cc_test_library {
    name = "libdlext_test_different_soname";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlext_test_library.cpp"];
    ldflags = ["-Wl,-soname=libdlext_test_soname.so"];
};

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
#  Build test helper libraries for linker namespaces
#
#  This set of libraries is to test isolated namespaces
#
#  Isolated namespaces do not allow loading of the library outside of
#  the search paths.
#
#  This library cannot be loaded in isolated namespace because one of DT_NEEDED
#  libraries is outside of the search paths.
#
#  libnstest_root_not_isolated.so (DT_RUNPATH = $ORIGIN/../private_namespace_libs_external/)
#  +-> libnstest_public.so
#  +-> libnstest_private_external.so (located in $ORIGIN/../private_namespace_libs_external/)
#
#  Search path: $NATIVE_TESTS/private_namespace_libs/
#
#  -----------------------------------------------------------------------------

libnstest_root_not_isolated = cc_test_library {
    name = "libnstest_root_not_isolated";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["namespaces_root.cpp"];
    shared_libs = [
        "libnstest_public"
        "libnstest_private_external"
    ];
    relative_install_path = "bionic-loader-test-libs/private_namespace_libs";
    ldflags = ["-Wl,--rpath,$ORIGIN/../private_namespace_libs_external"];
};

libnstest_private_external = cc_test_library {
    name = "libnstest_private_external";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["namespaces_private.cpp"];
    relative_install_path = "bionic-loader-test-libs/private_namespace_libs_external";
};

#  -----------------------------------------------------------------------------
#  ns_hidden_child linker namespace test
#  -----------------------------------------------------------------------------

ns_hidden_child_helper = cc_test {
    name = "ns_hidden_child_helper";
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["ns_hidden_child_helper.cpp"];
    shared_libs = [
        "libns_hidden_child_internal"
        "libns_hidden_child_global"
        "libdl_android"
    ];
    ldflags = ["-Wl,--rpath,\${ORIGIN}/.."];
};

libns_hidden_child_global = cc_test_library {
    name = "libns_hidden_child_global";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["ns_hidden_child_global.cpp"];
    shared_libs = ["libns_hidden_child_internal"];
    ldflags = ["-Wl,-z,global"];
};

libns_hidden_child_internal = cc_test_library {
    name = "libns_hidden_child_internal";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["ns_hidden_child_internal.cpp"];
};

libns_hidden_child_public = cc_test_library {
    name = "libns_hidden_child_public";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["ns_hidden_child_public.cpp"];
    shared_libs = ["libns_hidden_child_internal"];
};

libns_hidden_child_app = cc_test_library {
    name = "libns_hidden_child_app";
    defaults = ["bionic_testlib_defaults"];
    host_supported = false;
    srcs = ["ns_hidden_child_app.cpp"];
    shared_libs = ["libns_hidden_child_public"];
    relative_install_path = "bionic-loader-test-libs/ns_hidden_child_app";
};

#  -----------------------------------------------------------------------------
#  Build DT_RUNPATH test helper libraries
#
#  Dependencies
#
#  libtest_dt_runpath_d.so                       runpath: ${ORIGIN}/dt_runpath_b_c_x, ${ORIGIN}/dt_runpath_y/${LIB}
#  |-> dt_runpath_b_c_x/libtest_dt_runpath_b.so  runpath: ${ORIGIN}/../dt_runpath_a
#  |   |-> dt_runpath_a/libtest_dt_runpath_a.so
#  |-> dt_runpath_b_c_x/libtest_dt_runpath_c.so  runpath: ${ORIGIN}/invalid_dt_runpath
#  |   |-> libtest_dt_runpath_a.so (soname)
#  |-> dt_runpath_y/lib[64]/libtest_dt_runpath_y.so
#
#  This one is used to test dlopen
#  dt_runpath_b_c_x/libtest_dt_runpath_x.so
#
#  -----------------------------------------------------------------------------

#  A leaf library in a non-standard directory.
libtest_dt_runpath_a = cc_test_library {
    name = "libtest_dt_runpath_a";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    relative_install_path = "bionic-loader-test-libs/dt_runpath_a";
};

#  Depends on library A with a DT_RUNPATH
libtest_dt_runpath_b = cc_test_library {
    name = "libtest_dt_runpath_b";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    shared_libs = ["libtest_dt_runpath_a"];
    relative_install_path = "bionic-loader-test-libs/dt_runpath_b_c_x";
    ldflags = ["-Wl,--rpath,\${ORIGIN}/../dt_runpath_a"];
};

#  Depends on library A with an incorrect DT_RUNPATH. This does not matter
#  because B is the first in the D (below) dependency order, and library A
#  is already loaded using the correct DT_RUNPATH from library B.
libtest_dt_runpath_c = cc_test_library {
    name = "libtest_dt_runpath_c";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    shared_libs = ["libtest_dt_runpath_a"];
    relative_install_path = "bionic-loader-test-libs/dt_runpath_b_c_x";
    ldflags = ["-Wl,--rpath,\${ORIGIN}/invalid_dt_runpath"];
};

#  D depends on B, C, and Y with DT_RUNPATH.
libtest_dt_runpath_d = cc_test_library {
    name = "libtest_dt_runpath_d";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_b.cpp"];
    shared_libs = [
        "libtest_dt_runpath_b"
        "libtest_dt_runpath_c"
        "libtest_dt_runpath_y"
    ];
    ldflags = [
        "-Wl,--rpath,\${ORIGIN}/dt_runpath_b_c_x"
        "-Wl,--rpath,\${ORIGIN}/dt_runpath_y/\${LIB}"
    ];
};

#  D version for open-from-zip test with runpath
libtest_dt_runpath_d_zip = cc_test_library {
    name = "libtest_dt_runpath_d_zip";
    srcs = ["dlopen_b.cpp"];
    shared_libs = [
        "libtest_dt_runpath_b"
        "libtest_dt_runpath_c"
        "libtest_dt_runpath_y"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    gtest = false;
    relative_install_path = "libtest_dt_runpath_d_zip";
    ldflags = [
        "-Wl,--rpath,\${ORIGIN}/dt_runpath_b_c_x"
        "-Wl,--rpath,\${ORIGIN}/dt_runpath_y/\${LIB}"
    ];
    sanitize = {
        address = false;
        fuzzer = false;
    };
    stl = "libc++_static";
    target = {
        darwin = {
            enabled = false;
        };
    };
};

#  A leaf library in a directory library D has DT_RUNPATH for.
libtest_dt_runpath_x = cc_test_library {
    name = "libtest_dt_runpath_x";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    relative_install_path = "bionic-loader-test-libs/dt_runpath_b_c_x";
};

#  A leaf library in lib or lib64 directory
libtest_dt_runpath_y = cc_test_library {
    name = "libtest_dt_runpath_y";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];

    multilib = {
        lib32 = {
            relative_install_path = "bionic-loader-test-libs/dt_runpath_y/lib";
        };
        lib64 = {
            relative_install_path = "bionic-loader-test-libs/dt_runpath_y/lib64";
        };
    };
};

#  -----------------------------------------------------------------------------
#  Build library with two parents
#
#  Libraries used by dlfcn tests to verify local group ref_counting
#  libtest_two_parents*.so
#  -----------------------------------------------------------------------------

#  ..._child.so - correct answer
libtest_two_parents_child = cc_test_library {
    name = "libtest_two_parents_child";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_2_parents_reloc_answer.cpp"];
};

#  ..._parent1.so - correct answer
libtest_two_parents_parent1 = cc_test_library {
    name = "libtest_two_parents_parent1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_reloc_answer_impl.cpp"];
    shared_libs = ["libtest_two_parents_child"];
    cflags = ["-D__ANSWER=42"];
};

#  ..._parent2.so - incorrect answer
libtest_two_parents_parent2 = cc_test_library {
    name = "libtest_two_parents_parent2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_reloc_answer_impl.cpp"];
    shared_libs = ["libtest_two_parents_child"];
    cflags = ["-D__ANSWER=1"];
};

#  -----------------------------------------------------------------------------
#  Build libtest_check_order_dlsym.so with its dependencies.
#
#  Libraries used by dlfcn tests to verify correct load order:
#  -----------------------------------------------------------------------------

#  libtest_check_order_2_right.so
libtest_check_order_dlsym_2_right = cc_test_library {
    name = "libtest_check_order_dlsym_2_right";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_dlsym_answer.cpp"];
    cflags = ["-D__ANSWER=42"];
};

#  libtest_check_order_a.so
libtest_check_order_dlsym_a = cc_test_library {
    name = "libtest_check_order_dlsym_a";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_dlsym_answer.cpp"];
    cflags = ["-D__ANSWER=1"];
};

#  libtest_check_order_b.so
libtest_check_order_dlsym_b = cc_test_library {
    name = "libtest_check_order_dlsym_b";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_dlsym_answer.cpp"];
    cflags = [
        "-D__ANSWER=2"
        "-D__ANSWER2=43"
    ];
};

#  libtest_check_order_c.so
libtest_check_order_dlsym_3_c = cc_test_library {
    name = "libtest_check_order_dlsym_3_c";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_dlsym_answer.cpp"];
    cflags = ["-D__ANSWER=3"];
};

#  libtest_check_order_d.so
libtest_check_order_dlsym_d = cc_test_library {
    name = "libtest_check_order_dlsym_d";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = ["libtest_check_order_dlsym_b"];
    srcs = ["dlopen_check_order_dlsym_answer.cpp"];
    cflags = [
        "-D__ANSWER=4"
        "-D__ANSWER2=4"
    ];
};

#  libtest_check_order_left.so
libtest_check_order_dlsym_1_left = cc_test_library {
    name = "libtest_check_order_dlsym_1_left";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = [
        "libtest_check_order_dlsym_a"
        "libtest_check_order_dlsym_b"
    ];
    srcs = ["empty.cpp"];
};

#  libtest_check_order.so
libtest_check_order_dlsym = cc_test_library {
    name = "libtest_check_order_dlsym";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = [
        "libtest_check_order_dlsym_1_left"
        "libtest_check_order_dlsym_2_right"
        "libtest_check_order_dlsym_3_c"
    ];
    srcs = ["empty.cpp"];
};

#  -----------------------------------------------------------------------------
#  Build libtest_check_order_siblings.so with its dependencies.
#
#  Libraries used by dlfcn tests to verify correct relocation order:
#  libtest_check_order_reloc_siblings*.so
#  -----------------------------------------------------------------------------

#  ..._1.so - empty
libtest_check_order_reloc_siblings_1 = cc_test_library {
    name = "libtest_check_order_reloc_siblings_1";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = [
        "libtest_check_order_reloc_siblings_a"
        "libtest_check_order_reloc_siblings_b"
    ];
    srcs = ["empty.cpp"];
};

#  ..._2.so - empty
libtest_check_order_reloc_siblings_2 = cc_test_library {
    name = "libtest_check_order_reloc_siblings_2";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = [
        "libtest_check_order_reloc_siblings_c"
        "libtest_check_order_reloc_siblings_d"
    ];
    srcs = [
        "dlopen_check_order_reloc_grandchild_answer.cpp"
    ];
    allow_undefined_symbols = true;
};

#  ..._3.so - get_answer2();
libtest_check_order_reloc_siblings_3 = cc_test_library {
    name = "libtest_check_order_reloc_siblings_3";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = [
        "libtest_check_order_reloc_siblings_e"
        "libtest_check_order_reloc_siblings_f"
    ];
    srcs = [
        "dlopen_check_order_reloc_nephew_answer.cpp"
    ];
};

#  ..._a.so <- correct impl
libtest_check_order_reloc_siblings_a = cc_test_library {
    name = "libtest_check_order_reloc_siblings_a";
    defaults = ["bionic_testlib_defaults"];
    srcs = [
        "dlopen_check_order_reloc_answer_impl.cpp"
    ];
    cflags = ["-D__ANSWER=42"];
};

#  ..._b.so
libtest_check_order_reloc_siblings_b = cc_test_library {
    name = "libtest_check_order_reloc_siblings_b";
    defaults = ["bionic_testlib_defaults"];
    srcs = [
        "dlopen_check_order_reloc_answer_impl.cpp"
    ];
    cflags = ["-D__ANSWER=1"];
};

#  ..._c.so
libtest_check_order_reloc_siblings_c = cc_test_library {
    name = "libtest_check_order_reloc_siblings_c";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = [
        "libtest_check_order_reloc_siblings_c_1"
        "libtest_check_order_reloc_siblings_c_2"
    ];
    srcs = [
        "dlopen_check_order_reloc_answer_impl.cpp"
    ];
    cflags = ["-D__ANSWER=2"];
};

#  ..._d.so
libtest_check_order_reloc_siblings_d = cc_test_library {
    name = "libtest_check_order_reloc_siblings_d";
    defaults = ["bionic_testlib_defaults"];
    srcs = [
        "dlopen_check_order_reloc_answer_impl.cpp"
    ];
    cflags = ["-D__ANSWER=3"];
};

#  ..._e.so
libtest_check_order_reloc_siblings_e = cc_test_library {
    name = "libtest_check_order_reloc_siblings_e";
    defaults = ["bionic_testlib_defaults"];
    srcs = [
        "dlopen_check_order_reloc_answer_impl.cpp"
    ];
    cflags = [
        "-D__ANSWER=4"
    ];
};

#  ..._f.so <- get_answer()
libtest_check_order_reloc_siblings_f = cc_test_library {
    name = "libtest_check_order_reloc_siblings_f";
    defaults = ["bionic_testlib_defaults"];
    srcs = [
        "dlopen_check_order_reloc_answer.cpp"
    ];
};

#  ..._c_1.so
libtest_check_order_reloc_siblings_c_1 = cc_test_library {
    name = "libtest_check_order_reloc_siblings_c_1";
    defaults = ["bionic_testlib_defaults"];
    srcs = [
        "dlopen_check_order_reloc_grandchild_answer_impl.cpp"
    ];
    cflags = ["-D__ANSWER=42"];
};

#  ..._c_2.so
libtest_check_order_reloc_siblings_c_2 = cc_test_library {
    name = "libtest_check_order_reloc_siblings_c_2";
    defaults = ["bionic_testlib_defaults"];
    srcs = [
        "dlopen_check_order_reloc_grandchild_answer_impl.cpp"
    ];
    cflags = ["-D__ANSWER=0"];
};

#  libtest_check_order_reloc_siblings.so
libtest_check_order_reloc_siblings = cc_test_library {
    name = "libtest_check_order_reloc_siblings";
    defaults = ["bionic_testlib_defaults"];
    shared_libs = [
        "libtest_check_order_reloc_siblings_1"
        "libtest_check_order_reloc_siblings_2"
        "libtest_check_order_reloc_siblings_3"
    ];
    srcs = [
        "empty.cpp"
    ];
};

#  -----------------------------------------------------------------------------
#  Build libtest_check_order_root.so with its dependencies.
#
#  Libraries used by dlfcn tests to verify correct relocation order:
#  libtest_check_order_reloc_root*.so
#  -----------------------------------------------------------------------------

#  ..._1.so - empty
libtest_check_order_reloc_root_1 = cc_test_library {
    name = "libtest_check_order_reloc_root_1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
};

#  ..._2.so - this one has the incorrect answer
libtest_check_order_reloc_root_2 = cc_test_library {
    name = "libtest_check_order_reloc_root_2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_reloc_root_answer_impl.cpp"];
    cflags = ["-D__ANSWER=2"];
};

#  libtest_check_order_reloc_root.so <- implements get_answer3()
libtest_check_order_reloc_root = cc_test_library {
    name = "libtest_check_order_reloc_root";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_check_order_reloc_root_answer.cpp"];
    shared_libs = [
        "libtest_check_order_reloc_root_1"
        "libtest_check_order_reloc_root_2"
    ];
};

#  -----------------------------------------------------------------------------
#  Build libtest_versioned_lib.so with its dependencies.
#
#  Libraries used to test versioned symbols
#  -----------------------------------------------------------------------------

libtest_versioned_uselibv1 = cc_test_library {
    name = "libtest_versioned_uselibv1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_uselib.cpp"];
    shared_libs = ["libtest_versioned_libv1"];
};

libtest_versioned_uselibv2 = cc_test_library {
    name = "libtest_versioned_uselibv2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_uselib.cpp"];
    shared_libs = ["libtest_versioned_libv2"];
    version_script = "versioned_uselib.map";
};

libtest_versioned_uselibv2_other = cc_test_library {
    name = "libtest_versioned_uselibv2_other";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_uselib.cpp"];
    shared_libs = [
        "libtest_versioned_otherlib_empty"
        "libtest_versioned_libv2"
    ];
};

libtest_versioned_uselibv3_other = cc_test_library {
    name = "libtest_versioned_uselibv3_other";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_uselib.cpp"];
    shared_libs = [
        "libtest_versioned_otherlib_empty"
        "libtest_versioned_lib"
    ];
};

#  lib v1 - this one used during static linking but never used at runtime
#  which forces libtest_versioned_uselibv1 to use function v1 from
#  libtest_versioned_lib.so
libtest_versioned_libv1 = cc_test_library {
    name = "libtest_versioned_libv1";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_lib_v1.cpp"];
    version_script = "versioned_lib_v1.map";
    ldflags = ["-Wl,-soname,libtest_versioned_lib.so"];
};

#  lib v2 - to make libtest_versioned_uselibv2.so use version 2 of versioned_function()
libtest_versioned_libv2 = cc_test_library {
    name = "libtest_versioned_libv2";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_lib_v2.cpp"];
    version_script = "versioned_lib_v2.map";
    ldflags = ["-Wl,-soname,libtest_versioned_lib.so"];
};

#  last version - this one is used at the runtime and exports 3 versions
#  of versioned_symbol().
libtest_versioned_lib = cc_test_library {
    name = "libtest_versioned_lib";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_lib_v3.cpp"];
    version_script = "versioned_lib_v3.map";
};

#  This library is empty, the actual implementation will provide an unversioned
#  symbol for versioned_function().
libtest_versioned_otherlib_empty = cc_test_library {
    name = "libtest_versioned_otherlib_empty";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["empty.cpp"];
    ldflags = ["-Wl,-soname,libtest_versioned_otherlib.so"];
};

libtest_versioned_otherlib = cc_test_library {
    name = "libtest_versioned_otherlib";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["versioned_lib_other.cpp"];
    version_script = "versioned_lib_other.map";
};

#  -----------------------------------------------------------------------------
#  Build libraries needed by pthread_atfork tests

#  This library used to test phtread_atfork handler behaviour
#  during/after dlclose.
#  -----------------------------------------------------------------------------
libtest_pthread_atfork = cc_test_library {
    name = "libtest_pthread_atfork";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["pthread_atfork.cpp"];
};

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
libtest_with_dependency = cc_test_library {
    name = "libtest_with_dependency";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_simple.cpp"];
    shared_libs = ["libdlext_test"];
};

#  -----------------------------------------------------------------------------
#  Library used by ifunc tests
#  -----------------------------------------------------------------------------
libtest_ifunc = cc_test_library {
    name = "libtest_ifunc";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_ifunc.cpp"];
};

libtest_ifunc_variable = cc_test_library {
    name = "libtest_ifunc_variable";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_ifunc_variable.cpp"];
    shared_libs = ["libtest_ifunc_variable_impl"];
};

libtest_ifunc_variable_impl = cc_test_library {
    name = "libtest_ifunc_variable_impl";
    defaults = ["bionic_testlib_defaults"];
    srcs = ["dlopen_testlib_ifunc_variable_impl.cpp"];
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
    ldflags = ["-Wl,--rpath,\${ORIGIN}/.."];
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
    ldflags = ["-Wl,--rpath,\${ORIGIN}/.."];
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
    ldflags = ["-Wl,--rpath,\${ORIGIN}/.."];
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
    ldflags = ["-Wl,--rpath,\${ORIGIN}/.."];
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

#  -----------------------------------------------------------------------------
#  Check that we support all kinds of relocations: regular, "relocation packer",
#  and both the old and new SHT_RELR constants.
#  -----------------------------------------------------------------------------

#  This is what got standardized for SHT_RELR.
librelocations-RELR = cc_test_library {
    name = "librelocations-RELR";
    ldflags = [
        "-Wl,--pack-dyn-relocs=relr"
        "-Wl,--no-use-android-relr-tags"
    ];
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["relocations.cpp"];

    #  Hack to ensure we're using llvm-objcopy because our binutils prebuilt
    #  only supports the old numbers (http://b/141010852).
    strip = {
        keep_symbols = true;
    };
};

#  This is the same encoding as SHT_RELR, but using OS-specific constants.
librelocations-ANDROID_RELR = cc_test_library {
    name = "librelocations-ANDROID_RELR";
    ldflags = [
        "-Wl,--pack-dyn-relocs=relr"
        "-Wl,--use-android-relr-tags"
    ];
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["relocations.cpp"];
};

#  This is the old relocation packer encoding (DT_ANDROID_REL/DT_ANDROID_RELA).
librelocations-ANDROID_REL = cc_test_library {
    name = "librelocations-ANDROID_REL";
    ldflags = ["-Wl,--pack-dyn-relocs=android"];
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["relocations.cpp"];
};

#  This is not packed at all.
librelocations-fat = cc_test_library {
    name = "librelocations-fat";
    ldflags = ["-Wl,--pack-dyn-relocs=none"];
    host_supported = false;
    defaults = ["bionic_testlib_defaults"];
    srcs = ["relocations.cpp"];
};

in { inherit bionic_testlib_defaults bionic_tests_zipalign cfi_test_helper cfi_test_helper2 elftls_dlopen_ie_error_helper exec_linker_helper exec_linker_helper_lib ld_config_test_helper ld_config_test_helper_lib1 ld_config_test_helper_lib2 ld_config_test_helper_lib3 ld_preload_test_helper ld_preload_test_helper_lib1 ld_preload_test_helper_lib2 libatest_simple_zip libcfi-test libcfi-test-bad libdl_preempt_test_1 libdl_preempt_test_2 libdl_test_df_1_global libdlext_test libdlext_test_different_soname libdlext_test_fd libdlext_test_norelro libdlext_test_recursive libdlext_test_zip libgnu-hash-table-library libns_hidden_child_app libns_hidden_child_global libns_hidden_child_internal libns_hidden_child_public libnstest_dlopened libnstest_ns_a_public1 libnstest_ns_a_public1_internal libnstest_ns_b_public2 libnstest_ns_b_public3 libnstest_private libnstest_private_external libnstest_public libnstest_public_internal libnstest_root libnstest_root_not_isolated librelocations-ANDROID_REL librelocations-ANDROID_RELR librelocations-RELR librelocations-fat libsegment_gap_inner libsegment_gap_outer libsysv-hash-table-library libtest_atexit libtest_check_order_dlsym libtest_check_order_dlsym_1_left libtest_check_order_dlsym_2_right libtest_check_order_dlsym_3_c libtest_check_order_dlsym_a libtest_check_order_dlsym_b libtest_check_order_dlsym_d libtest_check_order_reloc_root libtest_check_order_reloc_root_1 libtest_check_order_reloc_root_2 libtest_check_order_reloc_siblings libtest_check_order_reloc_siblings_1 libtest_check_order_reloc_siblings_2 libtest_check_order_reloc_siblings_3 libtest_check_order_reloc_siblings_a libtest_check_order_reloc_siblings_b libtest_check_order_reloc_siblings_c libtest_check_order_reloc_siblings_c_1 libtest_check_order_reloc_siblings_c_2 libtest_check_order_reloc_siblings_d libtest_check_order_reloc_siblings_e libtest_check_order_reloc_siblings_f libtest_check_rtld_next_from_library libtest_dlopen_df_1_global libtest_dlopen_from_ctor libtest_dlopen_from_ctor_main libtest_dlopen_weak_undefined_func libtest_dlsym_df_1_global libtest_dlsym_from_this libtest_dlsym_from_this_child libtest_dlsym_from_this_grandchild libtest_dlsym_weak_func libtest_dt_runpath_a libtest_dt_runpath_b libtest_dt_runpath_c libtest_dt_runpath_d libtest_dt_runpath_d_zip libtest_dt_runpath_x libtest_dt_runpath_y libtest_elftls_dynamic libtest_elftls_dynamic_filler_1 libtest_elftls_dynamic_filler_2 libtest_elftls_dynamic_filler_3 libtest_elftls_shared_var libtest_elftls_shared_var_ie libtest_elftls_tprel libtest_empty libtest_ifunc libtest_ifunc_variable libtest_ifunc_variable_impl libtest_indirect_thread_local_dtor libtest_init_fini_order_child libtest_init_fini_order_grand_child libtest_init_fini_order_root libtest_init_fini_order_root2 libtest_missing_symbol libtest_missing_symbol_child_private libtest_missing_symbol_child_public libtest_missing_symbol_root libtest_nodelete_1 libtest_nodelete_2 libtest_nodelete_dt_flags_1 libtest_pthread_atfork libtest_relo_check_dt_needed_order libtest_relo_check_dt_needed_order_1 libtest_relo_check_dt_needed_order_2 libtest_simple libtest_thread_local_dtor libtest_thread_local_dtor2 libtest_two_parents_child libtest_two_parents_parent1 libtest_two_parents_parent2 libtest_versioned_lib libtest_versioned_libv1 libtest_versioned_libv2 libtest_versioned_otherlib libtest_versioned_otherlib_empty libtest_versioned_uselibv1 libtest_versioned_uselibv2 libtest_versioned_uselibv2_other libtest_versioned_uselibv3_other libtest_with_dependency libtest_with_dependency_loop libtest_with_dependency_loop_a libtest_with_dependency_loop_b libtest_with_dependency_loop_b_tmp libtest_with_dependency_loop_c libtestshared ns_hidden_child_helper preinit_getauxval_test_helper preinit_syscall_test_helper; }
