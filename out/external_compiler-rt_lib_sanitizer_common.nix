{ cc_library_static }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

# ###############################################################################
#  Host modules

libsan = cc_library_static {
    name = "libsan";
    host_supported = true;
    sdk_version = "19";

    include_dirs = ["external/compiler-rt/lib"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    cppflags = [
        "-fvisibility=hidden"
        "-fno-exceptions"
        "-fno-rtti"
        "-fno-builtin"
        "-std=c++11"
        "-Wno-non-virtual-dtor"
        "-Wno-unused-parameter"
    ];
    srcs = [
        "sanitizer_allocator.cc"
        "sanitizer_common.cc"
        "sanitizer_common_libcdep.cc"
        "sanitizer_common_nolibc.cc"
        "sanitizer_coverage_libcdep.cc"
        "sanitizer_coverage_mapping_libcdep.cc"
        "sanitizer_deadlock_detector1.cc"
        "sanitizer_deadlock_detector2.cc"
        "sanitizer_flag_parser.cc"
        "sanitizer_flags.cc"
        "sanitizer_libc.cc"
        "sanitizer_libignore.cc"
        "sanitizer_linux.cc"
        "sanitizer_linux_libcdep.cc"
        "sanitizer_linux_s390.cc"
        "sanitizer_mac.cc"
        "sanitizer_persistent_allocator.cc"
        "sanitizer_platform_limits_linux.cc"
        "sanitizer_platform_limits_posix.cc"
        "sanitizer_posix.cc"
        "sanitizer_posix_libcdep.cc"
        "sanitizer_printf.cc"
        "sanitizer_procmaps_common.cc"
        "sanitizer_procmaps_freebsd.cc"
        "sanitizer_procmaps_linux.cc"
        "sanitizer_procmaps_mac.cc"
        "sanitizer_stackdepot.cc"
        "sanitizer_stacktrace.cc"
        "sanitizer_stacktrace_libcdep.cc"
        "sanitizer_stacktrace_printer.cc"
        "sanitizer_stoptheworld_linux_libcdep.cc"
        "sanitizer_suppressions.cc"
        "sanitizer_symbolizer.cc"
        "sanitizer_symbolizer_libbacktrace.cc"
        "sanitizer_symbolizer_libcdep.cc"
        "sanitizer_symbolizer_mac.cc"
        "sanitizer_symbolizer_posix_libcdep.cc"
        "sanitizer_symbolizer_win.cc"
        "sanitizer_termination.cc"
        "sanitizer_thread_registry.cc"
        "sanitizer_tls_get_addr.cc"
        "sanitizer_unwind_linux_libcdep.cc"
        "sanitizer_win.cc"
    ];
    exclude_srcs = [
        "sanitizer_common_nolibc.cc"
    ];
    arch = {
        x86_64 = {
            srcs = [
                "sanitizer_linux_x86_64.S"
            ];
        };
    };
    stl = "none";
    sanitize = {
        never = true;
    };
    compile_multilib = "both";
    target = {
        darwin = {
            enabled = false;
        };
    };
};

subdirs = ["tests"];

#  ANDROIDMK TRANSLATION ERROR: unsupported conditional
#  ifndef SANITIZE_HOST
#  ANDROIDMK TRANSLATION ERROR: unsupported include
#  include $(LOCAL_PATH)/tests/Android.mk
#  ANDROIDMK TRANSLATION ERROR: endif from unsupported contitional
#  endif

in { inherit libsan; }
