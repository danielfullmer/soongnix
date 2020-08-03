{ cc_library_static }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

"libc++abi" = cc_library_static {
    name = "libc++abi";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    srcs = [
        "src/abort_message.cpp"
        "src/cxa_aux_runtime.cpp"
        "src/cxa_default_handlers.cpp"
        "src/cxa_demangle.cpp"
        "src/cxa_exception.cpp"
        "src/cxa_exception_storage.cpp"
        "src/cxa_guard.cpp"
        "src/cxa_handlers.cpp"
        "src/cxa_personality.cpp"
        "src/cxa_thread_atexit.cpp"
        "src/cxa_unexpected.cpp"
        "src/cxa_vector.cpp"
        "src/cxa_virtual.cpp"
        "src/fallback_malloc.cpp"
        "src/private_typeinfo.cpp"
        "src/stdlib_exception.cpp"
        "src/stdlib_new_delete.cpp"
        "src/stdlib_stdexcept.cpp"
        "src/stdlib_typeinfo.cpp"
    ];
    include_dirs = ["external/libcxx/include"];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    cppflags = [
        "-std=c++14"
        "-fexceptions"
        "-Wextra"
        "-Wno-unused-function"
        "-Wno-implicit-fallthrough"
        #  src/cxa_demangle.cpp:2591 -Wimplicit-fallthrough
    ];
    sanitize = {
        never = true;
    };
    stl = "none";
    rtti = true;
    arch = {
        arm = {
            include_dirs = ["external/libunwind_llvm/include"];
            cppflags = ["-DLIBCXXABI_USE_LLVM_UNWINDER=1"];
        };
        arm64 = {
            cppflags = ["-DLIBCXXABI_USE_LLVM_UNWINDER=0"];
        };
        mips = {
            cppflags = ["-DLIBCXXABI_USE_LLVM_UNWINDER=0"];
        };
        mips64 = {
            cppflags = ["-DLIBCXXABI_USE_LLVM_UNWINDER=0"];
        };
        x86 = {
            cppflags = ["-DLIBCXXABI_USE_LLVM_UNWINDER=0"];
        };
        x86_64 = {
            cppflags = ["-DLIBCXXABI_USE_LLVM_UNWINDER=0"];
        };
    };
    target = {
        android = {
            cppflags = ["-DHAVE___CXA_THREAD_ATEXIT_IMPL"];
        };
        darwin = {
            #  libcxxabi really doesn't like the non-LLVM assembler on Darwin
            asflags = ["-integrated-as"];
            cflags = [
                "-integrated-as"
                "-D_LIBCPP_DISABLE_AVAILABILITY"
            ];
            cppflags = ["-integrated-as"];
        };
        linux_bionic = {
            cppflags = ["-DHAVE___CXA_THREAD_ATEXIT_IMPL"];
            enabled = true;
        };
        windows = {
            enabled = true;
            cppflags = [
                "-D_LIBCPP_HAS_THREAD_API_WIN32"
                "-D_LIBCXXABI_BUILDING_LIBRARY"
                "-D_LIBCXXABI_DISABLE_VISIBILITY_ANNOTATIONS"
                "-D_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS"
            ];
            exclude_srcs = [
                "src/cxa_thread_atexit.cpp"

                #  Building stdlib_new_delete.cpp in libcxxabi causes
                #  multiple-definition errors against definitions in
                #  libcxx/src/new.cpp on Windows.  This works on Linux and
                #  Android where the functions have 'weak' linkage and are
                #  discarded by the linker.
                "src/stdlib_new_delete.cpp"
            ];
        };
        windows_x86 = {
            cppflags = [
                "-fsjlj-exceptions"
            ];
        };
    };

};

in { inherit "libc++abi"; }
