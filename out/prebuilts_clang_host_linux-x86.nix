{ clang_builtin_headers, libclang_rt_llndk_library, libclang_rt_prebuilt_library_shared, libclang_rt_prebuilt_library_static, llvm_host_defaults, llvm_host_prebuilt_library_shared, llvm_prebuilt_library_static }:
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

libFuzzer = llvm_prebuilt_library_static {
    name = "libFuzzer";
    sdk_version = "minimum";
    sanitize = {
        never = true;
    };
};

libomp = llvm_prebuilt_library_static {
    name = "libomp";
    sdk_version = "minimum";
    vendor_available = true;
    sanitize = {
        never = true;
    };
};

"libclang_rt.builtins-arm-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.builtins-arm-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        arm = {
            enabled = true;
        };
    };
    stl = "none";
};

"libclang_rt.builtins-aarch64-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.builtins-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        arm64 = {
            enabled = true;
        };
    };
    stl = "none";
};

"libclang_rt.builtins-i686-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.builtins-i686-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        x86 = {
            enabled = true;
        };
    };
    stl = "none";
};

"libclang_rt.builtins-x86_64-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.builtins-x86_64-android";
    sdk_version = "minimum";
    defaults = ["linux_bionic_supported"];
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
    stl = "none";
};

"libclang_rt.asan-arm-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.asan-arm-android";
    sdk_version = "24";
    enabled = false;
    recovery_available = true;
    arch = {
        arm = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
    has_stubs = true;
};

"libclang_rt.asan-aarch64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.asan-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
    has_stubs = true;
};

"libclang_rt.asan-i686-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.asan-i686-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    arch = {
        x86 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
    has_stubs = true;
};

"libclang_rt.asan-x86_64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.asan-x86_64-android";
    sdk_version = "minimum";
    host_supported = true;
    enabled = false;
    recovery_available = true;
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
    has_stubs = true;
};

"libclang_rt.asan-arm-android" = libclang_rt_llndk_library {
    name = "libclang_rt.asan-arm-android";
    enabled = false;
    arch = {
        arm = {
            enabled = true;
        };
    };
};

"libclang_rt.asan-aarch64-android" = libclang_rt_llndk_library {
    name = "libclang_rt.asan-aarch64-android";
    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

"libclang_rt.asan-i686-android" = libclang_rt_llndk_library {
    name = "libclang_rt.asan-i686-android";
    enabled = false;
    arch = {
        x86 = {
            enabled = true;
        };
    };
};

"libclang_rt.asan-x86_64-android" = libclang_rt_llndk_library {
    name = "libclang_rt.asan-x86_64-android";
    enabled = false;
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
};

"libclang_rt.hwasan-aarch64-android" = libclang_rt_llndk_library {
    name = "libclang_rt.hwasan-aarch64-android";
    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

"libclang_rt.ubsan_standalone-arm-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.ubsan_standalone-arm-android";
    sdk_version = "24";
    enabled = false;
    vendor_available = true;
    recovery_available = true;
    double_loadable = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.ubsan_standalone-aarch64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.ubsan_standalone-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    recovery_available = true;
    double_loadable = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm64 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.ubsan_standalone-i686-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.ubsan_standalone-i686-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    recovery_available = true;
    double_loadable = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.ubsan_standalone-x86_64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.ubsan_standalone-x86_64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    recovery_available = true;
    double_loadable = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.ubsan_minimal-arm-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.ubsan_minimal-arm-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm = {
            enabled = true;
        };
    };
};

"libclang_rt.ubsan_minimal-aarch64-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.ubsan_minimal-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

"libclang_rt.ubsan_minimal-i686-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.ubsan_minimal-i686-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86 = {
            enabled = true;
        };
    };
};

"libclang_rt.ubsan_minimal-x86_64-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.ubsan_minimal-x86_64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
};

"libclang_rt.hwasan_static-aarch64-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.hwasan_static-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

"libclang_rt.hwasan-aarch64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.hwasan-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
    has_stubs = true;
};

"libclang_rt.profile-arm-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.profile-arm-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    arch = {
        arm = {
            enabled = true;
        };
    };
};

"libclang_rt.profile-aarch64-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.profile-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

"libclang_rt.profile-i686-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.profile-i686-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    arch = {
        x86 = {
            enabled = true;
        };
    };
};

"libclang_rt.profile-x86_64-android" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.profile-x86_64-android";
    sdk_version = "minimum";
    enabled = false;
    recovery_available = true;
    vendor_available = true;
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
};

"libclang_rt.profile-x86_64" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.profile-x86_64";
    sdk_version = "minimum";
    enabled = false;
    host_supported = true;
    target = {
        linux_glibc_x86_64 = {
            enabled = true;
        };
    };
};

"libclang_rt.profile-i386" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.profile-i386";
    sdk_version = "minimum";
    enabled = false;
    host_supported = true;
    target = {
        linux_glibc_x86 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.scudo-arm-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo-arm-android";
    sdk_version = "24";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.scudo-aarch64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm64 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.scudo-i686-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo-i686-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.scudo-x86_64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo-x86_64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
    check_elf_files = false; #  Bypass circular dependency between libc++
};

"libclang_rt.scudo-arm-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo-arm-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        arm = {
            enabled = true;
        };
    };
};

"libclang_rt.scudo-aarch64-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo-aarch64-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

"libclang_rt.scudo-i686-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo-i686-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        x86 = {
            enabled = true;
        };
    };
};

