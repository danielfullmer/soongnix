{ cc_library_static }:
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

libbionic_tests_headers_posix = cc_library_static {
    name = "libbionic_tests_headers_posix";
    srcs = [
        "arpa_inet_h.c"
        "assert_h.c"
        "complex_h.c"
        "cpio_h.c"
        "ctype_h.c"
        "dirent_h.c"
        "dlfcn_h.c"
        "errno_h.c"
        "fcntl_h.c"
        "fenv_h.c"
        "float_h.c"
        "fnmatch_h.c"
        "ftw_h.c"
        "glob_h.c"
        "grp_h.c"
        "iconv_h.c"
        "inttypes_h.c"
        "iso646_h.c"
        "langinfo_h.c"
        "libgen_h.c"
        "limits_h.c"
        "locale_h.c"
        "math_h.c"
        "net_if_h.c"
        "netdb_h.c"
        "netinet_in_h.c"
        "netinet_tcp_h.c"
        "nl_types_h.c"
        "poll_h.c"
        "pthread_h.c"
        "pwd_h.c"
        "regex_h.c"
        "sched_h.c"
        "search_h.c"
        "semaphore_h.c"
        "setjmp_h.c"
        "signal_h.c"
        "spawn_h.c"
        "stdarg_h.c"
        "stdbool_h.c"
        "stddef_h.c"
        "stdint_h.c"
        "stdio_h.c"
        "stdlib_h.c"
        "string_h.c"
        "strings_h.c"
        "sys_ipc_h.c"
        "sys_mman_h.c"
        "sys_msg_h.c"
        "sys_resource_h.c"
        "sys_select_h.c"
        "sys_sem_h.c"
        "sys_shm_h.c"
        "sys_socket_h.c"
        "sys_stat_h.c"
        "sys_statvfs_h.c"
        "sys_time_h.c"
        "sys_times_h.c"
        "sys_types_h.c"
        "sys_uio_h.c"
        "sys_un_h.c"
        "sys_utsname_h.c"
        "sys_wait_h.c"
        "syslog_h.c"
        "tar_h.c"
        "termios_h.c"
        "tgmath_h.c"
        "time_h.c"
        "unistd_h.c"
        "utime_h.c"
        "wchar_h.c"
        "wctype_h.c"
    ];
    cflags = [
        "-Wno-absolute-value" #  broken clang diagnostic that doesn't understand <tgmath.h>
        "-Wno-deprecated"
        "-Werror"
        "-D_POSIX_C_SOURCE=200809L"
        "-D_XOPEN_SOURCE=700"
    ];
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit libbionic_tests_headers_posix; }
