{ cc_library }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

libnative_bridge_guest_libc = cc_library {
    defaults = [
        "native_bridge_stub_library_defaults"
        #  Definitions come from bionic/libc/Android.bp that force
        #  the usage of the correct native allocator.
        "libc_native_allocator_defaults"
    ];
    name = "libnative_bridge_guest_libc";
    overrides = ["libc"];
    stem = "libc";

    srcs = [
        ":libc_sources_shared"
        "__cxa_thread_atexit_impl.cpp"
        "__libc_add_main_thread.cpp"
        "exit.c"
        "fork.cpp"
        "malloc_init.cpp"
    ];

    include_dirs = [
        "bionic/libc"
        "bionic/libc/arch-common/bionic"
        "bionic/libc/async_safe/include"
        "bionic/libc/bionic"
        "bionic/libc/stdio"
        "bionic/libstdc++/include"
    ];

    cflags = [
        "-D_LIBC=1"
        "-fno-emulated-tls" #  Required for GWP-Asan.
    ];

    product_variables = {
        platform_sdk_version = {
            asflags = ["-DPLATFORM_SDK_VERSION=%d"];
            cflags = ["-DPLATFORM_SDK_VERSION=%d"];
        };
    };

    arch = {
        arm = {
            srcs = [
                ":libc_sources_shared_arm"
                "stubs_arm.cpp"
            ];

            cflags = [
                "-DCRT_LEGACY_WORKAROUND"
            ];

            version_script = ":libc.arm.map";

            #  Arm 32 bit does not produce complete exidx unwind information
            #  so keep the .debug_frame which is relatively small and does
            #  include needed unwind information.
            #  See b/132992102 for details.
            strip = {
                keep_symbols_and_debug_frame = true;
            };

            whole_static_libs = ["libunwind_llvm"];
        };
        arm64 = {
            srcs = ["stubs_arm64.cpp"];

            version_script = ":libc.arm64.map";

            #  Leave the symbols in the shared library so that stack unwinders can produce
            #  meaningful name resolution.
            strip = {
                keep_symbols = true;
            };

            whole_static_libs = ["libgcc_stripped"];
        };
    };

    nocrt = true;

    required = ["tzdata"];

    whole_static_libs = [
        "gwp_asan"
        "libc_init_dynamic"
        "libc_common_shared"
    ];

    shared_libs = [
        "ld-android"
        "libdl"
    ];

    static_libs = [
        "libdl_android"
    ];

    system_shared_libs = [];
    stl = "none";

    strip = {
        keep_symbols = true;
    };

    sanitize = {
        never = true;
    };

    #  lld complains about duplicate symbols in libcrt and libgcc. Suppress the
    #  warning since this is intended right now.
    #  Bug: 117558759
    ldflags = ["-Wl,-z,muldefs"];
};

in { inherit libnative_bridge_guest_libc; }