"libclang_rt.scudo-x86_64-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo-x86_64-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
};

"libclang_rt.scudo_minimal-arm-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo_minimal-arm-android";
    sdk_version = "24";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm = {
            enabled = true;
        };
    };
    shared_libs = [
        "libc"
        "libdl"
        "liblog"
    ];
};

"libclang_rt.scudo_minimal-aarch64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo_minimal-aarch64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm64 = {
            enabled = true;
        };
    };
    shared_libs = [
        "libc"
        "libdl"
        "liblog"
    ];
};

"libclang_rt.scudo_minimal-i686-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo_minimal-i686-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86 = {
            enabled = true;
        };
    };
    shared_libs = [
        "libc"
        "libdl"
        "liblog"
    ];
};

"libclang_rt.scudo_minimal-x86_64-android" = libclang_rt_prebuilt_library_shared {
    name = "libclang_rt.scudo_minimal-x86_64-android";
    sdk_version = "minimum";
    enabled = false;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
    shared_libs = [
        "libc"
        "libdl"
        "liblog"
    ];
};

"libclang_rt.scudo_minimal-arm-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo_minimal-arm-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        arm = {
            enabled = true;
        };
    };
};

"libclang_rt.scudo_minimal-aarch64-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo_minimal-aarch64-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

"libclang_rt.scudo_minimal-i686-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo_minimal-i686-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        x86 = {
            enabled = true;
        };
    };
};

"libclang_rt.scudo_minimal-x86_64-android.static" = libclang_rt_prebuilt_library_static {
    name = "libclang_rt.scudo_minimal-x86_64-android.static";
    enabled = false;
    vendor_available = true;
    sanitize = {
        never = true;
    };
    arch = {
        x86_64 = {
            enabled = true;
        };
    };
};

#  -----------------------------------------------------------------------------
#  Export shared libraries for host tools (libLLVM, libclang, libc++).  These
#  are exported only when the LLVM_BUILD_HOST_TOOLS environment variable is set.
#  -----------------------------------------------------------------------------

#  Export LLVM_BUILD_HOST_TOOLS
llvm-build-host-tools-defaults = llvm_host_defaults {
    name = "llvm-build-host-tools-defaults";
};

#  Export libLLVM shared library
libLLVM_host = llvm_host_prebuilt_library_shared {
    name = "libLLVM_host";
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
    shared_libs = ["libc++_host"];
};

#  Export libclang_cxx shared library
libclang_cxx_host = llvm_host_prebuilt_library_shared {
    name = "libclang_cxx_host";
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
    shared_libs = ["libc++_host"];
};

#  Export libc++.so for the host LLVM tools
"libc++_host" = llvm_host_prebuilt_library_shared {
    name = "libc++_host";
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
    target = {
        darwin = {
            shared_libs = ["libc++abi_host"];
        };
    };
};

#  Export libc++abi.so for the host LLVM tools
"libc++abi_host" = llvm_host_prebuilt_library_shared {
    name = "libc++abi_host";
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
};

clang_builtin_headers_resources = clang_builtin_headers {
    name = "clang_builtin_headers_resources";
    tool_files = ["soong/generate_clang_builtin_headers_resources.sh"];
    out = ["clang_builtin_headers_resources.inc"];
};

subdirs = [
    "soong"
];

in { inherit "libc++_host" "libc++abi_host" "libclang_rt.asan-aarch64-android" "libclang_rt.asan-arm-android" "libclang_rt.asan-i686-android" "libclang_rt.asan-x86_64-android" "libclang_rt.builtins-aarch64-android" "libclang_rt.builtins-arm-android" "libclang_rt.builtins-i686-android" "libclang_rt.builtins-x86_64-android" "libclang_rt.hwasan-aarch64-android" "libclang_rt.hwasan_static-aarch64-android" "libclang_rt.profile-aarch64-android" "libclang_rt.profile-arm-android" "libclang_rt.profile-i386" "libclang_rt.profile-i686-android" "libclang_rt.profile-x86_64" "libclang_rt.profile-x86_64-android" "libclang_rt.scudo-aarch64-android" "libclang_rt.scudo-aarch64-android.static" "libclang_rt.scudo-arm-android" "libclang_rt.scudo-arm-android.static" "libclang_rt.scudo-i686-android" "libclang_rt.scudo-i686-android.static" "libclang_rt.scudo-x86_64-android" "libclang_rt.scudo-x86_64-android.static" "libclang_rt.scudo_minimal-aarch64-android" "libclang_rt.scudo_minimal-aarch64-android.static" "libclang_rt.scudo_minimal-arm-android" "libclang_rt.scudo_minimal-arm-android.static" "libclang_rt.scudo_minimal-i686-android" "libclang_rt.scudo_minimal-i686-android.static" "libclang_rt.scudo_minimal-x86_64-android" "libclang_rt.scudo_minimal-x86_64-android.static" "libclang_rt.ubsan_minimal-aarch64-android" "libclang_rt.ubsan_minimal-arm-android" "libclang_rt.ubsan_minimal-i686-android" "libclang_rt.ubsan_minimal-x86_64-android" "libclang_rt.ubsan_standalone-aarch64-android" "libclang_rt.ubsan_standalone-arm-android" "libclang_rt.ubsan_standalone-i686-android" "libclang_rt.ubsan_standalone-x86_64-android" clang_builtin_headers_resources libFuzzer libLLVM_host libclang_cxx_host libomp llvm-build-host-tools-defaults; }
