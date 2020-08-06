{ cc_binary, cc_library_host_static, cc_library_static, cc_test }:
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
#

ASAN_NEEDS_SEGV = "0";
ASAN_HAS_EXCEPTIONS = "1";
ASAN_FLEXIBLE_MAPPING_AND_OFFSET = "0";

asan_rtl_files = [
    "asan_activation.cc"
    "asan_allocator.cc"
    "asan_fake_stack.cc"
    "asan_flags.cc"
    "asan_globals.cc"
    "asan_interceptors.cc"
    "asan_linux.cc"
    "asan_mac.cc"
    "asan_malloc_linux.cc"
    "asan_malloc_mac.cc"
    "asan_malloc_win.cc"
    "asan_poisoning.cc"
    "asan_posix.cc"
    "asan_report.cc"
    "asan_rtl.cc"
    "asan_stack.cc"
    "asan_stats.cc"
    "asan_suppressions.cc"
    "asan_thread.cc"
    "asan_win.cc"
];

asan_rtl_cxx_files = ["asan_new_delete.cc"];

asan_rtl_cflags = [
    "-fvisibility=hidden"
    "-fno-exceptions"
    "-DASAN_LOW_MEMORY=1"
    ("-DASAN_NEEDS_SEGV=" + ASAN_NEEDS_SEGV)
    ("-DASAN_HAS_EXCEPTIONS=" + ASAN_HAS_EXCEPTIONS)
    ("-DASAN_FLEXIBLE_MAPPING_AND_OFFSET=" + ASAN_FLEXIBLE_MAPPING_AND_OFFSET)
    "-Wall"
    "-Werror"
    "-Wno-covered-switch-default"
    "-Wno-non-virtual-dtor"
    "-Wno-sign-compare"
    "-Wno-unused-parameter"
    "-std=c++11"
    "-fno-rtti"
    "-fno-builtin"
];

libasan = cc_library_static {
    name = "libasan";
    host_supported = true;
    recovery_available = true;
    defaults = ["asan_arch_defaults"];
    include_dirs = [
        "external/compiler-rt/lib"
        "external/compiler-rt/include"
    ];
    cflags = asan_rtl_cflags;
    target = {
        android = {
            srcs = ["asan_preinit.cc"];
            system_shared_libs = [];
        };
        host = {
            srcs = asan_rtl_files;
            whole_static_libs = [
                "libubsan"
                "libinterception"
                "liblsan"
                "libsan"
            ];
        };
    };

    sdk_version = "19";
    stl = "none";

    sanitize = {
        never = true;
    };
};

libasan_cxx = cc_library_host_static {
    name = "libasan_cxx";
    include_dirs = [
        "external/compiler-rt/lib"
        "external/compiler-rt/include"
    ];
    cflags = asan_rtl_cflags;
    srcs = asan_rtl_cxx_files;

    compile_multilib = "both";

    sanitize = {
        never = true;
    };
    target = {
        darwin = {
            enabled = false;
        };
    };
};

asanwrapper = cc_binary {
    name = "asanwrapper";
    defaults = ["asan_arch_defaults"];

    srcs = ["asanwrapper.cc"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
    cppflags = ["-std=c++11"];
    sanitize = {
        never = true;
    };

    stl = "libc++";
};

#  ANDROIDMK TRANSLATION ERROR: unsupported conditional
#  ifneq (true,$(SKIP_LLVM_TESTS))
libasan_noinst_test = cc_library_static {
    name = "libasan_noinst_test";
    host_supported = true;
    defaults = ["asan_arch_defaults"];

    include_dirs = [
        "external/compiler-rt/include"
        "external/compiler-rt/lib"
        "external/compiler-rt/lib/asan/tests"
        "external/compiler-rt/lib/sanitizer_common/tests"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-non-virtual-dtor"
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-DASAN_UAR=0"
        "-DASAN_HAS_BLACKLIST=1"
        ("-DASAN_HAS_EXCEPTIONS=" + ASAN_HAS_EXCEPTIONS)
        ("-DASAN_NEEDS_SEGV=" + ASAN_NEEDS_SEGV)
        "-std=c++11"
    ];
    srcs = [
        "tests/asan_noinst_test.cc"
        "tests/asan_test_main.cc"
    ];

    static_libs = ["libgtest"];

    sanitize = {
        never = true;
    };

    stl = "libc++";
};

asan_test = cc_test {
    name = "asan_test";
    host_supported = true;
    defaults = ["asan_arch_defaults"];

    include_dirs = [
        "external/compiler-rt/lib"
        "external/compiler-rt/lib/asan/tests"
        "external/compiler-rt/lib/sanitizer_common/tests"
    ];
    cflags = [
        "-DASAN_LOW_MEMORY=1"
        "-DASAN_UAR=0"
        ("-DASAN_NEEDS_SEGV=" + ASAN_NEEDS_SEGV)
        ("-DASAN_HAS_EXCEPTIONS=" + ASAN_HAS_EXCEPTIONS)
        "-DASAN_HAS_BLACKLIST=1"
        "-Wall"
        "-Werror"
        "-Wno-covered-switch-default"
        "-Wno-non-virtual-dtor"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-std=c++11"
    ];

    srcs = [
        "tests/asan_globals_test.cc"
        "tests/asan_test.cc"
        # "tests/asan_noinst_test.cc",
        # "tests/asan_test_main.cc",
    ];

    static_libs = ["libasan_noinst_test"];
    sanitize = {
        address = true;
        blacklist = "tests/asan_test.ignore";
    };

    stl = "libc++";
};

#  ANDROIDMK TRANSLATION ERROR: endif from unsupported contitional
#  endif
#  SKIP_LLVM_TESTS

in { inherit asan_test asanwrapper libasan libasan_cxx libasan_noinst_test; }
