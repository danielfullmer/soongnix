{ cc_defaults, cc_genrule, cc_library, cc_library_headers, cc_library_shared, cc_library_static, cc_object, filegroup, genrule, python_binary_host }:
let

#  Define the common source files for all the libc instances
#  =========================================================
libc_common_src_files = [
    "async_safe/async_safe_log.cpp"
    "bionic/ether_aton.c"
    "bionic/ether_ntoa.c"
    "bionic/fts.c"
    "bionic/initgroups.c"
    "bionic/isatty.c"
    "bionic/pututline.c"
    "bionic/sched_cpualloc.c"
    "bionic/sched_cpucount.c"
    "stdio/fmemopen.cpp"
    "stdio/parsefloat.c"
    "stdio/refill.c"
    "stdio/stdio.cpp"
    "stdio/stdio_ext.cpp"
    "stdio/vfscanf.cpp"
    "stdio/vfwscanf.c"
    "stdlib/exit.c"
    "bionic/ndk_cruft.cpp"
];

libc_common_src_files_32 = [
    "bionic/legacy_32_bit_support.cpp"
    "bionic/time64.c"
];

libc_common_flags = [
    "-D_LIBC=1"
    "-D__BIONIC_LP32_USE_STAT64"
    "-Wall"
    "-Wextra"
    "-Wunused"
    "-Wno-char-subscripts"
    "-Wno-deprecated-declarations"
    "-Wno-gcc-compat"
    "-Wframe-larger-than=2048"
    "-Wimplicit-fallthrough"

    #  Try to catch typical 32-bit assumptions that break with 64-bit pointers.
    "-Werror=pointer-to-int-cast"
    "-Werror=int-to-pointer-cast"
    "-Werror=type-limits"
    "-Werror"

    #  Clang's exit-time destructor registration hides __dso_handle, but
    #  __dso_handle needs to have default visibility on ARM32. See b/73485611.
    "-Wexit-time-destructors"
];

#  Define some common cflags
#  ========================================================
libc_defaults = cc_defaults {
    name = "libc_defaults";
    defaults = ["linux_bionic_supported"];
    cflags = libc_common_flags;
    asflags = libc_common_flags;
    conlyflags = ["-std=gnu99"];
    cppflags = [];
    include_dirs = [
        "bionic/libc/async_safe/include"
        "external/jemalloc_new/include"
    ];

    stl = "none";
    system_shared_libs = [];
    sanitize = {
        address = false;
        integer_overflow = false;
    };
    native_coverage = false;
    recovery_available = true;

    #  lld complains about duplicate symbols in libcrt and libgcc. Suppress the
    #  warning since this is intended right now.
    ldflags = ["-Wl,-z,muldefs"];
};

#  ========================================================
#  libc_stack_protector.a - stack protector code
#  ========================================================
#
#  Code that implements the stack protector (or that runs
#  before TLS has been set up) needs to be compiled with
#  -fno-stack-protector, since it accesses the stack canary
#  TLS slot.

libc_stack_protector = cc_library_static {

    srcs = [
        "bionic/__libc_init_main_thread.cpp"
        "bionic/__stack_chk_fail.cpp"
    ];
    arch = {
        arm64 = {
            srcs = ["arch-arm64/bionic/__set_tls.c"];
        };
        x86 = {
            srcs = [
                "arch-x86/bionic/__libc_init_sysinfo.cpp"
                "arch-x86/bionic/__set_tls.cpp"
            ];
        };
        x86_64 = {
            srcs = ["arch-x86_64/bionic/__set_tls.c"];
        };
    };

    defaults = ["libc_defaults"];
    cflags = ["-fno-stack-protector"];
    name = "libc_stack_protector";
};

#  libc_init_static.cpp also needs to be built without stack protector,
#  because it's responsible for setting up TLS for static executables.
#  This isn't the case for dynamic executables because the dynamic linker
#  has already set up the main thread's TLS.

libc_init_static = cc_library_static {
    name = "libc_init_static";
    defaults = ["libc_defaults"];
    srcs = ["bionic/libc_init_static.cpp"];
    cflags = ["-fno-stack-protector"];
};

libc_init_dynamic = cc_library_static {
    name = "libc_init_dynamic";
    defaults = ["libc_defaults"];
    srcs = ["bionic/libc_init_dynamic.cpp"];
    cflags = ["-fno-stack-protector"];
};

#  ========================================================
#  libc_tzcode.a - upstream 'tzcode' code
#  ========================================================

libc_tzcode = cc_library_static {

    defaults = ["libc_defaults"];
    srcs = [
        "tzcode/asctime.c"
        "tzcode/difftime.c"
        "tzcode/localtime.c"
        "tzcode/strftime.c"
        "tzcode/strptime.c"
        "tzcode/bionic.cpp"
        "upstream-openbsd/lib/libc/time/wcsftime.c" #  tzcode doesn't include wcsftime, so we use the OpenBSD one.
    ];

    cflags = [
        "-Wno-unused-parameter"
        #  Don't use ridiculous amounts of stack.
        "-DALL_STATE"
        #  Include tzsetwall, timelocal, timegm, time2posix, and posix2time.
        "-DSTD_INSPIRED"
        #  Obviously, we want to be thread-safe.
        "-DTHREAD_SAFE"
        #  The name of the tm_gmtoff field in our struct tm.
        "-DTM_GMTOFF=tm_gmtoff"
        #  Where we store our tzdata.
        "-DTZDIR=\"/system/usr/share/zoneinfo\""
        #  Include `tzname`, `timezone`, and `daylight` globals.
        "-DHAVE_POSIX_DECLS=0"
        "-DUSG_COMPAT=1"
        #  Use the empty string (instead of "   ") as the timezone abbreviation
        #  fallback.
        "-DWILDABBR=\"\""
        "-DNO_RUN_TIME_WARNINGS_ABOUT_YEAR_2000_PROBLEMS_THANK_YOU"
        "-Dlint"
    ];

    local_include_dirs = ["tzcode/"];
    name = "libc_tzcode";
};

#  ========================================================
#  libc_dns.a - modified NetBSD DNS code
#  ========================================================

libc_dns = cc_library_static {

    defaults = ["libc_defaults"];
    srcs = [
        "dns/nameser/ns_name.c"
        "dns/nameser/ns_netint.c"
        "dns/nameser/ns_parse.c"
        "dns/nameser/ns_print.c"
        "dns/nameser/ns_samedomain.c"
        "dns/nameser/ns_ttl.c"
        "dns/net/getaddrinfo.c"
        "dns/net/gethnamaddr.c"
        "dns/net/getnameinfo.c"
        "dns/net/getservent.c"
        "dns/net/nsdispatch.c"
        "dns/net/sethostent.c"
        "dns/resolv/herror.c"
        "dns/resolv/res_cache.c"
        "dns/resolv/res_comp.c"
        "dns/resolv/res_data.c"
        "dns/resolv/res_debug.c"
        "dns/resolv/res_init.c"
        "dns/resolv/res_mkquery.c"
        "dns/resolv/res_query.c"
        "dns/resolv/res_send.c"
        "dns/resolv/res_state.c"
        "dns/resolv/res_stats.c"

        "upstream-netbsd/lib/libc/isc/ev_streams.c"
        "upstream-netbsd/lib/libc/isc/ev_timers.c"
    ];

    cflags = [
        "-DANDROID_CHANGES"
        "-DINET6"
        "-Wno-unused-parameter"
        "-include netbsd-compat.h"
        "-Wframe-larger-than=66000"
    ];

    local_include_dirs = [
        "dns/include"
        "private"
        "upstream-netbsd/lib/libc/include"
        "upstream-netbsd/android/include"
    ];

    name = "libc_dns";
};

#  ========================================================
#  libc_freebsd.a - upstream FreeBSD C library code
#  ========================================================
#
#  These files are built with the freebsd-compat.h header file
#  automatically included.

libc_freebsd = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        "upstream-freebsd/lib/libc/gen/ldexp.c"
        "upstream-freebsd/lib/libc/gen/sleep.c"
        "upstream-freebsd/lib/libc/gen/usleep.c"
        "upstream-freebsd/lib/libc/stdlib/getopt_long.c"
        "upstream-freebsd/lib/libc/stdlib/hcreate.c"
        "upstream-freebsd/lib/libc/stdlib/hcreate_r.c"
        "upstream-freebsd/lib/libc/stdlib/hdestroy_r.c"
        "upstream-freebsd/lib/libc/stdlib/hsearch_r.c"
        "upstream-freebsd/lib/libc/stdlib/qsort.c"
        "upstream-freebsd/lib/libc/stdlib/quick_exit.c"
        "upstream-freebsd/lib/libc/string/wcpcpy.c"
        "upstream-freebsd/lib/libc/string/wcpncpy.c"
        "upstream-freebsd/lib/libc/string/wcscasecmp.c"
        "upstream-freebsd/lib/libc/string/wcscat.c"
        "upstream-freebsd/lib/libc/string/wcschr.c"
        "upstream-freebsd/lib/libc/string/wcscmp.c"
        "upstream-freebsd/lib/libc/string/wcscpy.c"
        "upstream-freebsd/lib/libc/string/wcscspn.c"
        "upstream-freebsd/lib/libc/string/wcsdup.c"
        "upstream-freebsd/lib/libc/string/wcslcat.c"
        "upstream-freebsd/lib/libc/string/wcslen.c"
        "upstream-freebsd/lib/libc/string/wcsncasecmp.c"
        "upstream-freebsd/lib/libc/string/wcsncat.c"
        "upstream-freebsd/lib/libc/string/wcsncmp.c"
        "upstream-freebsd/lib/libc/string/wcsncpy.c"
        "upstream-freebsd/lib/libc/string/wcsnlen.c"
        "upstream-freebsd/lib/libc/string/wcspbrk.c"
        "upstream-freebsd/lib/libc/string/wcsrchr.c"
        "upstream-freebsd/lib/libc/string/wcsspn.c"
        "upstream-freebsd/lib/libc/string/wcsstr.c"
        "upstream-freebsd/lib/libc/string/wcstok.c"
        "upstream-freebsd/lib/libc/string/wmemchr.c"
        "upstream-freebsd/lib/libc/string/wmemcmp.c"
        "upstream-freebsd/lib/libc/string/wmemcpy.c"
        "upstream-freebsd/lib/libc/string/wmemmove.c"
        "upstream-freebsd/lib/libc/string/wmemset.c"
    ];
    arch = {
        arm64 = {
            exclude_srcs = [
                "upstream-freebsd/lib/libc/string/wmemmove.c"
            ];
        };
        x86 = {
            exclude_srcs = [
                "upstream-freebsd/lib/libc/string/wcschr.c"
                "upstream-freebsd/lib/libc/string/wcscmp.c"
                "upstream-freebsd/lib/libc/string/wcslen.c"
                "upstream-freebsd/lib/libc/string/wcsrchr.c"
                "upstream-freebsd/lib/libc/string/wmemcmp.c"
                "upstream-freebsd/lib/libc/string/wcscat.c"
                "upstream-freebsd/lib/libc/string/wcscpy.c"
                "upstream-freebsd/lib/libc/string/wmemcmp.c"
            ];
        };
    };

    cflags = [
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-include freebsd-compat.h"
    ];

    local_include_dirs = [
        "upstream-freebsd/android/include"
    ];

    name = "libc_freebsd";
};

libc_freebsd_large_stack = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        "upstream-freebsd/lib/libc/gen/glob.c"
        "upstream-freebsd/lib/libc/stdlib/realpath.c"
    ];

    cflags = [
        "-Wno-sign-compare"
        "-include freebsd-compat.h"
        "-Wframe-larger-than=66000"
    ];

    local_include_dirs = [
        "upstream-freebsd/android/include"
    ];

    name = "libc_freebsd_large_stack";
};

#  ========================================================
#  libc_netbsd.a - upstream NetBSD C library code
#  ========================================================
#
#  These files are built with the netbsd-compat.h header file
#  automatically included.

libc_netbsd = cc_library_static {

    defaults = ["libc_defaults"];
    srcs = [
        "upstream-netbsd/common/lib/libc/stdlib/random.c"
        "upstream-netbsd/lib/libc/gen/nice.c"
        "upstream-netbsd/lib/libc/gen/psignal.c"
        "upstream-netbsd/lib/libc/gen/utime.c"
        "upstream-netbsd/lib/libc/gen/utmp.c"
        "upstream-netbsd/lib/libc/inet/nsap_addr.c"
        "upstream-netbsd/lib/libc/regex/regcomp.c"
        "upstream-netbsd/lib/libc/regex/regerror.c"
        "upstream-netbsd/lib/libc/regex/regexec.c"
        "upstream-netbsd/lib/libc/regex/regfree.c"
        "upstream-netbsd/lib/libc/stdlib/bsearch.c"
        "upstream-netbsd/lib/libc/stdlib/drand48.c"
        "upstream-netbsd/lib/libc/stdlib/erand48.c"
        "upstream-netbsd/lib/libc/stdlib/jrand48.c"
        "upstream-netbsd/lib/libc/stdlib/lcong48.c"
        "upstream-netbsd/lib/libc/stdlib/lrand48.c"
        "upstream-netbsd/lib/libc/stdlib/mrand48.c"
        "upstream-netbsd/lib/libc/stdlib/nrand48.c"
        "upstream-netbsd/lib/libc/stdlib/_rand48.c"
        "upstream-netbsd/lib/libc/stdlib/rand_r.c"
        "upstream-netbsd/lib/libc/stdlib/reallocarr.c"
        "upstream-netbsd/lib/libc/stdlib/seed48.c"
        "upstream-netbsd/lib/libc/stdlib/srand48.c"
    ];
    multilib = {
        lib32 = {
            #  LP32 cruft
            srcs = ["upstream-netbsd/common/lib/libc/hash/sha1/sha1.c"];
        };
    };
    cflags = [
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-DPOSIX_MISTAKE"
        "-include netbsd-compat.h"
    ];

    local_include_dirs = [
        "upstream-netbsd/android/include"
        "upstream-netbsd/lib/libc/include"
    ];

    name = "libc_netbsd";
};

#  ========================================================
#  libc_openbsd_ndk.a - upstream OpenBSD C library code
#  that can be safely included in the libc_ndk.a (doesn't
#  contain any troublesome global data or constructors).
#  ========================================================
#
#  These files are built with the openbsd-compat.h header file
#  automatically included.

libc_openbsd_ndk = cc_library_static {
    name = "libc_openbsd_ndk";
    defaults = ["libc_defaults"];
    srcs = [
        "upstream-openbsd/lib/libc/gen/alarm.c"
        "upstream-openbsd/lib/libc/gen/ctype_.c"
        "upstream-openbsd/lib/libc/gen/daemon.c"
        "upstream-openbsd/lib/libc/gen/err.c"
        "upstream-openbsd/lib/libc/gen/errx.c"
        "upstream-openbsd/lib/libc/gen/fnmatch.c"
        "upstream-openbsd/lib/libc/gen/ftok.c"
        "upstream-openbsd/lib/libc/gen/getprogname.c"
        "upstream-openbsd/lib/libc/gen/isctype.c"
        "upstream-openbsd/lib/libc/gen/setprogname.c"
        "upstream-openbsd/lib/libc/gen/tolower_.c"
        "upstream-openbsd/lib/libc/gen/toupper_.c"
        "upstream-openbsd/lib/libc/gen/verr.c"
        "upstream-openbsd/lib/libc/gen/verrx.c"
        "upstream-openbsd/lib/libc/gen/vwarn.c"
        "upstream-openbsd/lib/libc/gen/vwarnx.c"
        "upstream-openbsd/lib/libc/gen/warn.c"
        "upstream-openbsd/lib/libc/gen/warnx.c"
        "upstream-openbsd/lib/libc/locale/btowc.c"
        "upstream-openbsd/lib/libc/locale/mbrlen.c"
        "upstream-openbsd/lib/libc/locale/mbstowcs.c"
        "upstream-openbsd/lib/libc/locale/mbtowc.c"
        "upstream-openbsd/lib/libc/locale/wcscoll.c"
        "upstream-openbsd/lib/libc/locale/wcstoimax.c"
        "upstream-openbsd/lib/libc/locale/wcstol.c"
        "upstream-openbsd/lib/libc/locale/wcstoll.c"
        "upstream-openbsd/lib/libc/locale/wcstombs.c"
        "upstream-openbsd/lib/libc/locale/wcstoul.c"
        "upstream-openbsd/lib/libc/locale/wcstoull.c"
        "upstream-openbsd/lib/libc/locale/wcstoumax.c"
        "upstream-openbsd/lib/libc/locale/wcsxfrm.c"
        "upstream-openbsd/lib/libc/locale/wctob.c"
        "upstream-openbsd/lib/libc/locale/wctomb.c"
        "upstream-openbsd/lib/libc/net/base64.c"
        "upstream-openbsd/lib/libc/net/htonl.c"
        "upstream-openbsd/lib/libc/net/htons.c"
        "upstream-openbsd/lib/libc/net/inet_lnaof.c"
        "upstream-openbsd/lib/libc/net/inet_makeaddr.c"
        "upstream-openbsd/lib/libc/net/inet_netof.c"
        "upstream-openbsd/lib/libc/net/inet_ntoa.c"
        "upstream-openbsd/lib/libc/net/inet_ntop.c"
        "upstream-openbsd/lib/libc/net/inet_pton.c"
        "upstream-openbsd/lib/libc/net/ntohl.c"
        "upstream-openbsd/lib/libc/net/ntohs.c"
        "upstream-openbsd/lib/libc/net/res_random.c"
        "upstream-openbsd/lib/libc/stdio/fgetln.c"
        "upstream-openbsd/lib/libc/stdio/fgetwc.c"
        "upstream-openbsd/lib/libc/stdio/fgetws.c"
        "upstream-openbsd/lib/libc/stdio/flags.c"
        "upstream-openbsd/lib/libc/stdio/fpurge.c"
        "upstream-openbsd/lib/libc/stdio/fputwc.c"
        "upstream-openbsd/lib/libc/stdio/fputws.c"
        "upstream-openbsd/lib/libc/stdio/fvwrite.c"
        "upstream-openbsd/lib/libc/stdio/fwide.c"
        "upstream-openbsd/lib/libc/stdio/getdelim.c"
        "upstream-openbsd/lib/libc/stdio/gets.c"
        "upstream-openbsd/lib/libc/stdio/makebuf.c"
        "upstream-openbsd/lib/libc/stdio/mktemp.c"
        "upstream-openbsd/lib/libc/stdio/open_memstream.c"
        "upstream-openbsd/lib/libc/stdio/open_wmemstream.c"
        "upstream-openbsd/lib/libc/stdio/rget.c"
        "upstream-openbsd/lib/libc/stdio/setvbuf.c"
        "upstream-openbsd/lib/libc/stdio/tempnam.c"
        "upstream-openbsd/lib/libc/stdio/tmpnam.c"
        "upstream-openbsd/lib/libc/stdio/ungetc.c"
        "upstream-openbsd/lib/libc/stdio/ungetwc.c"
        "upstream-openbsd/lib/libc/stdio/vasprintf.c"
        "upstream-openbsd/lib/libc/stdio/vdprintf.c"
        "upstream-openbsd/lib/libc/stdio/vsscanf.c"
        "upstream-openbsd/lib/libc/stdio/vswprintf.c"
        "upstream-openbsd/lib/libc/stdio/vswscanf.c"
        "upstream-openbsd/lib/libc/stdio/wbuf.c"
        "upstream-openbsd/lib/libc/stdio/wsetup.c"
        "upstream-openbsd/lib/libc/stdlib/abs.c"
        "upstream-openbsd/lib/libc/stdlib/div.c"
        "upstream-openbsd/lib/libc/stdlib/getenv.c"
        "upstream-openbsd/lib/libc/stdlib/getsubopt.c"
        "upstream-openbsd/lib/libc/stdlib/insque.c"
        "upstream-openbsd/lib/libc/stdlib/imaxabs.c"
        "upstream-openbsd/lib/libc/stdlib/imaxdiv.c"
        "upstream-openbsd/lib/libc/stdlib/labs.c"
        "upstream-openbsd/lib/libc/stdlib/ldiv.c"
        "upstream-openbsd/lib/libc/stdlib/llabs.c"
        "upstream-openbsd/lib/libc/stdlib/lldiv.c"
        "upstream-openbsd/lib/libc/stdlib/lsearch.c"
        "upstream-openbsd/lib/libc/stdlib/remque.c"
        "upstream-openbsd/lib/libc/stdlib/setenv.c"
        "upstream-openbsd/lib/libc/stdlib/tfind.c"
        "upstream-openbsd/lib/libc/stdlib/tsearch.c"
        "upstream-openbsd/lib/libc/string/memccpy.c"
        "upstream-openbsd/lib/libc/string/strcasecmp.c"
        "upstream-openbsd/lib/libc/string/strcasestr.c"
        "upstream-openbsd/lib/libc/string/strcoll.c"
        "upstream-openbsd/lib/libc/string/strcspn.c"
        "upstream-openbsd/lib/libc/string/strdup.c"
        "upstream-openbsd/lib/libc/string/strndup.c"
        "upstream-openbsd/lib/libc/string/strpbrk.c"
        "upstream-openbsd/lib/libc/string/strsep.c"
        "upstream-openbsd/lib/libc/string/strspn.c"
        "upstream-openbsd/lib/libc/string/strstr.c"
        "upstream-openbsd/lib/libc/string/strtok.c"
        "upstream-openbsd/lib/libc/string/strxfrm.c"
        "upstream-openbsd/lib/libc/string/wcslcpy.c"
        "upstream-openbsd/lib/libc/string/wcswidth.c"
    ];

    cflags = [
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-include openbsd-compat.h"
    ];

    local_include_dirs = [
        "private"
        "stdio"
        "upstream-openbsd/android/include"
        "upstream-openbsd/lib/libc/include"
        "upstream-openbsd/lib/libc/gdtoa/"
    ];
};

libc_openbsd_large_stack = cc_library_static {
    name = "libc_openbsd_large_stack";
    defaults = ["libc_defaults"];
    srcs = [
        "stdio/vfprintf.cpp"
        "stdio/vfwprintf.cpp"
    ];
    cflags = [
        "-include openbsd-compat.h"
        "-Wno-sign-compare"
        "-Wframe-larger-than=5000"
    ];

    local_include_dirs = [
        "upstream-openbsd/android/include/"
        "upstream-openbsd/lib/libc/include/"
        "upstream-openbsd/lib/libc/gdtoa/"
        "upstream-openbsd/lib/libc/stdio/"
    ];
};

#  ========================================================
#  libc_openbsd.a - upstream OpenBSD C library code
#  ========================================================
#
#  These files are built with the openbsd-compat.h header file
#  automatically included.
libc_openbsd = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        #  These two depend on getentropy, which isn't in libc_ndk.a.
        "upstream-openbsd/lib/libc/crypt/arc4random.c"
        "upstream-openbsd/lib/libc/crypt/arc4random_uniform.c"

        #  May be overriden by per-arch optimized versions
        "upstream-openbsd/lib/libc/string/memchr.c"
        "upstream-openbsd/lib/libc/string/memrchr.c"
        "upstream-openbsd/lib/libc/string/stpcpy.c"
        "upstream-openbsd/lib/libc/string/stpncpy.c"
        "upstream-openbsd/lib/libc/string/strcat.c"
        "upstream-openbsd/lib/libc/string/strcpy.c"
        "upstream-openbsd/lib/libc/string/strlcat.c"
        "upstream-openbsd/lib/libc/string/strlcpy.c"
        "upstream-openbsd/lib/libc/string/strncat.c"
        "upstream-openbsd/lib/libc/string/strncmp.c"
        "upstream-openbsd/lib/libc/string/strncpy.c"
    ];

    arch = {
        arm = {
            exclude_srcs = [
                "upstream-openbsd/lib/libc/string/strcpy.c"
                "upstream-openbsd/lib/libc/string/stpcpy.c"
                "upstream-openbsd/lib/libc/string/strcat.c"
            ];
        };
        arm64 = {
            exclude_srcs = [
                "upstream-openbsd/lib/libc/string/memchr.c"
                "upstream-openbsd/lib/libc/string/stpcpy.c"
                "upstream-openbsd/lib/libc/string/strcpy.c"
                "upstream-openbsd/lib/libc/string/strncmp.c"
            ];
        };
        mips = {
            exclude_srcs = [
                "upstream-openbsd/lib/libc/string/memchr.c"
                "upstream-openbsd/lib/libc/string/strcpy.c"
                "upstream-openbsd/lib/libc/string/strncmp.c"
            ];
        };
        mips64 = {
            exclude_srcs = [
                "upstream-openbsd/lib/libc/string/memchr.c"
                "upstream-openbsd/lib/libc/string/strcpy.c"
                "upstream-openbsd/lib/libc/string/strncmp.c"
            ];
        };
        x86 = {
            exclude_srcs = [
                "upstream-openbsd/lib/libc/string/memchr.c"
                "upstream-openbsd/lib/libc/string/memrchr.c"
                "upstream-openbsd/lib/libc/string/stpcpy.c"
                "upstream-openbsd/lib/libc/string/stpncpy.c"
                "upstream-openbsd/lib/libc/string/strcat.c"
                "upstream-openbsd/lib/libc/string/strcpy.c"
                "upstream-openbsd/lib/libc/string/strncmp.c"
                "upstream-openbsd/lib/libc/string/strncpy.c"
                "upstream-openbsd/lib/libc/string/strlcat.c"
                "upstream-openbsd/lib/libc/string/strlcpy.c"
                "upstream-openbsd/lib/libc/string/strncat.c"
            ];
        };

        x86_64 = {
            exclude_srcs = [
                "upstream-openbsd/lib/libc/string/stpcpy.c"
                "upstream-openbsd/lib/libc/string/stpncpy.c"
                "upstream-openbsd/lib/libc/string/strcat.c"
                "upstream-openbsd/lib/libc/string/strcpy.c"
                "upstream-openbsd/lib/libc/string/strncat.c"
                "upstream-openbsd/lib/libc/string/strncmp.c"
                "upstream-openbsd/lib/libc/string/strncpy.c"
            ];
        };
    };

    cflags = [
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-include openbsd-compat.h"
    ];

    local_include_dirs = [
        "private"
        "upstream-openbsd/android/include"
    ];

    name = "libc_openbsd";
};

#  ========================================================
#  libc_gdtoa.a - upstream OpenBSD C library gdtoa code
#  ========================================================
#
#  These files are built with the openbsd-compat.h header file
#  automatically included.

libc_gdtoa = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        "upstream-openbsd/android/gdtoa_support.cpp"
        "upstream-openbsd/lib/libc/gdtoa/dmisc.c"
        "upstream-openbsd/lib/libc/gdtoa/dtoa.c"
        "upstream-openbsd/lib/libc/gdtoa/gdtoa.c"
        "upstream-openbsd/lib/libc/gdtoa/gethex.c"
        "upstream-openbsd/lib/libc/gdtoa/gmisc.c"
        "upstream-openbsd/lib/libc/gdtoa/hd_init.c"
        "upstream-openbsd/lib/libc/gdtoa/hdtoa.c"
        "upstream-openbsd/lib/libc/gdtoa/hexnan.c"
        "upstream-openbsd/lib/libc/gdtoa/ldtoa.c"
        "upstream-openbsd/lib/libc/gdtoa/misc.c"
        "upstream-openbsd/lib/libc/gdtoa/smisc.c"
        "upstream-openbsd/lib/libc/gdtoa/strtod.c"
        "upstream-openbsd/lib/libc/gdtoa/strtodg.c"
        "upstream-openbsd/lib/libc/gdtoa/strtof.c"
        "upstream-openbsd/lib/libc/gdtoa/strtord.c"
        "upstream-openbsd/lib/libc/gdtoa/sum.c"
        "upstream-openbsd/lib/libc/gdtoa/ulp.c"
    ];
    multilib = {
        lib64 = {
            srcs = ["upstream-openbsd/lib/libc/gdtoa/strtorQ.c"];
        };
    };

    cflags = [
        "-Wno-sign-compare"
        "-include openbsd-compat.h"
    ];

    local_include_dirs = [
        "private"
        "upstream-openbsd/android/include"
        "upstream-openbsd/lib/libc/include"
    ];

    name = "libc_gdtoa";
};

#  ========================================================
#  libc_fortify.a - container for our FORITFY
#  implementation details
#  ========================================================
libc_fortify = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = ["bionic/fortify.cpp"];

    name = "libc_fortify";

    #  Disable FORTIFY for the compilation of these, so we don't end up having
    #  FORTIFY silently call itself.
    cflags = [
        "-U_FORTIFY_SOURCE"
        "-D__BIONIC_DECLARE_FORTIFY_HELPERS"
    ];

    arch = {
        arm = {
            cflags = [
                "-DNO___MEMCPY_CHK"
                "-DRENAME___STRCAT_CHK"
                "-DRENAME___STRCPY_CHK"
            ];
            srcs = [
                "arch-arm/generic/bionic/__memcpy_chk.S"

                "arch-arm/cortex-a15/bionic/__strcat_chk.S"
                "arch-arm/cortex-a15/bionic/__strcpy_chk.S"

                "arch-arm/cortex-a7/bionic/__strcat_chk.S"
                "arch-arm/cortex-a7/bionic/__strcpy_chk.S"

                "arch-arm/cortex-a9/bionic/__strcat_chk.S"
                "arch-arm/cortex-a9/bionic/__strcpy_chk.S"

                "arch-arm/krait/bionic/__strcat_chk.S"
                "arch-arm/krait/bionic/__strcpy_chk.S"

                "arch-arm/cortex-a53/bionic/__strcat_chk.S"
                "arch-arm/cortex-a53/bionic/__strcpy_chk.S"

                "arch-arm/cortex-a55/bionic/__strcat_chk.S"
                "arch-arm/cortex-a55/bionic/__strcpy_chk.S"
            ];
        };
        arm64 = {
            cflags = ["-DNO___MEMCPY_CHK"];
            srcs = [
                "arch-arm64/generic/bionic/__memcpy_chk.S"
            ];
        };
    };
};

#  ========================================================
#  libc_bionic.a - home-grown C library code
#  ========================================================

libc_bionic = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        #  The data that backs getauxval is initialized in the libc init
        #  functions which are invoked by the linker. If this file is included
        #  in libc_ndk.a, only one of the copies of the global data will be
        #  initialized, resulting in nullptr dereferences.
        "bionic/getauxval.cpp"

        #  These require getauxval, which isn't available on older platforms.
        "bionic/sysconf.cpp"
        "bionic/vdso.cpp"
        "bionic/setjmp_cookie.cpp"

        #  The following must not be statically linked into libc_ndk.a, because
        #  debuggerd will look for the abort message in libc.so's copy.
        "bionic/android_set_abort_message.cpp"

        "bionic/strchr.cpp"
        "bionic/strnlen.c"
        "bionic/strrchr.cpp"
    ];

    arch = {
        arm = {
            srcs = [
                "arch-arm/generic/bionic/memcmp.S"
                "arch-arm/generic/bionic/memmove.S"
                "arch-arm/generic/bionic/memset.S"
                "arch-arm/generic/bionic/stpcpy.c"
                "arch-arm/generic/bionic/strcat.c"
                "arch-arm/generic/bionic/strcmp.S"
                "arch-arm/generic/bionic/strcpy.S"
                "arch-arm/generic/bionic/strlen.c"

                "arch-arm/bionic/__aeabi_read_tp.S"
                "arch-arm/bionic/__bionic_clone.S"
                "arch-arm/bionic/__restore.S"
                "arch-arm/bionic/_exit_with_stack_teardown.S"
                "arch-arm/bionic/atomics_arm.c"
                "arch-arm/bionic/bpabi.c"
                "arch-arm/bionic/libcrt_compat.c"
                "arch-arm/bionic/popcount_tab.c"
                "arch-arm/bionic/setjmp.S"
                "arch-arm/bionic/syscall.S"
                "arch-arm/bionic/vfork.S"

                "arch-arm/cortex-a15/bionic/memcpy.S"
                "arch-arm/cortex-a15/bionic/memmove.S"
                "arch-arm/cortex-a15/bionic/memset.S"
                "arch-arm/cortex-a15/bionic/stpcpy.S"
                "arch-arm/cortex-a15/bionic/strcat.S"
                "arch-arm/cortex-a15/bionic/strcmp.S"
                "arch-arm/cortex-a15/bionic/strcpy.S"
                "arch-arm/cortex-a15/bionic/strlen.S"

                "arch-arm/cortex-a7/bionic/memcpy.S"
                "arch-arm/cortex-a7/bionic/memset.S"

                "arch-arm/cortex-a9/bionic/memcpy.S"
                "arch-arm/cortex-a9/bionic/memset.S"
                "arch-arm/cortex-a9/bionic/stpcpy.S"
                "arch-arm/cortex-a9/bionic/strcat.S"
                "arch-arm/cortex-a9/bionic/strcmp.S"
                "arch-arm/cortex-a9/bionic/strcpy.S"
                "arch-arm/cortex-a9/bionic/strlen.S"

                "arch-arm/krait/bionic/memcpy.S"
                "arch-arm/krait/bionic/memset.S"
                "arch-arm/krait/bionic/strcmp.S"

                "arch-arm/cortex-a53/bionic/memcpy.S"

                "arch-arm/cortex-a55/bionic/memcpy.S"

                "arch-arm/kryo/bionic/memcpy.S"
            ];
        };
        arm64 = {
            srcs = [
                "arch-arm64/generic/bionic/memchr.S"
                "arch-arm64/generic/bionic/memcmp.S"
                "arch-arm64/generic/bionic/memcpy.S"
                "arch-arm64/generic/bionic/memmove.S"
                "arch-arm64/generic/bionic/memset.S"
                "arch-arm64/generic/bionic/stpcpy.S"
                "arch-arm64/generic/bionic/strchr.S"
                "arch-arm64/generic/bionic/strcmp.S"
                "arch-arm64/generic/bionic/strcpy.S"
                "arch-arm64/generic/bionic/strlen.S"
                "arch-arm64/generic/bionic/strncmp.S"
                "arch-arm64/generic/bionic/strnlen.S"
                "arch-arm64/generic/bionic/wmemmove.S"

                "arch-arm64/bionic/__bionic_clone.S"
                "arch-arm64/bionic/_exit_with_stack_teardown.S"
                "arch-arm64/bionic/setjmp.S"
                "arch-arm64/bionic/syscall.S"
                "arch-arm64/bionic/vfork.S"
            ];
            exclude_srcs = [
                "bionic/__memcpy_chk.cpp"
                "bionic/strchr.cpp"
                "bionic/strnlen.c"
            ];
        };

        mips = {
            srcs = [
                "arch-mips/string/memcmp.c"
                "arch-mips/string/memcpy.c"
                "arch-mips/string/memset.S"
                "arch-mips/string/strcmp.S"
                "arch-mips/string/strncmp.S"
                "arch-mips/string/strlen.c"
                "arch-mips/string/strnlen.c"
                "arch-mips/string/strchr.c"
                "arch-mips/string/strcpy.c"
                "arch-mips/string/memchr.c"
                "arch-mips/string/memmove.c"

                "arch-mips/bionic/__bionic_clone.S"
                "arch-mips/bionic/cacheflush.cpp"
                "arch-mips/bionic/_exit_with_stack_teardown.S"
                "arch-mips/bionic/libcrt_compat.c"
                "arch-mips/bionic/setjmp.S"
                "arch-mips/bionic/syscall.S"
                "arch-mips/bionic/vfork.S"
            ];
            exclude_srcs = [
                "bionic/strchr.cpp"
                "bionic/strnlen.c"
            ];
        };
        mips64 = {
            srcs = [
                "arch-mips/string/memcmp.c"
                "arch-mips/string/memcpy.c"
                "arch-mips/string/memset.S"
                "arch-mips/string/strcmp.S"
                "arch-mips/string/strncmp.S"
                "arch-mips/string/strlen.c"
                "arch-mips/string/strnlen.c"
                "arch-mips/string/strchr.c"
                "arch-mips/string/strcpy.c"
                "arch-mips/string/memchr.c"
                "arch-mips/string/memmove.c"

                "arch-mips64/bionic/__bionic_clone.S"
                "arch-mips64/bionic/_exit_with_stack_teardown.S"
                "arch-mips64/bionic/setjmp.S"
                "arch-mips64/bionic/syscall.S"
                "arch-mips64/bionic/vfork.S"
                "arch-mips64/bionic/stat.cpp"
            ];
            exclude_srcs = [
                "bionic/strchr.cpp"
                "bionic/strnlen.c"
            ];
        };

        x86 = {
            srcs = [
                "arch-x86/generic/string/memcmp.S"
                "arch-x86/generic/string/strcmp.S"
                "arch-x86/generic/string/strncmp.S"
                "arch-x86/generic/string/strcat.S"

                "arch-x86/generic/string/strlcat.c"
                "arch-x86/generic/string/strlcpy.c"
                "arch-x86/generic/string/strncat.c"
                "arch-x86/generic/string/wcscat.c"
                "arch-x86/generic/string/wcscpy.c"
                "arch-x86/generic/string/wmemcmp.c"

                "arch-x86/atom/string/sse2-memchr-atom.S"
                "arch-x86/atom/string/sse2-memrchr-atom.S"
                "arch-x86/atom/string/sse2-strchr-atom.S"
                "arch-x86/atom/string/sse2-strnlen-atom.S"
                "arch-x86/atom/string/sse2-strrchr-atom.S"
                "arch-x86/atom/string/sse2-wcschr-atom.S"
                "arch-x86/atom/string/sse2-wcsrchr-atom.S"
                "arch-x86/atom/string/sse2-wcslen-atom.S"
                "arch-x86/atom/string/sse2-wcscmp-atom.S"
                "arch-x86/silvermont/string/sse2-memmove-slm.S"
                "arch-x86/silvermont/string/sse2-memset-slm.S"
                "arch-x86/silvermont/string/sse2-stpcpy-slm.S"
                "arch-x86/silvermont/string/sse2-stpncpy-slm.S"
                "arch-x86/silvermont/string/sse2-strcpy-slm.S"
                "arch-x86/silvermont/string/sse2-strlen-slm.S"
                "arch-x86/silvermont/string/sse2-strncpy-slm.S"

                "arch-x86/bionic/__bionic_clone.S"
                "arch-x86/bionic/_exit_with_stack_teardown.S"
                "arch-x86/bionic/libcrt_compat.c"
                "arch-x86/bionic/__restore.S"
                "arch-x86/bionic/setjmp.S"
                "arch-x86/bionic/syscall.S"
                "arch-x86/bionic/vfork.S"

                #  ssse3 functions
                "arch-x86/atom/string/ssse3-strcat-atom.S"
                "arch-x86/atom/string/ssse3-strcmp-atom.S"
                "arch-x86/atom/string/ssse3-strlcat-atom.S"
                "arch-x86/atom/string/ssse3-strlcpy-atom.S"
                "arch-x86/atom/string/ssse3-strncat-atom.S"
                "arch-x86/atom/string/ssse3-strncmp-atom.S"
                "arch-x86/atom/string/ssse3-wcscat-atom.S"
                "arch-x86/atom/string/ssse3-wcscpy-atom.S"

                #  sse4 functions
                "arch-x86/silvermont/string/sse4-memcmp-slm.S"
                "arch-x86/silvermont/string/sse4-wmemcmp-slm.S"

                #  atom functions
                "arch-x86/atom/string/sse2-memset-atom.S"
                "arch-x86/atom/string/sse2-strlen-atom.S"
                "arch-x86/atom/string/ssse3-memcmp-atom.S"
                "arch-x86/atom/string/ssse3-memmove-atom.S"
                "arch-x86/atom/string/ssse3-strcpy-atom.S"
                "arch-x86/atom/string/ssse3-strncpy-atom.S"
                "arch-x86/atom/string/ssse3-wmemcmp-atom.S"
            ];

            exclude_srcs = [
                "bionic/strchr.cpp"
                "bionic/strnlen.c"
                "bionic/strrchr.cpp"
            ];
        };
        x86_64 = {
            srcs = [
                "arch-x86_64/string/sse2-memmove-slm.S"
                "arch-x86_64/string/sse2-memset-slm.S"
                "arch-x86_64/string/sse2-stpcpy-slm.S"
                "arch-x86_64/string/sse2-stpncpy-slm.S"
                "arch-x86_64/string/sse2-strcat-slm.S"
                "arch-x86_64/string/sse2-strcpy-slm.S"
                "arch-x86_64/string/sse2-strlen-slm.S"
                "arch-x86_64/string/sse2-strncat-slm.S"
                "arch-x86_64/string/sse2-strncpy-slm.S"
                "arch-x86_64/string/sse4-memcmp-slm.S"
                "arch-x86_64/string/ssse3-strcmp-slm.S"
                "arch-x86_64/string/ssse3-strncmp-slm.S"

                "arch-x86_64/bionic/__bionic_clone.S"
                "arch-x86_64/bionic/_exit_with_stack_teardown.S"
                "arch-x86_64/bionic/__restore_rt.S"
                "arch-x86_64/bionic/setjmp.S"
                "arch-x86_64/bionic/syscall.S"
                "arch-x86_64/bionic/vfork.S"
            ];
        };
    };

    cppflags = ["-Wold-style-cast"];
    include_dirs = ["bionic/libstdc++/include"];
    name = "libc_bionic";
};

generated_android_ids = genrule {
    name = "generated_android_ids";
    out = ["generated_android_ids.h"];
    srcs = [":android_filesystem_config_header"];
    tool_files = ["fs_config_generator.py"];
    cmd = "$(location fs_config_generator.py) aidarray $(in) > $(out)";
};

#  ========================================================
#  libc_bionic_ndk.a- The portions of libc_bionic that can
#  be safely used in libc_ndk.a (no troublesome global data
#  or constructors).
#  ========================================================
libc_bionic_ndk = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        "bionic/NetdClientDispatch.cpp"
        "bionic/__bionic_get_shell_path.cpp"
        "bionic/__cmsg_nxthdr.cpp"
        "bionic/__errno.cpp"
        "bionic/__gnu_basename.cpp"
        "bionic/__libc_current_sigrtmax.cpp"
        "bionic/__libc_current_sigrtmin.cpp"
        "bionic/abort.cpp"
        "bionic/accept.cpp"
        "bionic/accept4.cpp"
        "bionic/access.cpp"
        "bionic/arpa_inet.cpp"
        "bionic/assert.cpp"
        "bionic/atof.cpp"
        "bionic/bionic_allocator.cpp"
        "bionic/bionic_arc4random.cpp"
        "bionic/bionic_futex.cpp"
        "bionic/bionic_netlink.cpp"
        "bionic/bionic_systrace.cpp"
        "bionic/bionic_time_conversions.cpp"
        "bionic/brk.cpp"
        "bionic/c16rtomb.cpp"
        "bionic/c32rtomb.cpp"
        "bionic/chmod.cpp"
        "bionic/chown.cpp"
        "bionic/clearenv.cpp"
        "bionic/clock.cpp"
        "bionic/clock_getcpuclockid.cpp"
        "bionic/clock_nanosleep.cpp"
        "bionic/clone.cpp"
        "bionic/connect.cpp"
        "bionic/ctype.cpp"
        "bionic/dirent.cpp"
        "bionic/dup2.cpp"
        "bionic/environ.cpp"
        "bionic/error.cpp"
        "bionic/eventfd_read.cpp"
        "bionic/eventfd_write.cpp"
        "bionic/exec.cpp"
        "bionic/faccessat.cpp"
        "bionic/fchmod.cpp"
        "bionic/fchmodat.cpp"
        "bionic/fdsan.cpp"
        "bionic/ffs.cpp"
        "bionic/fgetxattr.cpp"
        "bionic/flistxattr.cpp"
        "bionic/flockfile.cpp"
        "bionic/fpclassify.cpp"
        "bionic/fsetxattr.cpp"
        "bionic/ftruncate.cpp"
        "bionic/ftw.cpp"
        "bionic/futimens.cpp"
        "bionic/getcwd.cpp"
        "bionic/getdomainname.cpp"
        "bionic/getentropy.cpp"
        "bionic/gethostname.cpp"
        "bionic/getloadavg.cpp"
        "bionic/getpagesize.cpp"
        "bionic/getpgrp.cpp"
        "bionic/getpid.cpp"
        "bionic/getpriority.cpp"
        "bionic/gettid.cpp"
        "bionic/get_device_api_level.cpp"
        "bionic/grp_pwd.cpp"
        "bionic/grp_pwd_file.cpp"
        "bionic/iconv.cpp"
        "bionic/icu_wrappers.cpp"
        "bionic/ifaddrs.cpp"
        "bionic/inotify_init.cpp"
        "bionic/ioctl.cpp"
        "bionic/killpg.cpp"
        "bionic/langinfo.cpp"
        "bionic/lchown.cpp"
        "bionic/lfs64_support.cpp"
        "bionic/libc_init_common.cpp"
        "bionic/libgen.cpp"
        "bionic/link.cpp"
        "bionic/locale.cpp"
        "bionic/lockf.cpp"
        "bionic/lstat.cpp"
        "bionic/mblen.cpp"
        "bionic/mbrtoc16.cpp"
        "bionic/mbrtoc32.cpp"
        "bionic/memmem.cpp"
        "bionic/mempcpy.cpp"
        "bionic/mkdir.cpp"
        "bionic/mkfifo.cpp"
        "bionic/mknod.cpp"
        "bionic/mntent.cpp"
        "bionic/mremap.cpp"
        "bionic/net_if.cpp"
        "bionic/netdb.cpp"
        "bionic/netinet_in.cpp"
        "bionic/nl_types.cpp"
        "bionic/open.cpp"
        "bionic/pathconf.cpp"
        "bionic/pause.cpp"
        "bionic/pipe.cpp"
        "bionic/poll.cpp"
        "bionic/posix_fadvise.cpp"
        "bionic/posix_fallocate.cpp"
        "bionic/posix_madvise.cpp"
        "bionic/posix_timers.cpp"
        "bionic/ptrace.cpp"
        "bionic/pty.cpp"
        "bionic/raise.cpp"
        "bionic/rand.cpp"
        "bionic/readlink.cpp"
        "bionic/reboot.cpp"
        "bionic/recv.cpp"
        "bionic/rename.cpp"
        "bionic/rmdir.cpp"
        "bionic/scandir.cpp"
        "bionic/sched_getaffinity.cpp"
        "bionic/sched_getcpu.cpp"
        "bionic/semaphore.cpp"
        "bionic/send.cpp"
        "bionic/setegid.cpp"
        "bionic/seteuid.cpp"
        "bionic/setpgrp.cpp"
        "bionic/sigaction.cpp"
        "bionic/signal.cpp"
        "bionic/sigprocmask.cpp"
        "bionic/socket.cpp"
        "bionic/spawn.cpp"
        "bionic/stat.cpp"
        "bionic/statvfs.cpp"
        "bionic/stdlib_l.cpp"
        "bionic/strchrnul.cpp"
        "bionic/strerror.cpp"
        "bionic/string_l.cpp"
        "bionic/strings_l.cpp"
        "bionic/strsignal.cpp"
        "bionic/strtol.cpp"
        "bionic/strtold.cpp"
        "bionic/swab.cpp"
        "bionic/symlink.cpp"
        "bionic/sync_file_range.cpp"
        "bionic/sys_epoll.cpp"
        "bionic/sys_msg.cpp"
        "bionic/sys_sem.cpp"
        "bionic/sys_shm.cpp"
        "bionic/sys_signalfd.cpp"
        "bionic/sys_time.cpp"
        "bionic/sysinfo.cpp"
        "bionic/syslog.cpp"
        "bionic/system.cpp"
        "bionic/system_property_api.cpp"
        "bionic/system_property_set.cpp"
        "bionic/tdestroy.cpp"
        "bionic/termios.cpp"
        "bionic/thread_private.cpp"
        "bionic/timespec_get.cpp"
        "bionic/tmpfile.cpp"
        "bionic/umount.cpp"
        "bionic/unlink.cpp"
        "bionic/wait.cpp"
        "bionic/wchar.cpp"
        "bionic/wchar_l.cpp"
        "bionic/wcstod.cpp"
        "bionic/wctype.cpp"
        "bionic/wcwidth.cpp"
        "bionic/wmempcpy.cpp"

        #  This contains a weak stub implementation of __find_icu_symbol for wctype.cpp,
        #  which will be overridden by the actual one in libc.so.
        "bionic/icu_static.cpp"
    ];

    multilib = {
        lib32 = {
            #  LP32 cruft
            srcs = ["bionic/mmap.cpp"];
        };
    };
    product_variables = {
        treble_linker_namespaces = {
            cflags = ["-DTREBLE_LINKER_NAMESPACES"];
        };
    };
    whole_static_libs = ["libsystemproperties"];
    cppflags = ["-Wold-style-cast"];
    local_include_dirs = ["stdio"];
    include_dirs = ["bionic/libstdc++/include"];
    name = "libc_bionic_ndk";
    generated_headers = ["generated_android_ids"];
};

#  ========================================================
#  libc_pthread.a - pthreads parts that previously lived in
#  libc_bionic.a. Relocated to their own library because
#  they can't be included in libc_ndk.a (as they layout of
#  pthread_t has changed over the years and has ABI
#  compatibility issues).
#  ========================================================

libc_pthread = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        "bionic/bionic_elf_tls.cpp"
        "bionic/pthread_atfork.cpp"
        "bionic/pthread_attr.cpp"
        "bionic/pthread_barrier.cpp"
        "bionic/pthread_cond.cpp"
        "bionic/pthread_create.cpp"
        "bionic/pthread_detach.cpp"
        "bionic/pthread_equal.cpp"
        "bionic/pthread_exit.cpp"
        "bionic/pthread_getcpuclockid.cpp"
        "bionic/pthread_getschedparam.cpp"
        "bionic/pthread_gettid_np.cpp"
        "bionic/pthread_internal.cpp"
        "bionic/pthread_join.cpp"
        "bionic/pthread_key.cpp"
        "bionic/pthread_kill.cpp"
        "bionic/pthread_mutex.cpp"
        "bionic/pthread_once.cpp"
        "bionic/pthread_rwlock.cpp"
        "bionic/pthread_sigqueue.cpp"
        "bionic/pthread_self.cpp"
        "bionic/pthread_setname_np.cpp"
        "bionic/pthread_setschedparam.cpp"
        "bionic/pthread_spinlock.cpp"

        #  The following implementations depend on pthread data or implementation,
        #  so we can't include them in libc_ndk.a.
        "bionic/__cxa_thread_atexit_impl.cpp"
        "stdlib/atexit.c"
        "bionic/fork.cpp"
    ];

    cppflags = ["-Wold-style-cast"];
    include_dirs = ["bionic/libstdc++/include"];
    name = "libc_pthread";
};

#  ========================================================
#  libc_syscalls.a
#  ========================================================

libc_syscalls = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = ["bionic/__set_errno.cpp"];
    arch = {
        arm = {
            srcs = ["arch-arm/syscalls/**/*.S"];
        };
        arm64 = {
            srcs = ["arch-arm64/syscalls/**/*.S"];
        };
        mips = {
            srcs = ["arch-mips/syscalls/**/*.S"];
        };
        mips64 = {
            srcs = ["arch-mips64/syscalls/**/*.S"];
        };
        x86 = {
            srcs = ["arch-x86/syscalls/**/*.S"];
        };
        x86_64 = {
            srcs = ["arch-x86_64/syscalls/**/*.S"];
        };
    };
    name = "libc_syscalls";
};

#  ========================================================
#  libc_aeabi.a
#  This is an LP32 ARM-only library that needs to be built with -fno-builtin
#  to avoid infinite recursion. For the other architectures we just build an
#  empty library to keep this makefile simple.
#  ========================================================

libc_aeabi = cc_library_static {
    defaults = ["libc_defaults"];
    arch = {
        arm = {
            srcs = ["arch-arm/bionic/__aeabi.c"];
        };
    };
    name = "libc_aeabi";
    cflags = ["-fno-builtin"];
};

#  ========================================================
#  libc_ndk.a
#  Compatibility library for the NDK. This library contains
#  all the parts of libc that are safe to statically link.
#  We can't safely statically link things that can only run
#  on a certain version of the OS. Examples include
#  anything that talks to netd (a large portion of the DNS
#  code) and anything that is dependent on the layout of a
#  data structure that has changed across releases (such as
#  pthread_t).
#  ========================================================

libc_ndk = cc_library_static {
    name = "libc_ndk";
    defaults = ["libc_defaults"];
    srcs = libc_common_src_files ++ [
        "bionic/malloc_common.cpp"
        "bionic/malloc_limit.cpp"
    ];
    multilib = {
        lib32 = {
            srcs = libc_common_src_files_32;
        };
    };
    arch = {
        arm = {
            srcs = [
                "arch-arm/bionic/exidx_dynamic.c"
                "arch-common/bionic/crtbegin_so.c"
                "arch-arm/bionic/atexit_legacy.c"
                "arch-common/bionic/crtend_so.S"
            ];
            whole_static_libs = ["libc_aeabi"];
        };
    };

    cflags = [
        "-fvisibility=hidden"
        "-DLIBC_STATIC"
    ];

    whole_static_libs = [
        "libc_bionic_ndk"
        "libc_fortify"
        "libc_freebsd"
        "libc_freebsd_large_stack"
        "libc_gdtoa"
        "libc_malloc"
        "libc_netbsd"
        "libc_openbsd_large_stack"
        "libc_openbsd_ndk"
        "libc_stack_protector"
        "libc_syscalls"
        "libc_tzcode"
        "libm"
        "libjemalloc5"
        "libstdc++"
    ];
};

#  ========================================================
#  libc_nopthread.a
#  ========================================================
libc_nopthread = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = libc_common_src_files;
    multilib = {
        lib32 = {
            srcs = libc_common_src_files_32;
        };
    };
    name = "libc_nopthread";

    whole_static_libs = [
        "libc_bionic"
        "libc_bionic_ndk"
        "libc_dns"
        "libc_fortify"
        "libc_freebsd"
        "libc_freebsd_large_stack"
        "libc_gdtoa"
        "libc_malloc"
        "libc_netbsd"
        "libc_openbsd"
        "libc_openbsd_large_stack"
        "libc_openbsd_ndk"
        "libc_stack_protector"
        "libc_syscalls"
        "libc_tzcode"
        "libstdc++"
    ];

    arch = {
        arm = {
            whole_static_libs = ["libc_aeabi"];
        };
    };
};

#  ========================================================
#  libc_common.a
#  ========================================================

libc_common = cc_library_static {
    defaults = ["libc_defaults"];
    name = "libc_common";

    whole_static_libs = [
        "libc_nopthread"
        "libc_pthread"
    ];
};

#  ========================================================
#  libc_common_static.a For static binaries.
#  ========================================================
libc_common_static = cc_library_static {
    defaults = ["libc_defaults"];
    name = "libc_common_static";

    arch = {
        x86 = {
            srcs = ["arch-x86/static_function_dispatch.S"];
        };
        arm = {
            srcs = ["arch-arm/static_function_dispatch.S"];
        };
    };

    whole_static_libs = [
        "libc_common"
    ];
};

#  ========================================================
#  libc_common_shared.a For shared libraries.
#  ========================================================
libc_common_shared = cc_library_static {
    defaults = ["libc_defaults"];
    name = "libc_common_shared";

    cflags = [
        "-fno-stack-protector"
        "-fno-jump-tables"
    ];
    arch = {
        x86 = {
            srcs = ["arch-x86/dynamic_function_dispatch.cpp"];
        };
        arm = {
            srcs = ["arch-arm/dynamic_function_dispatch.cpp"];
        };
    };

    whole_static_libs = [
        "libc_common"
    ];
};

#  ========================================================
#  libc_nomalloc.a
#  ========================================================
#
#  This is a version of the static C library that does not
#  include malloc. It's useful in situations when the user wants
#  to provide their own malloc implementation, or wants to
#  explicitly disallow the use of malloc, such as in the
#  dynamic linker.

libc_nomalloc = cc_library_static {
    name = "libc_nomalloc";

    defaults = ["libc_defaults"];

    arch = {
        arm = {
            srcs = ["arch-arm/bionic/exidx_static.c"];
        };
    };

    cflags = ["-DLIBC_STATIC"];

    whole_static_libs = [
        "libc_common_static"
        "libc_init_static"
    ];
};

#  ========================================================
#  libc_malloc.a: the _prefixed_ malloc functions (like dlcalloc).
#  ========================================================
libc_malloc = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = ["bionic/jemalloc_wrapper.cpp"];
    cflags = ["-fvisibility=hidden"];

    name = "libc_malloc";
};

libc_sources_shared = filegroup {
    name = "libc_sources_shared";
    srcs = [
        "arch-common/bionic/crtbegin_so.c"
        "arch-common/bionic/crtbrand.S"
        "bionic/icu.cpp"
        "bionic/malloc_common.cpp"
        "bionic/malloc_common_dynamic.cpp"
        "bionic/malloc_heapprofd.cpp"
        "bionic/malloc_limit.cpp"
        "bionic/NetdClient.cpp"
        "arch-common/bionic/crtend_so.S"
    ];
};

libc_sources_static = filegroup {
    name = "libc_sources_static";
    srcs = [
        "bionic/dl_iterate_phdr_static.cpp"
        "bionic/malloc_common.cpp"
        "bionic/malloc_limit.cpp"
    ];
};

libc_sources_shared_arm = filegroup {
    name = "libc_sources_shared_arm";
    srcs = [
        "arch-arm/bionic/exidx_dynamic.c"
        "arch-arm/bionic/atexit_legacy.c"
    ];
};

libc_sources_static_arm = filegroup {
    name = "libc_sources_static_arm";
    srcs = ["arch-arm/bionic/exidx_static.c"];
};

#  ========================================================
#  libc.a + libc.so
#  ========================================================
libc = cc_library {
    defaults = ["libc_defaults"];
    name = "libc";
    static_ndk_lib = true;
    export_include_dirs = ["include"];
    product_variables = {
        platform_sdk_version = {
            asflags = ["-DPLATFORM_SDK_VERSION=%d"];
        };
    };
    static = {
        srcs = [":libc_sources_static"];
        cflags = ["-DLIBC_STATIC"];
        whole_static_libs = [
            "libc_init_static"
            "libc_common_static"
        ];
    };
    shared = {
        srcs = [":libc_sources_shared"];
        whole_static_libs = [
            "libc_init_dynamic"
            "libc_common_shared"
        ];
    };

    required = ["tzdata"];

    #  Leave the symbols in the shared library so that stack unwinders can produce
    #  meaningful name resolution.
    strip = {
        keep_symbols = true;
    };

    #  Do not pack libc.so relocations; see http://b/20645321 for details.
    pack_relocations = false;

    #  WARNING: The only libraries libc.so should depend on are libdl.so and ld-android.so!
    #  If you add other libraries, make sure to add -Wl,--exclude-libs=libgcc.a to the
    #  LOCAL_LDFLAGS for those libraries.  This ensures that symbols that are pulled into
    #  those new libraries from libgcc.a are not declared external; if that were the case,
    #  then libc would not pull those symbols from libgcc.a as it should, instead relying
    #  on the external symbols from the dependent libraries.  That would create a "cloaked"
    #  dependency on libgcc.a in libc though the libraries, which is not what you wanted!

    shared_libs = [
        "ld-android"
        "libdl"
    ];
    static_libs = [
        "libdl_android"
    ];
    whole_static_libs = [
        "libjemalloc5"
    ];

    nocrt = true;

    arch = {
        arm = {
            #  TODO: This is to work around b/24465209. Remove after root cause is fixed.
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];

            version_script = ":libc.arm.map";

            shared = {
                srcs = [":libc_sources_shared_arm"];
                #  special for arm
                cflags = ["-DCRT_LEGACY_WORKAROUND"];
            };
            static = {
                srcs = [":libc_sources_static_arm"];
            };
        };
        arm64 = {
            version_script = ":libc.arm64.map";
        };
        x86 = {
            #  TODO: This is to work around b/24465209. Remove after root cause is fixed.
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];

            version_script = ":libc.x86.map";
        };
        x86_64 = {
            version_script = ":libc.x86_64.map";
        };
    };

    stubs = {
        symbol_file = "libc.map.txt";
        versions = ["10000"];
    };

    symbol_ordering_file = "symbol_ordering";
};

"libc.arm.map" = genrule {
    name = "libc.arm.map";
    out = ["libc.arm.map"];
    srcs = ["libc.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm $(in) $(out)";
};

"libc.arm64.map" = genrule {
    name = "libc.arm64.map";
    out = ["libc.arm64.map"];
    srcs = ["libc.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm64 $(in) $(out)";
};

"libc.x86.map" = genrule {
    name = "libc.x86.map";
    out = ["libc.x86.map"];
    srcs = ["libc.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86 $(in) $(out)";
};

"libc.x86_64.map" = genrule {
    name = "libc.x86_64.map";
    out = ["libc.x86_64.map"];
    srcs = ["libc.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86_64 $(in) $(out)";
};

#  libc_headers for libasync_safe and libpropertyinfoparser
libc_headers = cc_library_headers {
    name = "libc_headers";

    host_supported = true;
    vendor_available = true;
    recovery_available = true;

    no_libcrt = true;
    no_libgcc = true;
    stl = "none";
    system_shared_libs = [];

    export_include_dirs = [
        "include"
        "kernel/uapi"
        "kernel/android/uapi"
    ];

    arch = {
        arm = {
            export_include_dirs = [
                "kernel/uapi/asm-arm"
            ];
        };
        arm64 = {
            export_include_dirs = [
                "kernel/uapi/asm-arm64"
            ];
        };
        mips = {
            export_include_dirs = [
                "kernel/uapi/asm-mips"
            ];
        };
        mips64 = {
            export_include_dirs = [
                "kernel/uapi/asm-mips"
            ];
        };
        x86 = {
            export_include_dirs = [
                "kernel/uapi/asm-x86"
            ];
        };
        x86_64 = {
            export_include_dirs = [
                "kernel/uapi/asm-x86"
            ];
        };
    };
};

#  ========================================================
#  libstdc++.so and libstdc++.a.
#  ========================================================

"libstdc++" = cc_library {
    defaults = ["libc_defaults"];
    include_dirs = ["bionic/libstdc++/include"];
    srcs = [
        "bionic/__cxa_guard.cpp"
        "bionic/__cxa_pure_virtual.cpp"
        "bionic/new.cpp"
    ];
    name = "libstdc++";
    static_ndk_lib = true;
    static_libs = ["libasync_safe"];

    static = {
        system_shared_libs = [];
    };
    shared = {
        system_shared_libs = ["libc"];
    };

    # TODO (dimitry): This is to work around b/24465209. Remove after root cause is fixed
    arch = {
        arm = {
            #  TODO: This is to work around b/24465209. Remove after root cause is fixed.
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
            version_script = ":libstdc++.arm.map";
        };
        arm64 = {
            version_script = ":libstdc++.arm64.map";
        };
        x86 = {
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
            version_script = ":libstdc++.x86.map";
        };
        x86_64 = {
            version_script = ":libstdc++.x86_64.map";
        };
    };
};

"libstdc++.arm.map" = genrule {
    name = "libstdc++.arm.map";
    out = ["libstdc++.arm.map"];
    srcs = ["libstdc++.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm $(in) $(out)";
};

"libstdc++.arm64.map" = genrule {
    name = "libstdc++.arm64.map";
    out = ["libstdc++.arm64.map"];
    srcs = ["libstdc++.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm64 $(in) $(out)";
};

"libstdc++.x86.map" = genrule {
    name = "libstdc++.x86.map";
    out = ["libstdc++.x86.map"];
    srcs = ["libstdc++.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86 $(in) $(out)";
};

"libstdc++.x86_64.map" = genrule {
    name = "libstdc++.x86_64.map";
    out = ["libstdc++.x86_64.map"];
    srcs = ["libstdc++.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86_64 $(in) $(out)";
};

#  ========================================================
#  crt object files.
#  ========================================================

crt_defaults = cc_defaults {
    name = "crt_defaults";
    defaults = ["linux_bionic_supported"];
    vendor_available = true;
    recovery_available = true;

    cflags = [
        "-Wno-gcc-compat"
        "-Wall"
        "-Werror"
    ];
};

crt_so_defaults = cc_defaults {
    name = "crt_so_defaults";
    defaults = ["crt_defaults"];

    arch = {
        mips = {
            cflags = ["-fPIC"];
        };
        mips64 = {
            cflags = ["-fPIC"];
        };
        x86 = {
            cflags = ["-fPIC"];
        };
        x86_64 = {
            cflags = ["-fPIC"];
        };
    };
    stl = "none";
};

crtbrand = cc_object {
    name = "crtbrand";
    #  crtbrand.c needs <stdint.h> and a #define for the platform SDK version.
    local_include_dirs = ["include"];
    product_variables = {
        platform_sdk_version = {
            asflags = ["-DPLATFORM_SDK_VERSION=%d"];
        };
    };
    srcs = ["arch-common/bionic/crtbrand.S"];

    defaults = ["crt_so_defaults"];
};

crtbegin_so1 = cc_object {
    name = "crtbegin_so1";
    local_include_dirs = ["include"];
    srcs = ["arch-common/bionic/crtbegin_so.c"];

    defaults = ["crt_so_defaults"];
};

crtbegin_so = cc_object {
    name = "crtbegin_so";

    defaults = ["crt_so_defaults"];
    objs = [
        "crtbegin_so1"
        "crtbrand"
    ];
};

crtend_so = cc_object {
    name = "crtend_so";
    local_include_dirs = ["include"];
    srcs = ["arch-common/bionic/crtend_so.S"];

    defaults = ["crt_so_defaults"];
};

crtbegin_static1 = cc_object {
    name = "crtbegin_static1";
    local_include_dirs = ["include"];
    srcs = ["arch-common/bionic/crtbegin.c"];

    arch = {
        mips = {
            srcs = [
                "arch-mips/bionic/crtbegin.c"
            ];
            exclude_srcs = [
                "arch-common/bionic/crtbegin.c"
            ];
        };
        mips64 = {
            srcs = [
                "arch-mips64/bionic/crtbegin.c"
            ];
            exclude_srcs = [
                "arch-common/bionic/crtbegin.c"
            ];
        };
    };

    defaults = ["crt_defaults"];
};

crtbegin_static = cc_object {
    name = "crtbegin_static";

    objs = [
        "crtbegin_static1"
        "crtbrand"
    ];
    defaults = ["crt_defaults"];
};

crtbegin_dynamic1 = cc_object {
    name = "crtbegin_dynamic1";
    local_include_dirs = ["include"];
    srcs = ["arch-common/bionic/crtbegin.c"];

    arch = {
        mips = {
            srcs = [
                "arch-mips/bionic/crtbegin.c"
            ];
            exclude_srcs = [
                "arch-common/bionic/crtbegin.c"
            ];
        };
        mips64 = {
            srcs = [
                "arch-mips64/bionic/crtbegin.c"
            ];
            exclude_srcs = [
                "arch-common/bionic/crtbegin.c"
            ];
        };
    };
    defaults = ["crt_defaults"];
};

crtbegin_dynamic = cc_object {
    name = "crtbegin_dynamic";

    objs = [
        "crtbegin_dynamic1"
        "crtbrand"
    ];
    target = {
        linux_bionic = {
            generated_sources = ["host_bionic_linker_asm"];
            objs = [
                "linker_wrapper"
            ];
        };
    };
    defaults = ["crt_defaults"];
};

crtend_android = cc_object {
    #  We rename crtend.o to crtend_android.o to avoid a
    #  name clash between gcc and bionic.
    name = "crtend_android";
    local_include_dirs = ["include"];
    srcs = ["arch-common/bionic/crtend.S"];

    defaults = ["crt_defaults"];
};

#  ========================================================
#  NDK headers.
#  ========================================================

#  Not actually used in the NDK, but needed to build AOSP for mips.

#  Not actually used in the NDK, but needed to build AOSP for mips64.

#  Export these headers for toolbox to process
kernel_input_headers = filegroup {
    name = "kernel_input_headers";
    srcs = [
        "kernel/uapi/linux/input.h"
        "kernel/uapi/linux/input-event-codes.h"
    ];
};

#  Generate a syscall name / number mapping. These objects are text files
#  (thanks to the -dD -E flags) and not binary files. They will then be
#  consumed by the genseccomp.py script and converted into C++ code.
libseccomp_gen_syscall_nrs_defaults = cc_defaults {
    name = "libseccomp_gen_syscall_nrs_defaults";
    recovery_available = true;
    srcs = ["seccomp/gen_syscall_nrs.cpp"];
    cflags = [
        "-dD"
        "-E"
        "-Wall"
        "-Werror"
        "-nostdinc"
    ];
};

libseccomp_gen_syscall_nrs_arm = cc_object {
    name = "libseccomp_gen_syscall_nrs_arm";
    defaults = ["libseccomp_gen_syscall_nrs_defaults"];
    local_include_dirs = [
        "kernel/uapi/asm-arm"
        "kernel/uapi"
    ];
};

libseccomp_gen_syscall_nrs_arm64 = cc_object {
    name = "libseccomp_gen_syscall_nrs_arm64";
    defaults = ["libseccomp_gen_syscall_nrs_defaults"];
    local_include_dirs = [
        "kernel/uapi/asm-arm64"
        "kernel/uapi"
    ];
};

libseccomp_gen_syscall_nrs_x86 = cc_object {
    name = "libseccomp_gen_syscall_nrs_x86";
    defaults = ["libseccomp_gen_syscall_nrs_defaults"];
    srcs = ["seccomp/gen_syscall_nrs_x86.cpp"];
    exclude_srcs = ["seccomp/gen_syscall_nrs.cpp"];
    local_include_dirs = [
        "kernel/uapi/asm-x86"
        "kernel/uapi"
    ];
};

libseccomp_gen_syscall_nrs_x86_64 = cc_object {
    name = "libseccomp_gen_syscall_nrs_x86_64";
    defaults = ["libseccomp_gen_syscall_nrs_defaults"];
    srcs = ["seccomp/gen_syscall_nrs_x86_64.cpp"];
    exclude_srcs = ["seccomp/gen_syscall_nrs.cpp"];
    local_include_dirs = [
        "kernel/uapi/asm-x86"
        "kernel/uapi"
    ];
};

libseccomp_gen_syscall_nrs_mips = cc_object {
    name = "libseccomp_gen_syscall_nrs_mips";
    defaults = ["libseccomp_gen_syscall_nrs_defaults"];
    cflags = [
        "-D_MIPS_SIM=_MIPS_SIM_ABI32"
    ];
    local_include_dirs = [
        "kernel/uapi/asm-mips"
        "kernel/uapi"
    ];
};

libseccomp_gen_syscall_nrs_mips64 = cc_object {
    name = "libseccomp_gen_syscall_nrs_mips64";
    defaults = ["libseccomp_gen_syscall_nrs_defaults"];
    cflags = [
        "-D_MIPS_SIM=_MIPS_SIM_ABI64"
    ];
    local_include_dirs = [
        "kernel/uapi/asm-mips"
        "kernel/uapi"
    ];
};

#  Generate the C++ policy sources for app, system, and global seccomp-bpf
#  filters.
genseccomp = python_binary_host {
    name = "genseccomp";
    main = "tools/genseccomp.py";

    srcs = [
        "tools/genseccomp.py"
        "tools/gensyscalls.py"
    ];

    data = [
        "kernel/uapi/asm-arm/asm/auxvec.h"
        "kernel/uapi/asm-arm/asm/bitsperlong.h"
        "kernel/uapi/asm-arm/asm/bpf_perf_event.h"
        "kernel/uapi/asm-arm/asm/byteorder.h"
        "kernel/uapi/asm-arm/asm/errno.h"
        "kernel/uapi/asm-arm/asm/fcntl.h"
        "kernel/uapi/asm-arm/asm/hwcap.h"
        "kernel/uapi/asm-arm/asm/ioctl.h"
        "kernel/uapi/asm-arm/asm/ioctls.h"
        "kernel/uapi/asm-arm/asm/ipcbuf.h"
        "kernel/uapi/asm-arm/asm/kvm.h"
        "kernel/uapi/asm-arm/asm/kvm_para.h"
        "kernel/uapi/asm-arm/asm/mman.h"
        "kernel/uapi/asm-arm/asm/msgbuf.h"
        "kernel/uapi/asm-arm/asm/param.h"
        "kernel/uapi/asm-arm/asm/perf_regs.h"
        "kernel/uapi/asm-arm/asm/poll.h"
        "kernel/uapi/asm-arm/asm/posix_types.h"
        "kernel/uapi/asm-arm/asm/ptrace.h"
        "kernel/uapi/asm-arm/asm/resource.h"
        "kernel/uapi/asm-arm/asm/sembuf.h"
        "kernel/uapi/asm-arm/asm/setup.h"
        "kernel/uapi/asm-arm/asm/shmbuf.h"
        "kernel/uapi/asm-arm/asm/sigcontext.h"
        "kernel/uapi/asm-arm/asm/siginfo.h"
        "kernel/uapi/asm-arm/asm/signal.h"
        "kernel/uapi/asm-arm/asm/socket.h"
        "kernel/uapi/asm-arm/asm/sockios.h"
        "kernel/uapi/asm-arm/asm/stat.h"
        "kernel/uapi/asm-arm/asm/statfs.h"
        "kernel/uapi/asm-arm/asm/swab.h"
        "kernel/uapi/asm-arm/asm/termbits.h"
        "kernel/uapi/asm-arm/asm/termios.h"
        "kernel/uapi/asm-arm/asm/types.h"
        "kernel/uapi/asm-arm/asm/unistd-common.h"
        "kernel/uapi/asm-arm/asm/unistd-eabi.h"
        "kernel/uapi/asm-arm/asm/unistd-oabi.h"
        "kernel/uapi/asm-arm/asm/unistd.h"
        "kernel/uapi/asm-arm64/asm/auxvec.h"
        "kernel/uapi/asm-arm64/asm/bitsperlong.h"
        "kernel/uapi/asm-arm64/asm/bpf_perf_event.h"
        "kernel/uapi/asm-arm64/asm/byteorder.h"
        "kernel/uapi/asm-arm64/asm/errno.h"
        "kernel/uapi/asm-arm64/asm/fcntl.h"
        "kernel/uapi/asm-arm64/asm/hwcap.h"
        "kernel/uapi/asm-arm64/asm/ioctl.h"
        "kernel/uapi/asm-arm64/asm/ioctls.h"
        "kernel/uapi/asm-arm64/asm/ipcbuf.h"
        "kernel/uapi/asm-arm64/asm/kvm.h"
        "kernel/uapi/asm-arm64/asm/kvm_para.h"
        "kernel/uapi/asm-arm64/asm/mman.h"
        "kernel/uapi/asm-arm64/asm/msgbuf.h"
        "kernel/uapi/asm-arm64/asm/param.h"
        "kernel/uapi/asm-arm64/asm/perf_regs.h"
        "kernel/uapi/asm-arm64/asm/poll.h"
        "kernel/uapi/asm-arm64/asm/posix_types.h"
        "kernel/uapi/asm-arm64/asm/ptrace.h"
        "kernel/uapi/asm-arm64/asm/resource.h"
        "kernel/uapi/asm-arm64/asm/sembuf.h"
        "kernel/uapi/asm-arm64/asm/setup.h"
        "kernel/uapi/asm-arm64/asm/shmbuf.h"
        "kernel/uapi/asm-arm64/asm/sigcontext.h"
        "kernel/uapi/asm-arm64/asm/siginfo.h"
        "kernel/uapi/asm-arm64/asm/signal.h"
        "kernel/uapi/asm-arm64/asm/socket.h"
        "kernel/uapi/asm-arm64/asm/sockios.h"
        "kernel/uapi/asm-arm64/asm/stat.h"
        "kernel/uapi/asm-arm64/asm/statfs.h"
        "kernel/uapi/asm-arm64/asm/sve_context.h"
        "kernel/uapi/asm-arm64/asm/swab.h"
        "kernel/uapi/asm-arm64/asm/termbits.h"
        "kernel/uapi/asm-arm64/asm/termios.h"
        "kernel/uapi/asm-arm64/asm/types.h"
        "kernel/uapi/asm-arm64/asm/ucontext.h"
        "kernel/uapi/asm-arm64/asm/unistd.h"
        "kernel/uapi/asm-generic/auxvec.h"
        "kernel/uapi/asm-generic/bitsperlong.h"
        "kernel/uapi/asm-generic/bpf_perf_event.h"
        "kernel/uapi/asm-generic/errno-base.h"
        "kernel/uapi/asm-generic/errno.h"
        "kernel/uapi/asm-generic/fcntl.h"
        "kernel/uapi/asm-generic/hugetlb_encode.h"
        "kernel/uapi/asm-generic/int-l64.h"
        "kernel/uapi/asm-generic/int-ll64.h"
        "kernel/uapi/asm-generic/ioctl.h"
        "kernel/uapi/asm-generic/ioctls.h"
        "kernel/uapi/asm-generic/ipcbuf.h"
        "kernel/uapi/asm-generic/kvm_para.h"
        "kernel/uapi/asm-generic/mman-common.h"
        "kernel/uapi/asm-generic/mman.h"
        "kernel/uapi/asm-generic/msgbuf.h"
        "kernel/uapi/asm-generic/param.h"
        "kernel/uapi/asm-generic/poll.h"
        "kernel/uapi/asm-generic/posix_types.h"
        "kernel/uapi/asm-generic/resource.h"
        "kernel/uapi/asm-generic/sembuf.h"
        "kernel/uapi/asm-generic/setup.h"
        "kernel/uapi/asm-generic/shmbuf.h"
        "kernel/uapi/asm-generic/siginfo.h"
        "kernel/uapi/asm-generic/signal-defs.h"
        "kernel/uapi/asm-generic/signal.h"
        "kernel/uapi/asm-generic/socket.h"
        "kernel/uapi/asm-generic/sockios.h"
        "kernel/uapi/asm-generic/stat.h"
        "kernel/uapi/asm-generic/statfs.h"
        "kernel/uapi/asm-generic/swab.h"
        "kernel/uapi/asm-generic/termbits.h"
        "kernel/uapi/asm-generic/termios.h"
        "kernel/uapi/asm-generic/types.h"
        "kernel/uapi/asm-generic/ucontext.h"
        "kernel/uapi/asm-generic/unistd.h"
        "kernel/uapi/asm-mips/asm/auxvec.h"
        "kernel/uapi/asm-mips/asm/bitfield.h"
        "kernel/uapi/asm-mips/asm/bitsperlong.h"
        "kernel/uapi/asm-mips/asm/bpf_perf_event.h"
        "kernel/uapi/asm-mips/asm/break.h"
        "kernel/uapi/asm-mips/asm/byteorder.h"
        "kernel/uapi/asm-mips/asm/cachectl.h"
        "kernel/uapi/asm-mips/asm/errno.h"
        "kernel/uapi/asm-mips/asm/fcntl.h"
        "kernel/uapi/asm-mips/asm/hwcap.h"
        "kernel/uapi/asm-mips/asm/inst.h"
        "kernel/uapi/asm-mips/asm/ioctl.h"
        "kernel/uapi/asm-mips/asm/ioctls.h"
        "kernel/uapi/asm-mips/asm/ipcbuf.h"
        "kernel/uapi/asm-mips/asm/kvm.h"
        "kernel/uapi/asm-mips/asm/kvm_para.h"
        "kernel/uapi/asm-mips/asm/mman.h"
        "kernel/uapi/asm-mips/asm/msgbuf.h"
        "kernel/uapi/asm-mips/asm/param.h"
        "kernel/uapi/asm-mips/asm/poll.h"
        "kernel/uapi/asm-mips/asm/posix_types.h"
        "kernel/uapi/asm-mips/asm/ptrace.h"
        "kernel/uapi/asm-mips/asm/reg.h"
        "kernel/uapi/asm-mips/asm/resource.h"
        "kernel/uapi/asm-mips/asm/sembuf.h"
        "kernel/uapi/asm-mips/asm/setup.h"
        "kernel/uapi/asm-mips/asm/sgidefs.h"
        "kernel/uapi/asm-mips/asm/shmbuf.h"
        "kernel/uapi/asm-mips/asm/sigcontext.h"
        "kernel/uapi/asm-mips/asm/siginfo.h"
        "kernel/uapi/asm-mips/asm/signal.h"
        "kernel/uapi/asm-mips/asm/socket.h"
        "kernel/uapi/asm-mips/asm/sockios.h"
        "kernel/uapi/asm-mips/asm/stat.h"
        "kernel/uapi/asm-mips/asm/statfs.h"
        "kernel/uapi/asm-mips/asm/swab.h"
        "kernel/uapi/asm-mips/asm/sysmips.h"
        "kernel/uapi/asm-mips/asm/termbits.h"
        "kernel/uapi/asm-mips/asm/termios.h"
        "kernel/uapi/asm-mips/asm/types.h"
        "kernel/uapi/asm-mips/asm/ucontext.h"
        "kernel/uapi/asm-mips/asm/unistd.h"
        "kernel/uapi/asm-mips/asm/unistd_n32.h"
        "kernel/uapi/asm-mips/asm/unistd_n64.h"
        "kernel/uapi/asm-mips/asm/unistd_nr_n32.h"
        "kernel/uapi/asm-mips/asm/unistd_nr_n64.h"
        "kernel/uapi/asm-mips/asm/unistd_nr_o32.h"
        "kernel/uapi/asm-mips/asm/unistd_o32.h"
        "kernel/uapi/asm-x86/asm/a.out.h"
        "kernel/uapi/asm-x86/asm/auxvec.h"
        "kernel/uapi/asm-x86/asm/bitsperlong.h"
        "kernel/uapi/asm-x86/asm/boot.h"
        "kernel/uapi/asm-x86/asm/bootparam.h"
        "kernel/uapi/asm-x86/asm/bpf_perf_event.h"
        "kernel/uapi/asm-x86/asm/byteorder.h"
        "kernel/uapi/asm-x86/asm/debugreg.h"
        "kernel/uapi/asm-x86/asm/e820.h"
        "kernel/uapi/asm-x86/asm/errno.h"
        "kernel/uapi/asm-x86/asm/fcntl.h"
        "kernel/uapi/asm-x86/asm/hw_breakpoint.h"
        "kernel/uapi/asm-x86/asm/hwcap2.h"
        "kernel/uapi/asm-x86/asm/ioctl.h"
        "kernel/uapi/asm-x86/asm/ioctls.h"
        "kernel/uapi/asm-x86/asm/ipcbuf.h"
        "kernel/uapi/asm-x86/asm/ist.h"
        "kernel/uapi/asm-x86/asm/kvm.h"
        "kernel/uapi/asm-x86/asm/kvm_para.h"
        "kernel/uapi/asm-x86/asm/kvm_perf.h"
        "kernel/uapi/asm-x86/asm/ldt.h"
        "kernel/uapi/asm-x86/asm/mce.h"
        "kernel/uapi/asm-x86/asm/mman.h"
        "kernel/uapi/asm-x86/asm/msgbuf.h"
        "kernel/uapi/asm-x86/asm/msr.h"
        "kernel/uapi/asm-x86/asm/mtrr.h"
        "kernel/uapi/asm-x86/asm/param.h"
        "kernel/uapi/asm-x86/asm/perf_regs.h"
        "kernel/uapi/asm-x86/asm/poll.h"
        "kernel/uapi/asm-x86/asm/posix_types.h"
        "kernel/uapi/asm-x86/asm/posix_types_32.h"
        "kernel/uapi/asm-x86/asm/posix_types_64.h"
        "kernel/uapi/asm-x86/asm/posix_types_x32.h"
        "kernel/uapi/asm-x86/asm/prctl.h"
        "kernel/uapi/asm-x86/asm/processor-flags.h"
        "kernel/uapi/asm-x86/asm/ptrace-abi.h"
        "kernel/uapi/asm-x86/asm/ptrace.h"
        "kernel/uapi/asm-x86/asm/resource.h"
        "kernel/uapi/asm-x86/asm/sembuf.h"
        "kernel/uapi/asm-x86/asm/setup.h"
        "kernel/uapi/asm-x86/asm/shmbuf.h"
        "kernel/uapi/asm-x86/asm/sigcontext.h"
        "kernel/uapi/asm-x86/asm/sigcontext32.h"
        "kernel/uapi/asm-x86/asm/siginfo.h"
        "kernel/uapi/asm-x86/asm/signal.h"
        "kernel/uapi/asm-x86/asm/socket.h"
        "kernel/uapi/asm-x86/asm/sockios.h"
        "kernel/uapi/asm-x86/asm/stat.h"
        "kernel/uapi/asm-x86/asm/statfs.h"
        "kernel/uapi/asm-x86/asm/svm.h"
        "kernel/uapi/asm-x86/asm/swab.h"
        "kernel/uapi/asm-x86/asm/termbits.h"
        "kernel/uapi/asm-x86/asm/termios.h"
        "kernel/uapi/asm-x86/asm/types.h"
        "kernel/uapi/asm-x86/asm/ucontext.h"
        "kernel/uapi/asm-x86/asm/unistd.h"
        "kernel/uapi/asm-x86/asm/unistd_32.h"
        "kernel/uapi/asm-x86/asm/unistd_64.h"
        "kernel/uapi/asm-x86/asm/unistd_x32.h"
        "kernel/uapi/asm-x86/asm/vm86.h"
        "kernel/uapi/asm-x86/asm/vmx.h"
        "kernel/uapi/asm-x86/asm/vsyscall.h"
        "kernel/uapi/drm/amdgpu_drm.h"
        "kernel/uapi/drm/armada_drm.h"
        "kernel/uapi/drm/drm.h"
        "kernel/uapi/drm/drm_fourcc.h"
        "kernel/uapi/drm/drm_mode.h"
        "kernel/uapi/drm/drm_sarea.h"
        "kernel/uapi/drm/etnaviv_drm.h"
        "kernel/uapi/drm/exynos_drm.h"
        "kernel/uapi/drm/i810_drm.h"
        "kernel/uapi/drm/i915_drm.h"
        "kernel/uapi/drm/mga_drm.h"
        "kernel/uapi/drm/msm_drm.h"
        "kernel/uapi/drm/nouveau_drm.h"
        "kernel/uapi/drm/omap_drm.h"
        "kernel/uapi/drm/qxl_drm.h"
        "kernel/uapi/drm/r128_drm.h"
        "kernel/uapi/drm/radeon_drm.h"
        "kernel/uapi/drm/savage_drm.h"
        "kernel/uapi/drm/sis_drm.h"
        "kernel/uapi/drm/tegra_drm.h"
        "kernel/uapi/drm/v3d_drm.h"
        "kernel/uapi/drm/vc4_drm.h"
        "kernel/uapi/drm/vgem_drm.h"
        "kernel/uapi/drm/via_drm.h"
        "kernel/uapi/drm/virtgpu_drm.h"
        "kernel/uapi/drm/vmwgfx_drm.h"
        "kernel/uapi/linux/a.out.h"
        "kernel/uapi/linux/acct.h"
        "kernel/uapi/linux/adb.h"
        "kernel/uapi/linux/adfs_fs.h"
        "kernel/uapi/linux/affs_hardblocks.h"
        "kernel/uapi/linux/agpgart.h"
        "kernel/uapi/linux/aio_abi.h"
        "kernel/uapi/linux/am437x-vpfe.h"
        "kernel/uapi/linux/apm_bios.h"
        "kernel/uapi/linux/arcfb.h"
        "kernel/uapi/linux/arm_sdei.h"
        "kernel/uapi/linux/ashmem.h"
        "kernel/uapi/linux/aspeed-lpc-ctrl.h"
        "kernel/uapi/linux/atalk.h"
        "kernel/uapi/linux/atm.h"
        "kernel/uapi/linux/atm_eni.h"
        "kernel/uapi/linux/atm_he.h"
        "kernel/uapi/linux/atm_idt77105.h"
        "kernel/uapi/linux/atm_nicstar.h"
        "kernel/uapi/linux/atm_tcp.h"
        "kernel/uapi/linux/atm_zatm.h"
        "kernel/uapi/linux/atmapi.h"
        "kernel/uapi/linux/atmarp.h"
        "kernel/uapi/linux/atmbr2684.h"
        "kernel/uapi/linux/atmclip.h"
        "kernel/uapi/linux/atmdev.h"
        "kernel/uapi/linux/atmioc.h"
        "kernel/uapi/linux/atmlec.h"
        "kernel/uapi/linux/atmmpc.h"
        "kernel/uapi/linux/atmppp.h"
        "kernel/uapi/linux/atmsap.h"
        "kernel/uapi/linux/atmsvc.h"
        "kernel/uapi/linux/audit.h"
        "kernel/uapi/linux/auto_dev-ioctl.h"
        "kernel/uapi/linux/auto_fs.h"
        "kernel/uapi/linux/auto_fs4.h"
        "kernel/uapi/linux/auxvec.h"
        "kernel/uapi/linux/ax25.h"
        "kernel/uapi/linux/b1lli.h"
        "kernel/uapi/linux/batadv_packet.h"
        "kernel/uapi/linux/batman_adv.h"
        "kernel/uapi/linux/baycom.h"
        "kernel/uapi/linux/bcache.h"
        "kernel/uapi/linux/bcm933xx_hcs.h"
        "kernel/uapi/linux/bfs_fs.h"
        "kernel/uapi/linux/binfmts.h"
        "kernel/uapi/linux/blkpg.h"
        "kernel/uapi/linux/blktrace_api.h"
        "kernel/uapi/linux/blkzoned.h"
        "kernel/uapi/linux/bpf.h"
        "kernel/uapi/linux/bpf_common.h"
        "kernel/uapi/linux/bpf_perf_event.h"
        "kernel/uapi/linux/bpfilter.h"
        "kernel/uapi/linux/bpqether.h"
        "kernel/uapi/linux/bsg.h"
        "kernel/uapi/linux/bt-bmc.h"
        "kernel/uapi/linux/btf.h"
        "kernel/uapi/linux/btrfs.h"
        "kernel/uapi/linux/btrfs_tree.h"
        "kernel/uapi/linux/can.h"
        "kernel/uapi/linux/capability.h"
        "kernel/uapi/linux/capi.h"
        "kernel/uapi/linux/cciss_defs.h"
        "kernel/uapi/linux/cciss_ioctl.h"
        "kernel/uapi/linux/cdrom.h"
        "kernel/uapi/linux/cec-funcs.h"
        "kernel/uapi/linux/cec.h"
        "kernel/uapi/linux/cgroupstats.h"
        "kernel/uapi/linux/chio.h"
        "kernel/uapi/linux/cm4000_cs.h"
        "kernel/uapi/linux/cn_proc.h"
        "kernel/uapi/linux/coda.h"
        "kernel/uapi/linux/coda_psdev.h"
        "kernel/uapi/linux/coff.h"
        "kernel/uapi/linux/connector.h"
        "kernel/uapi/linux/const.h"
        "kernel/uapi/linux/coresight-stm.h"
        "kernel/uapi/linux/cramfs_fs.h"
        "kernel/uapi/linux/cryptouser.h"
        "kernel/uapi/linux/cuda.h"
        "kernel/uapi/linux/cyclades.h"
        "kernel/uapi/linux/cycx_cfm.h"
        "kernel/uapi/linux/dcbnl.h"
        "kernel/uapi/linux/dccp.h"
        "kernel/uapi/linux/devlink.h"
        "kernel/uapi/linux/dlm.h"
        "kernel/uapi/linux/dlm_device.h"
        "kernel/uapi/linux/dlm_netlink.h"
        "kernel/uapi/linux/dlm_plock.h"
        "kernel/uapi/linux/dlmconstants.h"
        "kernel/uapi/linux/dm-ioctl.h"
        "kernel/uapi/linux/dm-log-userspace.h"
        "kernel/uapi/linux/dma-buf.h"
        "kernel/uapi/linux/dn.h"
        "kernel/uapi/linux/dns_resolver.h"
        "kernel/uapi/linux/dqblk_xfs.h"
        "kernel/uapi/linux/edd.h"
        "kernel/uapi/linux/efs_fs_sb.h"
        "kernel/uapi/linux/elf-em.h"
        "kernel/uapi/linux/elf-fdpic.h"
        "kernel/uapi/linux/elf.h"
        "kernel/uapi/linux/elfcore.h"
        "kernel/uapi/linux/errno.h"
        "kernel/uapi/linux/errqueue.h"
        "kernel/uapi/linux/erspan.h"
        "kernel/uapi/linux/ethtool.h"
        "kernel/uapi/linux/eventpoll.h"
        "kernel/uapi/linux/fadvise.h"
        "kernel/uapi/linux/falloc.h"
        "kernel/uapi/linux/fanotify.h"
        "kernel/uapi/linux/fb.h"
        "kernel/uapi/linux/fcntl.h"
        "kernel/uapi/linux/fd.h"
        "kernel/uapi/linux/fdreg.h"
        "kernel/uapi/linux/fib_rules.h"
        "kernel/uapi/linux/fiemap.h"
        "kernel/uapi/linux/filter.h"
        "kernel/uapi/linux/firewire-cdev.h"
        "kernel/uapi/linux/firewire-constants.h"
        "kernel/uapi/linux/flat.h"
        "kernel/uapi/linux/fou.h"
        "kernel/uapi/linux/fpga-dfl.h"
        "kernel/uapi/linux/fs.h"
        "kernel/uapi/linux/fsi.h"
        "kernel/uapi/linux/fsl_hypervisor.h"
        "kernel/uapi/linux/fsmap.h"
        "kernel/uapi/linux/fuse.h"
        "kernel/uapi/linux/futex.h"
        "kernel/uapi/linux/gameport.h"
        "kernel/uapi/linux/gen_stats.h"
        "kernel/uapi/linux/genetlink.h"
        "kernel/uapi/linux/gfs2_ondisk.h"
        "kernel/uapi/linux/gigaset_dev.h"
        "kernel/uapi/linux/gpio.h"
        "kernel/uapi/linux/gsmmux.h"
        "kernel/uapi/linux/gtp.h"
        "kernel/uapi/linux/hash_info.h"
        "kernel/uapi/linux/hdlc.h"
        "kernel/uapi/linux/hdlcdrv.h"
        "kernel/uapi/linux/hdreg.h"
        "kernel/uapi/linux/hid.h"
        "kernel/uapi/linux/hiddev.h"
        "kernel/uapi/linux/hidraw.h"
        "kernel/uapi/linux/hpet.h"
        "kernel/uapi/linux/hsr_netlink.h"
        "kernel/uapi/linux/hw_breakpoint.h"
        "kernel/uapi/linux/hyperv.h"
        "kernel/uapi/linux/hysdn_if.h"
        "kernel/uapi/linux/i2c-dev.h"
        "kernel/uapi/linux/i2c.h"
        "kernel/uapi/linux/i2o-dev.h"
        "kernel/uapi/linux/i8k.h"
        "kernel/uapi/linux/icmp.h"
        "kernel/uapi/linux/icmpv6.h"
        "kernel/uapi/linux/if.h"
        "kernel/uapi/linux/if_addr.h"
        "kernel/uapi/linux/if_addrlabel.h"
        "kernel/uapi/linux/if_alg.h"
        "kernel/uapi/linux/if_arcnet.h"
        "kernel/uapi/linux/if_arp.h"
        "kernel/uapi/linux/if_bonding.h"
        "kernel/uapi/linux/if_bridge.h"
        "kernel/uapi/linux/if_cablemodem.h"
        "kernel/uapi/linux/if_eql.h"
        "kernel/uapi/linux/if_ether.h"
        "kernel/uapi/linux/if_fc.h"
        "kernel/uapi/linux/if_fddi.h"
        "kernel/uapi/linux/if_frad.h"
        "kernel/uapi/linux/if_hippi.h"
        "kernel/uapi/linux/if_infiniband.h"
        "kernel/uapi/linux/if_link.h"
        "kernel/uapi/linux/if_ltalk.h"
        "kernel/uapi/linux/if_macsec.h"
        "kernel/uapi/linux/if_packet.h"
        "kernel/uapi/linux/if_phonet.h"
        "kernel/uapi/linux/if_plip.h"
        "kernel/uapi/linux/if_ppp.h"
        "kernel/uapi/linux/if_pppol2tp.h"
        "kernel/uapi/linux/if_pppox.h"
        "kernel/uapi/linux/if_slip.h"
        "kernel/uapi/linux/if_team.h"
        "kernel/uapi/linux/if_tun.h"
        "kernel/uapi/linux/if_tunnel.h"
        "kernel/uapi/linux/if_vlan.h"
        "kernel/uapi/linux/if_x25.h"
        "kernel/uapi/linux/if_xdp.h"
        "kernel/uapi/linux/ife.h"
        "kernel/uapi/linux/igmp.h"
        "kernel/uapi/linux/ila.h"
        "kernel/uapi/linux/in.h"
        "kernel/uapi/linux/in6.h"
        "kernel/uapi/linux/in_route.h"
        "kernel/uapi/linux/inet_diag.h"
        "kernel/uapi/linux/inotify.h"
        "kernel/uapi/linux/input-event-codes.h"
        "kernel/uapi/linux/input.h"
        "kernel/uapi/linux/ioctl.h"
        "kernel/uapi/linux/ip.h"
        "kernel/uapi/linux/ip6_tunnel.h"
        "kernel/uapi/linux/ip_vs.h"
        "kernel/uapi/linux/ipc.h"
        "kernel/uapi/linux/ipmi.h"
        "kernel/uapi/linux/ipmi_bmc.h"
        "kernel/uapi/linux/ipmi_msgdefs.h"
        "kernel/uapi/linux/ipsec.h"
        "kernel/uapi/linux/ipv6.h"
        "kernel/uapi/linux/ipv6_route.h"
        "kernel/uapi/linux/ipx.h"
        "kernel/uapi/linux/irqnr.h"
        "kernel/uapi/linux/isdn.h"
        "kernel/uapi/linux/isdn_divertif.h"
        "kernel/uapi/linux/isdn_ppp.h"
        "kernel/uapi/linux/isdnif.h"
        "kernel/uapi/linux/iso_fs.h"
        "kernel/uapi/linux/ivtv.h"
        "kernel/uapi/linux/ivtvfb.h"
        "kernel/uapi/linux/jffs2.h"
        "kernel/uapi/linux/joystick.h"
        "kernel/uapi/linux/kcm.h"
        "kernel/uapi/linux/kcmp.h"
        "kernel/uapi/linux/kcov.h"
        "kernel/uapi/linux/kd.h"
        "kernel/uapi/linux/kdev_t.h"
        "kernel/uapi/linux/kernel-page-flags.h"
        "kernel/uapi/linux/kernel.h"
        "kernel/uapi/linux/kernelcapi.h"
        "kernel/uapi/linux/kexec.h"
        "kernel/uapi/linux/keyboard.h"
        "kernel/uapi/linux/keyctl.h"
        "kernel/uapi/linux/kfd_ioctl.h"
        "kernel/uapi/linux/kvm.h"
        "kernel/uapi/linux/kvm_para.h"
        "kernel/uapi/linux/l2tp.h"
        "kernel/uapi/linux/libc-compat.h"
        "kernel/uapi/linux/lightnvm.h"
        "kernel/uapi/linux/limits.h"
        "kernel/uapi/linux/lirc.h"
        "kernel/uapi/linux/llc.h"
        "kernel/uapi/linux/loop.h"
        "kernel/uapi/linux/lp.h"
        "kernel/uapi/linux/lwtunnel.h"
        "kernel/uapi/linux/magic.h"
        "kernel/uapi/linux/major.h"
        "kernel/uapi/linux/map_to_7segment.h"
        "kernel/uapi/linux/matroxfb.h"
        "kernel/uapi/linux/max2175.h"
        "kernel/uapi/linux/mdio.h"
        "kernel/uapi/linux/media-bus-format.h"
        "kernel/uapi/linux/media.h"
        "kernel/uapi/linux/mei.h"
        "kernel/uapi/linux/membarrier.h"
        "kernel/uapi/linux/memfd.h"
        "kernel/uapi/linux/mempolicy.h"
        "kernel/uapi/linux/meye.h"
        "kernel/uapi/linux/mic_common.h"
        "kernel/uapi/linux/mic_ioctl.h"
        "kernel/uapi/linux/mii.h"
        "kernel/uapi/linux/minix_fs.h"
        "kernel/uapi/linux/mman.h"
        "kernel/uapi/linux/mmtimer.h"
        "kernel/uapi/linux/module.h"
        "kernel/uapi/linux/mount.h"
        "kernel/uapi/linux/mpls.h"
        "kernel/uapi/linux/mpls_iptunnel.h"
        "kernel/uapi/linux/mqueue.h"
        "kernel/uapi/linux/mroute.h"
        "kernel/uapi/linux/mroute6.h"
        "kernel/uapi/linux/msdos_fs.h"
        "kernel/uapi/linux/msg.h"
        "kernel/uapi/linux/mtio.h"
        "kernel/uapi/linux/n_r3964.h"
        "kernel/uapi/linux/nbd-netlink.h"
        "kernel/uapi/linux/nbd.h"
        "kernel/uapi/linux/ncsi.h"
        "kernel/uapi/linux/ndctl.h"
        "kernel/uapi/linux/neighbour.h"
        "kernel/uapi/linux/net.h"
        "kernel/uapi/linux/net_dropmon.h"
        "kernel/uapi/linux/net_namespace.h"
        "kernel/uapi/linux/net_tstamp.h"
        "kernel/uapi/linux/netconf.h"
        "kernel/uapi/linux/netdevice.h"
        "kernel/uapi/linux/netfilter.h"
        "kernel/uapi/linux/netfilter_arp.h"
        "kernel/uapi/linux/netfilter_bridge.h"
        "kernel/uapi/linux/netfilter_decnet.h"
        "kernel/uapi/linux/netfilter_ipv4.h"
        "kernel/uapi/linux/netfilter_ipv6.h"
        "kernel/uapi/linux/netlink.h"
        "kernel/uapi/linux/netlink_diag.h"
        "kernel/uapi/linux/netrom.h"
        "kernel/uapi/linux/nfc.h"
        "kernel/uapi/linux/nfs.h"
        "kernel/uapi/linux/nfs2.h"
        "kernel/uapi/linux/nfs3.h"
        "kernel/uapi/linux/nfs4.h"
        "kernel/uapi/linux/nfs4_mount.h"
        "kernel/uapi/linux/nfs_fs.h"
        "kernel/uapi/linux/nfs_idmap.h"
        "kernel/uapi/linux/nfs_mount.h"
        "kernel/uapi/linux/nfsacl.h"
        "kernel/uapi/linux/nilfs2_api.h"
        "kernel/uapi/linux/nilfs2_ondisk.h"
        "kernel/uapi/linux/nl80211.h"
        "kernel/uapi/linux/nsfs.h"
        "kernel/uapi/linux/nubus.h"
        "kernel/uapi/linux/nvme_ioctl.h"
        "kernel/uapi/linux/nvram.h"
        "kernel/uapi/linux/omap3isp.h"
        "kernel/uapi/linux/omapfb.h"
        "kernel/uapi/linux/oom.h"
        "kernel/uapi/linux/openvswitch.h"
        "kernel/uapi/linux/packet_diag.h"
        "kernel/uapi/linux/param.h"
        "kernel/uapi/linux/parport.h"
        "kernel/uapi/linux/patchkey.h"
        "kernel/uapi/linux/pci.h"
        "kernel/uapi/linux/pci_regs.h"
        "kernel/uapi/linux/pcitest.h"
        "kernel/uapi/linux/perf_event.h"
        "kernel/uapi/linux/personality.h"
        "kernel/uapi/linux/pfkeyv2.h"
        "kernel/uapi/linux/pg.h"
        "kernel/uapi/linux/phantom.h"
        "kernel/uapi/linux/phonet.h"
        "kernel/uapi/linux/pkt_cls.h"
        "kernel/uapi/linux/pkt_sched.h"
        "kernel/uapi/linux/pktcdvd.h"
        "kernel/uapi/linux/pmu.h"
        "kernel/uapi/linux/poll.h"
        "kernel/uapi/linux/posix_acl.h"
        "kernel/uapi/linux/posix_acl_xattr.h"
        "kernel/uapi/linux/posix_types.h"
        "kernel/uapi/linux/ppdev.h"
        "kernel/uapi/linux/ppp-comp.h"
        "kernel/uapi/linux/ppp-ioctl.h"
        "kernel/uapi/linux/ppp_defs.h"
        "kernel/uapi/linux/pps.h"
        "kernel/uapi/linux/pr.h"
        "kernel/uapi/linux/prctl.h"
        "kernel/uapi/linux/psample.h"
        "kernel/uapi/linux/psci.h"
        "kernel/uapi/linux/psp-sev.h"
        "kernel/uapi/linux/ptp_clock.h"
        "kernel/uapi/linux/ptrace.h"
        "kernel/uapi/linux/qemu_fw_cfg.h"
        "kernel/uapi/linux/qnx4_fs.h"
        "kernel/uapi/linux/qnxtypes.h"
        "kernel/uapi/linux/qrtr.h"
        "kernel/uapi/linux/quota.h"
        "kernel/uapi/linux/radeonfb.h"
        "kernel/uapi/linux/random.h"
        "kernel/uapi/linux/raw.h"
        "kernel/uapi/linux/rds.h"
        "kernel/uapi/linux/reboot.h"
        "kernel/uapi/linux/reiserfs_fs.h"
        "kernel/uapi/linux/reiserfs_xattr.h"
        "kernel/uapi/linux/resource.h"
        "kernel/uapi/linux/rfkill.h"
        "kernel/uapi/linux/rio_cm_cdev.h"
        "kernel/uapi/linux/rio_mport_cdev.h"
        "kernel/uapi/linux/romfs_fs.h"
        "kernel/uapi/linux/rose.h"
        "kernel/uapi/linux/route.h"
        "kernel/uapi/linux/rpmsg.h"
        "kernel/uapi/linux/rseq.h"
        "kernel/uapi/linux/rtc.h"
        "kernel/uapi/linux/rtnetlink.h"
        "kernel/uapi/linux/rxrpc.h"
        "kernel/uapi/linux/scc.h"
        "kernel/uapi/linux/sched.h"
        "kernel/uapi/linux/scif_ioctl.h"
        "kernel/uapi/linux/screen_info.h"
        "kernel/uapi/linux/sctp.h"
        "kernel/uapi/linux/sdla.h"
        "kernel/uapi/linux/seccomp.h"
        "kernel/uapi/linux/securebits.h"
        "kernel/uapi/linux/sed-opal.h"
        "kernel/uapi/linux/seg6.h"
        "kernel/uapi/linux/seg6_genl.h"
        "kernel/uapi/linux/seg6_hmac.h"
        "kernel/uapi/linux/seg6_iptunnel.h"
        "kernel/uapi/linux/seg6_local.h"
        "kernel/uapi/linux/selinux_netlink.h"
        "kernel/uapi/linux/sem.h"
        "kernel/uapi/linux/serial.h"
        "kernel/uapi/linux/serial_core.h"
        "kernel/uapi/linux/serial_reg.h"
        "kernel/uapi/linux/serio.h"
        "kernel/uapi/linux/shm.h"
        "kernel/uapi/linux/signal.h"
        "kernel/uapi/linux/signalfd.h"
        "kernel/uapi/linux/smc.h"
        "kernel/uapi/linux/smc_diag.h"
        "kernel/uapi/linux/smiapp.h"
        "kernel/uapi/linux/snmp.h"
        "kernel/uapi/linux/sock_diag.h"
        "kernel/uapi/linux/socket.h"
        "kernel/uapi/linux/sockios.h"
        "kernel/uapi/linux/sonet.h"
        "kernel/uapi/linux/sonypi.h"
        "kernel/uapi/linux/sound.h"
        "kernel/uapi/linux/soundcard.h"
        "kernel/uapi/linux/stat.h"
        "kernel/uapi/linux/stddef.h"
        "kernel/uapi/linux/stm.h"
        "kernel/uapi/linux/string.h"
        "kernel/uapi/linux/suspend_ioctls.h"
        "kernel/uapi/linux/swab.h"
        "kernel/uapi/linux/switchtec_ioctl.h"
        "kernel/uapi/linux/sync_file.h"
        "kernel/uapi/linux/synclink.h"
        "kernel/uapi/linux/sysctl.h"
        "kernel/uapi/linux/sysinfo.h"
        "kernel/uapi/linux/target_core_user.h"
        "kernel/uapi/linux/taskstats.h"
        "kernel/uapi/linux/tcp.h"
        "kernel/uapi/linux/tcp_metrics.h"
        "kernel/uapi/linux/tee.h"
        "kernel/uapi/linux/termios.h"
        "kernel/uapi/linux/thermal.h"
        "kernel/uapi/linux/time.h"
        "kernel/uapi/linux/timerfd.h"
        "kernel/uapi/linux/times.h"
        "kernel/uapi/linux/timex.h"
        "kernel/uapi/linux/tiocl.h"
        "kernel/uapi/linux/tipc.h"
        "kernel/uapi/linux/tipc_config.h"
        "kernel/uapi/linux/tipc_netlink.h"
        "kernel/uapi/linux/tipc_sockets_diag.h"
        "kernel/uapi/linux/tls.h"
        "kernel/uapi/linux/toshiba.h"
        "kernel/uapi/linux/tty.h"
        "kernel/uapi/linux/tty_flags.h"
        "kernel/uapi/linux/types.h"
        "kernel/uapi/linux/udf_fs_i.h"
        "kernel/uapi/linux/udmabuf.h"
        "kernel/uapi/linux/udp.h"
        "kernel/uapi/linux/uhid.h"
        "kernel/uapi/linux/uinput.h"
        "kernel/uapi/linux/uio.h"
        "kernel/uapi/linux/uleds.h"
        "kernel/uapi/linux/ultrasound.h"
        "kernel/uapi/linux/un.h"
        "kernel/uapi/linux/unistd.h"
        "kernel/uapi/linux/unix_diag.h"
        "kernel/uapi/linux/usbdevice_fs.h"
        "kernel/uapi/linux/usbip.h"
        "kernel/uapi/linux/userfaultfd.h"
        "kernel/uapi/linux/userio.h"
        "kernel/uapi/linux/utime.h"
        "kernel/uapi/linux/utsname.h"
        "kernel/uapi/linux/uuid.h"
        "kernel/uapi/linux/uvcvideo.h"
        "kernel/uapi/linux/v4l2-common.h"
        "kernel/uapi/linux/v4l2-controls.h"
        "kernel/uapi/linux/v4l2-dv-timings.h"
        "kernel/uapi/linux/v4l2-mediabus.h"
        "kernel/uapi/linux/v4l2-subdev.h"
        "kernel/uapi/linux/vbox_err.h"
        "kernel/uapi/linux/vbox_vmmdev_types.h"
        "kernel/uapi/linux/vboxguest.h"
        "kernel/uapi/linux/version.h"
        "kernel/uapi/linux/veth.h"
        "kernel/uapi/linux/vfio.h"
        "kernel/uapi/linux/vfio_ccw.h"
        "kernel/uapi/linux/vhost.h"
        "kernel/uapi/linux/vhost_types.h"
        "kernel/uapi/linux/videodev2.h"
        "kernel/uapi/linux/virtio_9p.h"
        "kernel/uapi/linux/virtio_balloon.h"
        "kernel/uapi/linux/virtio_blk.h"
        "kernel/uapi/linux/virtio_config.h"
        "kernel/uapi/linux/virtio_console.h"
        "kernel/uapi/linux/virtio_crypto.h"
        "kernel/uapi/linux/virtio_gpu.h"
        "kernel/uapi/linux/virtio_ids.h"
        "kernel/uapi/linux/virtio_input.h"
        "kernel/uapi/linux/virtio_mmio.h"
        "kernel/uapi/linux/virtio_net.h"
        "kernel/uapi/linux/virtio_pci.h"
        "kernel/uapi/linux/virtio_ring.h"
        "kernel/uapi/linux/virtio_rng.h"
        "kernel/uapi/linux/virtio_scsi.h"
        "kernel/uapi/linux/virtio_types.h"
        "kernel/uapi/linux/virtio_vsock.h"
        "kernel/uapi/linux/vm_sockets.h"
        "kernel/uapi/linux/vm_sockets_diag.h"
        "kernel/uapi/linux/vmcore.h"
        "kernel/uapi/linux/vsoc_shm.h"
        "kernel/uapi/linux/vsockmon.h"
        "kernel/uapi/linux/vt.h"
        "kernel/uapi/linux/vtpm_proxy.h"
        "kernel/uapi/linux/wait.h"
        "kernel/uapi/linux/wanrouter.h"
        "kernel/uapi/linux/watchdog.h"
        "kernel/uapi/linux/wimax.h"
        "kernel/uapi/linux/wireless.h"
        "kernel/uapi/linux/wmi.h"
        "kernel/uapi/linux/x25.h"
        "kernel/uapi/linux/xattr.h"
        "kernel/uapi/linux/xfrm.h"
        "kernel/uapi/linux/xilinx-v4l2-controls.h"
        "kernel/uapi/linux/zorro.h"
        "kernel/uapi/linux/zorro_ids.h"
        "kernel/uapi/linux/android/binder.h"
        "kernel/uapi/linux/android/binderfs.h"
        "kernel/uapi/linux/byteorder/big_endian.h"
        "kernel/uapi/linux/byteorder/little_endian.h"
        "kernel/uapi/linux/caif/caif_socket.h"
        "kernel/uapi/linux/caif/if_caif.h"
        "kernel/uapi/linux/can/bcm.h"
        "kernel/uapi/linux/can/error.h"
        "kernel/uapi/linux/can/gw.h"
        "kernel/uapi/linux/can/netlink.h"
        "kernel/uapi/linux/can/raw.h"
        "kernel/uapi/linux/can/vxcan.h"
        "kernel/uapi/linux/cifs/cifs_mount.h"
        "kernel/uapi/linux/dvb/audio.h"
        "kernel/uapi/linux/dvb/ca.h"
        "kernel/uapi/linux/dvb/dmx.h"
        "kernel/uapi/linux/dvb/frontend.h"
        "kernel/uapi/linux/dvb/net.h"
        "kernel/uapi/linux/dvb/osd.h"
        "kernel/uapi/linux/dvb/version.h"
        "kernel/uapi/linux/dvb/video.h"
        "kernel/uapi/linux/genwqe/genwqe_card.h"
        "kernel/uapi/linux/hdlc/ioctl.h"
        "kernel/uapi/linux/hsi/cs-protocol.h"
        "kernel/uapi/linux/hsi/hsi_char.h"
        "kernel/uapi/linux/iio/events.h"
        "kernel/uapi/linux/iio/types.h"
        "kernel/uapi/linux/isdn/capicmd.h"
        "kernel/uapi/linux/mmc/ioctl.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_common.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_ftp.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_sctp.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_tcp.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_tuple_common.h"
        "kernel/uapi/linux/netfilter/nf_log.h"
        "kernel/uapi/linux/netfilter/nf_nat.h"
        "kernel/uapi/linux/netfilter/nf_tables.h"
        "kernel/uapi/linux/netfilter/nf_tables_compat.h"
        "kernel/uapi/linux/netfilter/nfnetlink.h"
        "kernel/uapi/linux/netfilter/nfnetlink_acct.h"
        "kernel/uapi/linux/netfilter/nfnetlink_compat.h"
        "kernel/uapi/linux/netfilter/nfnetlink_conntrack.h"
        "kernel/uapi/linux/netfilter/nfnetlink_cthelper.h"
        "kernel/uapi/linux/netfilter/nfnetlink_cttimeout.h"
        "kernel/uapi/linux/netfilter/nfnetlink_log.h"
        "kernel/uapi/linux/netfilter/nfnetlink_osf.h"
        "kernel/uapi/linux/netfilter/nfnetlink_queue.h"
        "kernel/uapi/linux/netfilter/x_tables.h"
        "kernel/uapi/linux/netfilter/xt_AUDIT.h"
        "kernel/uapi/linux/netfilter/xt_CHECKSUM.h"
        "kernel/uapi/linux/netfilter/xt_CLASSIFY.h"
        "kernel/uapi/linux/netfilter/xt_CONNMARK.h"
        "kernel/uapi/linux/netfilter/xt_CONNSECMARK.h"
        "kernel/uapi/linux/netfilter/xt_CT.h"
        "kernel/uapi/linux/netfilter/xt_DSCP.h"
        "kernel/uapi/linux/netfilter/xt_HMARK.h"
        "kernel/uapi/linux/netfilter/xt_IDLETIMER.h"
        "kernel/uapi/linux/netfilter/xt_LED.h"
        "kernel/uapi/linux/netfilter/xt_LOG.h"
        "kernel/uapi/linux/netfilter/xt_MARK.h"
        "kernel/uapi/linux/netfilter/xt_NFLOG.h"
        "kernel/uapi/linux/netfilter/xt_NFQUEUE.h"
        "kernel/uapi/linux/netfilter/xt_RATEEST.h"
        "kernel/uapi/linux/netfilter/xt_SECMARK.h"
        "kernel/uapi/linux/netfilter/xt_SYNPROXY.h"
        "kernel/uapi/linux/netfilter/xt_TCPMSS.h"
        "kernel/uapi/linux/netfilter/xt_TCPOPTSTRIP.h"
        "kernel/uapi/linux/netfilter/xt_TEE.h"
        "kernel/uapi/linux/netfilter/xt_TPROXY.h"
        "kernel/uapi/linux/netfilter/xt_addrtype.h"
        "kernel/uapi/linux/netfilter/xt_bpf.h"
        "kernel/uapi/linux/netfilter/xt_cgroup.h"
        "kernel/uapi/linux/netfilter/xt_cluster.h"
        "kernel/uapi/linux/netfilter/xt_comment.h"
        "kernel/uapi/linux/netfilter/xt_connbytes.h"
        "kernel/uapi/linux/netfilter/xt_connlabel.h"
        "kernel/uapi/linux/netfilter/xt_connlimit.h"
        "kernel/uapi/linux/netfilter/xt_connmark.h"
        "kernel/uapi/linux/netfilter/xt_conntrack.h"
        "kernel/uapi/linux/netfilter/xt_cpu.h"
        "kernel/uapi/linux/netfilter/xt_dccp.h"
        "kernel/uapi/linux/netfilter/xt_devgroup.h"
        "kernel/uapi/linux/netfilter/xt_dscp.h"
        "kernel/uapi/linux/netfilter/xt_ecn.h"
        "kernel/uapi/linux/netfilter/xt_esp.h"
        "kernel/uapi/linux/netfilter/xt_hashlimit.h"
        "kernel/uapi/linux/netfilter/xt_helper.h"
        "kernel/uapi/linux/netfilter/xt_ipcomp.h"
        "kernel/uapi/linux/netfilter/xt_iprange.h"
        "kernel/uapi/linux/netfilter/xt_ipvs.h"
        "kernel/uapi/linux/netfilter/xt_l2tp.h"
        "kernel/uapi/linux/netfilter/xt_length.h"
        "kernel/uapi/linux/netfilter/xt_limit.h"
        "kernel/uapi/linux/netfilter/xt_mac.h"
        "kernel/uapi/linux/netfilter/xt_mark.h"
        "kernel/uapi/linux/netfilter/xt_multiport.h"
        "kernel/uapi/linux/netfilter/xt_nfacct.h"
        "kernel/uapi/linux/netfilter/xt_osf.h"
        "kernel/uapi/linux/netfilter/xt_owner.h"
        "kernel/uapi/linux/netfilter/xt_physdev.h"
        "kernel/uapi/linux/netfilter/xt_pkttype.h"
        "kernel/uapi/linux/netfilter/xt_policy.h"
        "kernel/uapi/linux/netfilter/xt_quota.h"
        "kernel/uapi/linux/netfilter/xt_rateest.h"
        "kernel/uapi/linux/netfilter/xt_realm.h"
        "kernel/uapi/linux/netfilter/xt_recent.h"
        "kernel/uapi/linux/netfilter/xt_rpfilter.h"
        "kernel/uapi/linux/netfilter/xt_sctp.h"
        "kernel/uapi/linux/netfilter/xt_set.h"
        "kernel/uapi/linux/netfilter/xt_socket.h"
        "kernel/uapi/linux/netfilter/xt_state.h"
        "kernel/uapi/linux/netfilter/xt_statistic.h"
        "kernel/uapi/linux/netfilter/xt_string.h"
        "kernel/uapi/linux/netfilter/xt_tcpmss.h"
        "kernel/uapi/linux/netfilter/xt_tcpudp.h"
        "kernel/uapi/linux/netfilter/xt_time.h"
        "kernel/uapi/linux/netfilter/xt_u32.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set_bitmap.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set_hash.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set_list.h"
        "kernel/uapi/linux/netfilter_arp/arp_tables.h"
        "kernel/uapi/linux/netfilter_arp/arpt_mangle.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_802_3.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_among.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_arp.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_arpreply.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_ip.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_ip6.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_limit.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_log.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_mark_m.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_mark_t.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_nat.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_nflog.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_pkttype.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_redirect.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_stp.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_vlan.h"
        "kernel/uapi/linux/netfilter_bridge/ebtables.h"
        "kernel/uapi/linux/netfilter_ipv4/ip_tables.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_CLUSTERIP.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ECN.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_LOG.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_REJECT.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_TTL.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ah.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ecn.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ttl.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6_tables.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_HL.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_LOG.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_NPT.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_REJECT.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_ah.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_frag.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_hl.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_ipv6header.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_mh.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_opts.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_rt.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_srh.h"
        "kernel/uapi/linux/nfsd/cld.h"
        "kernel/uapi/linux/nfsd/debug.h"
        "kernel/uapi/linux/nfsd/export.h"
        "kernel/uapi/linux/nfsd/nfsfh.h"
        "kernel/uapi/linux/nfsd/stats.h"
        "kernel/uapi/linux/raid/md_p.h"
        "kernel/uapi/linux/raid/md_u.h"
        "kernel/uapi/linux/sched/types.h"
        "kernel/uapi/linux/spi/spidev.h"
        "kernel/uapi/linux/sunrpc/debug.h"
        "kernel/uapi/linux/tc_act/tc_bpf.h"
        "kernel/uapi/linux/tc_act/tc_connmark.h"
        "kernel/uapi/linux/tc_act/tc_csum.h"
        "kernel/uapi/linux/tc_act/tc_defact.h"
        "kernel/uapi/linux/tc_act/tc_gact.h"
        "kernel/uapi/linux/tc_act/tc_ife.h"
        "kernel/uapi/linux/tc_act/tc_ipt.h"
        "kernel/uapi/linux/tc_act/tc_mirred.h"
        "kernel/uapi/linux/tc_act/tc_nat.h"
        "kernel/uapi/linux/tc_act/tc_pedit.h"
        "kernel/uapi/linux/tc_act/tc_sample.h"
        "kernel/uapi/linux/tc_act/tc_skbedit.h"
        "kernel/uapi/linux/tc_act/tc_skbmod.h"
        "kernel/uapi/linux/tc_act/tc_tunnel_key.h"
        "kernel/uapi/linux/tc_act/tc_vlan.h"
        "kernel/uapi/linux/tc_ematch/tc_em_cmp.h"
        "kernel/uapi/linux/tc_ematch/tc_em_ipt.h"
        "kernel/uapi/linux/tc_ematch/tc_em_meta.h"
        "kernel/uapi/linux/tc_ematch/tc_em_nbyte.h"
        "kernel/uapi/linux/tc_ematch/tc_em_text.h"
        "kernel/uapi/linux/usb/audio.h"
        "kernel/uapi/linux/usb/cdc-wdm.h"
        "kernel/uapi/linux/usb/cdc.h"
        "kernel/uapi/linux/usb/ch11.h"
        "kernel/uapi/linux/usb/ch9.h"
        "kernel/uapi/linux/usb/charger.h"
        "kernel/uapi/linux/usb/functionfs.h"
        "kernel/uapi/linux/usb/g_printer.h"
        "kernel/uapi/linux/usb/g_uvc.h"
        "kernel/uapi/linux/usb/gadgetfs.h"
        "kernel/uapi/linux/usb/midi.h"
        "kernel/uapi/linux/usb/tmc.h"
        "kernel/uapi/linux/usb/video.h"
        "kernel/uapi/linux/wimax/i2400m.h"
        "kernel/uapi/misc/cxl.h"
        "kernel/uapi/misc/ocxl.h"
        "kernel/uapi/mtd/inftl-user.h"
        "kernel/uapi/mtd/mtd-abi.h"
        "kernel/uapi/mtd/mtd-user.h"
        "kernel/uapi/mtd/nftl-user.h"
        "kernel/uapi/mtd/ubi-user.h"
        "kernel/uapi/rdma/bnxt_re-abi.h"
        "kernel/uapi/rdma/cxgb3-abi.h"
        "kernel/uapi/rdma/cxgb4-abi.h"
        "kernel/uapi/rdma/hns-abi.h"
        "kernel/uapi/rdma/i40iw-abi.h"
        "kernel/uapi/rdma/ib_user_cm.h"
        "kernel/uapi/rdma/ib_user_ioctl_cmds.h"
        "kernel/uapi/rdma/ib_user_ioctl_verbs.h"
        "kernel/uapi/rdma/ib_user_mad.h"
        "kernel/uapi/rdma/ib_user_sa.h"
        "kernel/uapi/rdma/ib_user_verbs.h"
        "kernel/uapi/rdma/mlx4-abi.h"
        "kernel/uapi/rdma/mlx5-abi.h"
        "kernel/uapi/rdma/mlx5_user_ioctl_cmds.h"
        "kernel/uapi/rdma/mlx5_user_ioctl_verbs.h"
        "kernel/uapi/rdma/mthca-abi.h"
        "kernel/uapi/rdma/nes-abi.h"
        "kernel/uapi/rdma/ocrdma-abi.h"
        "kernel/uapi/rdma/qedr-abi.h"
        "kernel/uapi/rdma/rdma_netlink.h"
        "kernel/uapi/rdma/rdma_user_cm.h"
        "kernel/uapi/rdma/rdma_user_ioctl.h"
        "kernel/uapi/rdma/rdma_user_ioctl_cmds.h"
        "kernel/uapi/rdma/rdma_user_rxe.h"
        "kernel/uapi/rdma/vmw_pvrdma-abi.h"
        "kernel/uapi/rdma/hfi/hfi1_ioctl.h"
        "kernel/uapi/rdma/hfi/hfi1_user.h"
        "kernel/uapi/scsi/cxlflash_ioctl.h"
        "kernel/uapi/scsi/scsi_bsg_fc.h"
        "kernel/uapi/scsi/scsi_bsg_ufs.h"
        "kernel/uapi/scsi/scsi_netlink.h"
        "kernel/uapi/scsi/scsi_netlink_fc.h"
        "kernel/uapi/scsi/fc/fc_els.h"
        "kernel/uapi/scsi/fc/fc_fs.h"
        "kernel/uapi/scsi/fc/fc_gs.h"
        "kernel/uapi/scsi/fc/fc_ns.h"
        "kernel/uapi/sound/asequencer.h"
        "kernel/uapi/sound/asoc.h"
        "kernel/uapi/sound/asound.h"
        "kernel/uapi/sound/asound_fm.h"
        "kernel/uapi/sound/compress_offload.h"
        "kernel/uapi/sound/compress_params.h"
        "kernel/uapi/sound/emu10k1.h"
        "kernel/uapi/sound/firewire.h"
        "kernel/uapi/sound/hdsp.h"
        "kernel/uapi/sound/hdspm.h"
        "kernel/uapi/sound/sb16_csp.h"
        "kernel/uapi/sound/sfnt_info.h"
        "kernel/uapi/sound/skl-tplg-interface.h"
        "kernel/uapi/sound/snd_sst_tokens.h"
        "kernel/uapi/sound/tlv.h"
        "kernel/uapi/sound/usb_stream.h"
        "kernel/uapi/video/edid.h"
        "kernel/uapi/video/sisfb.h"
        "kernel/uapi/video/uvesafb.h"
        "kernel/uapi/xen/evtchn.h"
        "kernel/uapi/xen/gntalloc.h"
        "kernel/uapi/xen/gntdev.h"
        "kernel/uapi/xen/privcmd.h"
    ];

    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

genfunctosyscallnrs = python_binary_host {
    name = "genfunctosyscallnrs";
    main = "tools/genfunctosyscallnrs.py";

    srcs = [
        "tools/genseccomp.py"
        "tools/genfunctosyscallnrs.py"
        "tools/gensyscalls.py"
    ];

    data = [
        "kernel/uapi/asm-arm/asm/auxvec.h"
        "kernel/uapi/asm-arm/asm/bitsperlong.h"
        "kernel/uapi/asm-arm/asm/bpf_perf_event.h"
        "kernel/uapi/asm-arm/asm/byteorder.h"
        "kernel/uapi/asm-arm/asm/errno.h"
        "kernel/uapi/asm-arm/asm/fcntl.h"
        "kernel/uapi/asm-arm/asm/hwcap.h"
        "kernel/uapi/asm-arm/asm/ioctl.h"
        "kernel/uapi/asm-arm/asm/ioctls.h"
        "kernel/uapi/asm-arm/asm/ipcbuf.h"
        "kernel/uapi/asm-arm/asm/kvm.h"
        "kernel/uapi/asm-arm/asm/kvm_para.h"
        "kernel/uapi/asm-arm/asm/mman.h"
        "kernel/uapi/asm-arm/asm/msgbuf.h"
        "kernel/uapi/asm-arm/asm/param.h"
        "kernel/uapi/asm-arm/asm/perf_regs.h"
        "kernel/uapi/asm-arm/asm/poll.h"
        "kernel/uapi/asm-arm/asm/posix_types.h"
        "kernel/uapi/asm-arm/asm/ptrace.h"
        "kernel/uapi/asm-arm/asm/resource.h"
        "kernel/uapi/asm-arm/asm/sembuf.h"
        "kernel/uapi/asm-arm/asm/setup.h"
        "kernel/uapi/asm-arm/asm/shmbuf.h"
        "kernel/uapi/asm-arm/asm/sigcontext.h"
        "kernel/uapi/asm-arm/asm/siginfo.h"
        "kernel/uapi/asm-arm/asm/signal.h"
        "kernel/uapi/asm-arm/asm/socket.h"
        "kernel/uapi/asm-arm/asm/sockios.h"
        "kernel/uapi/asm-arm/asm/stat.h"
        "kernel/uapi/asm-arm/asm/statfs.h"
        "kernel/uapi/asm-arm/asm/swab.h"
        "kernel/uapi/asm-arm/asm/termbits.h"
        "kernel/uapi/asm-arm/asm/termios.h"
        "kernel/uapi/asm-arm/asm/types.h"
        "kernel/uapi/asm-arm/asm/unistd-common.h"
        "kernel/uapi/asm-arm/asm/unistd-eabi.h"
        "kernel/uapi/asm-arm/asm/unistd-oabi.h"
        "kernel/uapi/asm-arm/asm/unistd.h"
        "kernel/uapi/asm-arm64/asm/auxvec.h"
        "kernel/uapi/asm-arm64/asm/bitsperlong.h"
        "kernel/uapi/asm-arm64/asm/bpf_perf_event.h"
        "kernel/uapi/asm-arm64/asm/byteorder.h"
        "kernel/uapi/asm-arm64/asm/errno.h"
        "kernel/uapi/asm-arm64/asm/fcntl.h"
        "kernel/uapi/asm-arm64/asm/hwcap.h"
        "kernel/uapi/asm-arm64/asm/ioctl.h"
        "kernel/uapi/asm-arm64/asm/ioctls.h"
        "kernel/uapi/asm-arm64/asm/ipcbuf.h"
        "kernel/uapi/asm-arm64/asm/kvm.h"
        "kernel/uapi/asm-arm64/asm/kvm_para.h"
        "kernel/uapi/asm-arm64/asm/mman.h"
        "kernel/uapi/asm-arm64/asm/msgbuf.h"
        "kernel/uapi/asm-arm64/asm/param.h"
        "kernel/uapi/asm-arm64/asm/perf_regs.h"
        "kernel/uapi/asm-arm64/asm/poll.h"
        "kernel/uapi/asm-arm64/asm/posix_types.h"
        "kernel/uapi/asm-arm64/asm/ptrace.h"
        "kernel/uapi/asm-arm64/asm/resource.h"
        "kernel/uapi/asm-arm64/asm/sembuf.h"
        "kernel/uapi/asm-arm64/asm/setup.h"
        "kernel/uapi/asm-arm64/asm/shmbuf.h"
        "kernel/uapi/asm-arm64/asm/sigcontext.h"
        "kernel/uapi/asm-arm64/asm/siginfo.h"
        "kernel/uapi/asm-arm64/asm/signal.h"
        "kernel/uapi/asm-arm64/asm/socket.h"
        "kernel/uapi/asm-arm64/asm/sockios.h"
        "kernel/uapi/asm-arm64/asm/stat.h"
        "kernel/uapi/asm-arm64/asm/statfs.h"
        "kernel/uapi/asm-arm64/asm/sve_context.h"
        "kernel/uapi/asm-arm64/asm/swab.h"
        "kernel/uapi/asm-arm64/asm/termbits.h"
        "kernel/uapi/asm-arm64/asm/termios.h"
        "kernel/uapi/asm-arm64/asm/types.h"
        "kernel/uapi/asm-arm64/asm/ucontext.h"
        "kernel/uapi/asm-arm64/asm/unistd.h"
        "kernel/uapi/asm-generic/auxvec.h"
        "kernel/uapi/asm-generic/bitsperlong.h"
        "kernel/uapi/asm-generic/bpf_perf_event.h"
        "kernel/uapi/asm-generic/errno-base.h"
        "kernel/uapi/asm-generic/errno.h"
        "kernel/uapi/asm-generic/fcntl.h"
        "kernel/uapi/asm-generic/hugetlb_encode.h"
        "kernel/uapi/asm-generic/int-l64.h"
        "kernel/uapi/asm-generic/int-ll64.h"
        "kernel/uapi/asm-generic/ioctl.h"
        "kernel/uapi/asm-generic/ioctls.h"
        "kernel/uapi/asm-generic/ipcbuf.h"
        "kernel/uapi/asm-generic/kvm_para.h"
        "kernel/uapi/asm-generic/mman-common.h"
        "kernel/uapi/asm-generic/mman.h"
        "kernel/uapi/asm-generic/msgbuf.h"
        "kernel/uapi/asm-generic/param.h"
        "kernel/uapi/asm-generic/poll.h"
        "kernel/uapi/asm-generic/posix_types.h"
        "kernel/uapi/asm-generic/resource.h"
        "kernel/uapi/asm-generic/sembuf.h"
        "kernel/uapi/asm-generic/setup.h"
        "kernel/uapi/asm-generic/shmbuf.h"
        "kernel/uapi/asm-generic/siginfo.h"
        "kernel/uapi/asm-generic/signal-defs.h"
        "kernel/uapi/asm-generic/signal.h"
        "kernel/uapi/asm-generic/socket.h"
        "kernel/uapi/asm-generic/sockios.h"
        "kernel/uapi/asm-generic/stat.h"
        "kernel/uapi/asm-generic/statfs.h"
        "kernel/uapi/asm-generic/swab.h"
        "kernel/uapi/asm-generic/termbits.h"
        "kernel/uapi/asm-generic/termios.h"
        "kernel/uapi/asm-generic/types.h"
        "kernel/uapi/asm-generic/ucontext.h"
        "kernel/uapi/asm-generic/unistd.h"
        "kernel/uapi/asm-mips/asm/auxvec.h"
        "kernel/uapi/asm-mips/asm/bitfield.h"
        "kernel/uapi/asm-mips/asm/bitsperlong.h"
        "kernel/uapi/asm-mips/asm/bpf_perf_event.h"
        "kernel/uapi/asm-mips/asm/break.h"
        "kernel/uapi/asm-mips/asm/byteorder.h"
        "kernel/uapi/asm-mips/asm/cachectl.h"
        "kernel/uapi/asm-mips/asm/errno.h"
        "kernel/uapi/asm-mips/asm/fcntl.h"
        "kernel/uapi/asm-mips/asm/hwcap.h"
        "kernel/uapi/asm-mips/asm/inst.h"
        "kernel/uapi/asm-mips/asm/ioctl.h"
        "kernel/uapi/asm-mips/asm/ioctls.h"
        "kernel/uapi/asm-mips/asm/ipcbuf.h"
        "kernel/uapi/asm-mips/asm/kvm.h"
        "kernel/uapi/asm-mips/asm/kvm_para.h"
        "kernel/uapi/asm-mips/asm/mman.h"
        "kernel/uapi/asm-mips/asm/msgbuf.h"
        "kernel/uapi/asm-mips/asm/param.h"
        "kernel/uapi/asm-mips/asm/poll.h"
        "kernel/uapi/asm-mips/asm/posix_types.h"
        "kernel/uapi/asm-mips/asm/ptrace.h"
        "kernel/uapi/asm-mips/asm/reg.h"
        "kernel/uapi/asm-mips/asm/resource.h"
        "kernel/uapi/asm-mips/asm/sembuf.h"
        "kernel/uapi/asm-mips/asm/setup.h"
        "kernel/uapi/asm-mips/asm/sgidefs.h"
        "kernel/uapi/asm-mips/asm/shmbuf.h"
        "kernel/uapi/asm-mips/asm/sigcontext.h"
        "kernel/uapi/asm-mips/asm/siginfo.h"
        "kernel/uapi/asm-mips/asm/signal.h"
        "kernel/uapi/asm-mips/asm/socket.h"
        "kernel/uapi/asm-mips/asm/sockios.h"
        "kernel/uapi/asm-mips/asm/stat.h"
        "kernel/uapi/asm-mips/asm/statfs.h"
        "kernel/uapi/asm-mips/asm/swab.h"
        "kernel/uapi/asm-mips/asm/sysmips.h"
        "kernel/uapi/asm-mips/asm/termbits.h"
        "kernel/uapi/asm-mips/asm/termios.h"
        "kernel/uapi/asm-mips/asm/types.h"
        "kernel/uapi/asm-mips/asm/ucontext.h"
        "kernel/uapi/asm-mips/asm/unistd.h"
        "kernel/uapi/asm-mips/asm/unistd_n32.h"
        "kernel/uapi/asm-mips/asm/unistd_n64.h"
        "kernel/uapi/asm-mips/asm/unistd_nr_n32.h"
        "kernel/uapi/asm-mips/asm/unistd_nr_n64.h"
        "kernel/uapi/asm-mips/asm/unistd_nr_o32.h"
        "kernel/uapi/asm-mips/asm/unistd_o32.h"
        "kernel/uapi/asm-x86/asm/a.out.h"
        "kernel/uapi/asm-x86/asm/auxvec.h"
        "kernel/uapi/asm-x86/asm/bitsperlong.h"
        "kernel/uapi/asm-x86/asm/boot.h"
        "kernel/uapi/asm-x86/asm/bootparam.h"
        "kernel/uapi/asm-x86/asm/bpf_perf_event.h"
        "kernel/uapi/asm-x86/asm/byteorder.h"
        "kernel/uapi/asm-x86/asm/debugreg.h"
        "kernel/uapi/asm-x86/asm/e820.h"
        "kernel/uapi/asm-x86/asm/errno.h"
        "kernel/uapi/asm-x86/asm/fcntl.h"
        "kernel/uapi/asm-x86/asm/hw_breakpoint.h"
        "kernel/uapi/asm-x86/asm/hwcap2.h"
        "kernel/uapi/asm-x86/asm/ioctl.h"
        "kernel/uapi/asm-x86/asm/ioctls.h"
        "kernel/uapi/asm-x86/asm/ipcbuf.h"
        "kernel/uapi/asm-x86/asm/ist.h"
        "kernel/uapi/asm-x86/asm/kvm.h"
        "kernel/uapi/asm-x86/asm/kvm_para.h"
        "kernel/uapi/asm-x86/asm/kvm_perf.h"
        "kernel/uapi/asm-x86/asm/ldt.h"
        "kernel/uapi/asm-x86/asm/mce.h"
        "kernel/uapi/asm-x86/asm/mman.h"
        "kernel/uapi/asm-x86/asm/msgbuf.h"
        "kernel/uapi/asm-x86/asm/msr.h"
        "kernel/uapi/asm-x86/asm/mtrr.h"
        "kernel/uapi/asm-x86/asm/param.h"
        "kernel/uapi/asm-x86/asm/perf_regs.h"
        "kernel/uapi/asm-x86/asm/poll.h"
        "kernel/uapi/asm-x86/asm/posix_types.h"
        "kernel/uapi/asm-x86/asm/posix_types_32.h"
        "kernel/uapi/asm-x86/asm/posix_types_64.h"
        "kernel/uapi/asm-x86/asm/posix_types_x32.h"
        "kernel/uapi/asm-x86/asm/prctl.h"
        "kernel/uapi/asm-x86/asm/processor-flags.h"
        "kernel/uapi/asm-x86/asm/ptrace-abi.h"
        "kernel/uapi/asm-x86/asm/ptrace.h"
        "kernel/uapi/asm-x86/asm/resource.h"
        "kernel/uapi/asm-x86/asm/sembuf.h"
        "kernel/uapi/asm-x86/asm/setup.h"
        "kernel/uapi/asm-x86/asm/shmbuf.h"
        "kernel/uapi/asm-x86/asm/sigcontext.h"
        "kernel/uapi/asm-x86/asm/sigcontext32.h"
        "kernel/uapi/asm-x86/asm/siginfo.h"
        "kernel/uapi/asm-x86/asm/signal.h"
        "kernel/uapi/asm-x86/asm/socket.h"
        "kernel/uapi/asm-x86/asm/sockios.h"
        "kernel/uapi/asm-x86/asm/stat.h"
        "kernel/uapi/asm-x86/asm/statfs.h"
        "kernel/uapi/asm-x86/asm/svm.h"
        "kernel/uapi/asm-x86/asm/swab.h"
        "kernel/uapi/asm-x86/asm/termbits.h"
        "kernel/uapi/asm-x86/asm/termios.h"
        "kernel/uapi/asm-x86/asm/types.h"
        "kernel/uapi/asm-x86/asm/ucontext.h"
        "kernel/uapi/asm-x86/asm/unistd.h"
        "kernel/uapi/asm-x86/asm/unistd_32.h"
        "kernel/uapi/asm-x86/asm/unistd_64.h"
        "kernel/uapi/asm-x86/asm/unistd_x32.h"
        "kernel/uapi/asm-x86/asm/vm86.h"
        "kernel/uapi/asm-x86/asm/vmx.h"
        "kernel/uapi/asm-x86/asm/vsyscall.h"
        "kernel/uapi/drm/amdgpu_drm.h"
        "kernel/uapi/drm/armada_drm.h"
        "kernel/uapi/drm/drm.h"
        "kernel/uapi/drm/drm_fourcc.h"
        "kernel/uapi/drm/drm_mode.h"
        "kernel/uapi/drm/drm_sarea.h"
        "kernel/uapi/drm/etnaviv_drm.h"
        "kernel/uapi/drm/exynos_drm.h"
        "kernel/uapi/drm/i810_drm.h"
        "kernel/uapi/drm/i915_drm.h"
        "kernel/uapi/drm/mga_drm.h"
        "kernel/uapi/drm/msm_drm.h"
        "kernel/uapi/drm/nouveau_drm.h"
        "kernel/uapi/drm/omap_drm.h"
        "kernel/uapi/drm/qxl_drm.h"
        "kernel/uapi/drm/r128_drm.h"
        "kernel/uapi/drm/radeon_drm.h"
        "kernel/uapi/drm/savage_drm.h"
        "kernel/uapi/drm/sis_drm.h"
        "kernel/uapi/drm/tegra_drm.h"
        "kernel/uapi/drm/v3d_drm.h"
        "kernel/uapi/drm/vc4_drm.h"
        "kernel/uapi/drm/vgem_drm.h"
        "kernel/uapi/drm/via_drm.h"
        "kernel/uapi/drm/virtgpu_drm.h"
        "kernel/uapi/drm/vmwgfx_drm.h"
        "kernel/uapi/linux/a.out.h"
        "kernel/uapi/linux/acct.h"
        "kernel/uapi/linux/adb.h"
        "kernel/uapi/linux/adfs_fs.h"
        "kernel/uapi/linux/affs_hardblocks.h"
        "kernel/uapi/linux/agpgart.h"
        "kernel/uapi/linux/aio_abi.h"
        "kernel/uapi/linux/am437x-vpfe.h"
        "kernel/uapi/linux/apm_bios.h"
        "kernel/uapi/linux/arcfb.h"
        "kernel/uapi/linux/arm_sdei.h"
        "kernel/uapi/linux/ashmem.h"
        "kernel/uapi/linux/aspeed-lpc-ctrl.h"
        "kernel/uapi/linux/atalk.h"
        "kernel/uapi/linux/atm.h"
        "kernel/uapi/linux/atm_eni.h"
        "kernel/uapi/linux/atm_he.h"
        "kernel/uapi/linux/atm_idt77105.h"
        "kernel/uapi/linux/atm_nicstar.h"
        "kernel/uapi/linux/atm_tcp.h"
        "kernel/uapi/linux/atm_zatm.h"
        "kernel/uapi/linux/atmapi.h"
        "kernel/uapi/linux/atmarp.h"
        "kernel/uapi/linux/atmbr2684.h"
        "kernel/uapi/linux/atmclip.h"
        "kernel/uapi/linux/atmdev.h"
        "kernel/uapi/linux/atmioc.h"
        "kernel/uapi/linux/atmlec.h"
        "kernel/uapi/linux/atmmpc.h"
        "kernel/uapi/linux/atmppp.h"
        "kernel/uapi/linux/atmsap.h"
        "kernel/uapi/linux/atmsvc.h"
        "kernel/uapi/linux/audit.h"
        "kernel/uapi/linux/auto_dev-ioctl.h"
        "kernel/uapi/linux/auto_fs.h"
        "kernel/uapi/linux/auto_fs4.h"
        "kernel/uapi/linux/auxvec.h"
        "kernel/uapi/linux/ax25.h"
        "kernel/uapi/linux/b1lli.h"
        "kernel/uapi/linux/batadv_packet.h"
        "kernel/uapi/linux/batman_adv.h"
        "kernel/uapi/linux/baycom.h"
        "kernel/uapi/linux/bcache.h"
        "kernel/uapi/linux/bcm933xx_hcs.h"
        "kernel/uapi/linux/bfs_fs.h"
        "kernel/uapi/linux/binfmts.h"
        "kernel/uapi/linux/blkpg.h"
        "kernel/uapi/linux/blktrace_api.h"
        "kernel/uapi/linux/blkzoned.h"
        "kernel/uapi/linux/bpf.h"
        "kernel/uapi/linux/bpf_common.h"
        "kernel/uapi/linux/bpf_perf_event.h"
        "kernel/uapi/linux/bpfilter.h"
        "kernel/uapi/linux/bpqether.h"
        "kernel/uapi/linux/bsg.h"
        "kernel/uapi/linux/bt-bmc.h"
        "kernel/uapi/linux/btf.h"
        "kernel/uapi/linux/btrfs.h"
        "kernel/uapi/linux/btrfs_tree.h"
        "kernel/uapi/linux/can.h"
        "kernel/uapi/linux/capability.h"
        "kernel/uapi/linux/capi.h"
        "kernel/uapi/linux/cciss_defs.h"
        "kernel/uapi/linux/cciss_ioctl.h"
        "kernel/uapi/linux/cdrom.h"
        "kernel/uapi/linux/cec-funcs.h"
        "kernel/uapi/linux/cec.h"
        "kernel/uapi/linux/cgroupstats.h"
        "kernel/uapi/linux/chio.h"
        "kernel/uapi/linux/cm4000_cs.h"
        "kernel/uapi/linux/cn_proc.h"
        "kernel/uapi/linux/coda.h"
        "kernel/uapi/linux/coda_psdev.h"
        "kernel/uapi/linux/coff.h"
        "kernel/uapi/linux/connector.h"
        "kernel/uapi/linux/const.h"
        "kernel/uapi/linux/coresight-stm.h"
        "kernel/uapi/linux/cramfs_fs.h"
        "kernel/uapi/linux/cryptouser.h"
        "kernel/uapi/linux/cuda.h"
        "kernel/uapi/linux/cyclades.h"
        "kernel/uapi/linux/cycx_cfm.h"
        "kernel/uapi/linux/dcbnl.h"
        "kernel/uapi/linux/dccp.h"
        "kernel/uapi/linux/devlink.h"
        "kernel/uapi/linux/dlm.h"
        "kernel/uapi/linux/dlm_device.h"
        "kernel/uapi/linux/dlm_netlink.h"
        "kernel/uapi/linux/dlm_plock.h"
        "kernel/uapi/linux/dlmconstants.h"
        "kernel/uapi/linux/dm-ioctl.h"
        "kernel/uapi/linux/dm-log-userspace.h"
        "kernel/uapi/linux/dma-buf.h"
        "kernel/uapi/linux/dn.h"
        "kernel/uapi/linux/dns_resolver.h"
        "kernel/uapi/linux/dqblk_xfs.h"
        "kernel/uapi/linux/edd.h"
        "kernel/uapi/linux/efs_fs_sb.h"
        "kernel/uapi/linux/elf-em.h"
        "kernel/uapi/linux/elf-fdpic.h"
        "kernel/uapi/linux/elf.h"
        "kernel/uapi/linux/elfcore.h"
        "kernel/uapi/linux/errno.h"
        "kernel/uapi/linux/errqueue.h"
        "kernel/uapi/linux/erspan.h"
        "kernel/uapi/linux/ethtool.h"
        "kernel/uapi/linux/eventpoll.h"
        "kernel/uapi/linux/fadvise.h"
        "kernel/uapi/linux/falloc.h"
        "kernel/uapi/linux/fanotify.h"
        "kernel/uapi/linux/fb.h"
        "kernel/uapi/linux/fcntl.h"
        "kernel/uapi/linux/fd.h"
        "kernel/uapi/linux/fdreg.h"
        "kernel/uapi/linux/fib_rules.h"
        "kernel/uapi/linux/fiemap.h"
        "kernel/uapi/linux/filter.h"
        "kernel/uapi/linux/firewire-cdev.h"
        "kernel/uapi/linux/firewire-constants.h"
        "kernel/uapi/linux/flat.h"
        "kernel/uapi/linux/fou.h"
        "kernel/uapi/linux/fpga-dfl.h"
        "kernel/uapi/linux/fs.h"
        "kernel/uapi/linux/fsi.h"
        "kernel/uapi/linux/fsl_hypervisor.h"
        "kernel/uapi/linux/fsmap.h"
        "kernel/uapi/linux/fuse.h"
        "kernel/uapi/linux/futex.h"
        "kernel/uapi/linux/gameport.h"
        "kernel/uapi/linux/gen_stats.h"
        "kernel/uapi/linux/genetlink.h"
        "kernel/uapi/linux/gfs2_ondisk.h"
        "kernel/uapi/linux/gigaset_dev.h"
        "kernel/uapi/linux/gpio.h"
        "kernel/uapi/linux/gsmmux.h"
        "kernel/uapi/linux/gtp.h"
        "kernel/uapi/linux/hash_info.h"
        "kernel/uapi/linux/hdlc.h"
        "kernel/uapi/linux/hdlcdrv.h"
        "kernel/uapi/linux/hdreg.h"
        "kernel/uapi/linux/hid.h"
        "kernel/uapi/linux/hiddev.h"
        "kernel/uapi/linux/hidraw.h"
        "kernel/uapi/linux/hpet.h"
        "kernel/uapi/linux/hsr_netlink.h"
        "kernel/uapi/linux/hw_breakpoint.h"
        "kernel/uapi/linux/hyperv.h"
        "kernel/uapi/linux/hysdn_if.h"
        "kernel/uapi/linux/i2c-dev.h"
        "kernel/uapi/linux/i2c.h"
        "kernel/uapi/linux/i2o-dev.h"
        "kernel/uapi/linux/i8k.h"
        "kernel/uapi/linux/icmp.h"
        "kernel/uapi/linux/icmpv6.h"
        "kernel/uapi/linux/if.h"
        "kernel/uapi/linux/if_addr.h"
        "kernel/uapi/linux/if_addrlabel.h"
        "kernel/uapi/linux/if_alg.h"
        "kernel/uapi/linux/if_arcnet.h"
        "kernel/uapi/linux/if_arp.h"
        "kernel/uapi/linux/if_bonding.h"
        "kernel/uapi/linux/if_bridge.h"
        "kernel/uapi/linux/if_cablemodem.h"
        "kernel/uapi/linux/if_eql.h"
        "kernel/uapi/linux/if_ether.h"
        "kernel/uapi/linux/if_fc.h"
        "kernel/uapi/linux/if_fddi.h"
        "kernel/uapi/linux/if_frad.h"
        "kernel/uapi/linux/if_hippi.h"
        "kernel/uapi/linux/if_infiniband.h"
        "kernel/uapi/linux/if_link.h"
        "kernel/uapi/linux/if_ltalk.h"
        "kernel/uapi/linux/if_macsec.h"
        "kernel/uapi/linux/if_packet.h"
        "kernel/uapi/linux/if_phonet.h"
        "kernel/uapi/linux/if_plip.h"
        "kernel/uapi/linux/if_ppp.h"
        "kernel/uapi/linux/if_pppol2tp.h"
        "kernel/uapi/linux/if_pppox.h"
        "kernel/uapi/linux/if_slip.h"
        "kernel/uapi/linux/if_team.h"
        "kernel/uapi/linux/if_tun.h"
        "kernel/uapi/linux/if_tunnel.h"
        "kernel/uapi/linux/if_vlan.h"
        "kernel/uapi/linux/if_x25.h"
        "kernel/uapi/linux/if_xdp.h"
        "kernel/uapi/linux/ife.h"
        "kernel/uapi/linux/igmp.h"
        "kernel/uapi/linux/ila.h"
        "kernel/uapi/linux/in.h"
        "kernel/uapi/linux/in6.h"
        "kernel/uapi/linux/in_route.h"
        "kernel/uapi/linux/inet_diag.h"
        "kernel/uapi/linux/inotify.h"
        "kernel/uapi/linux/input-event-codes.h"
        "kernel/uapi/linux/input.h"
        "kernel/uapi/linux/ioctl.h"
        "kernel/uapi/linux/ip.h"
        "kernel/uapi/linux/ip6_tunnel.h"
        "kernel/uapi/linux/ip_vs.h"
        "kernel/uapi/linux/ipc.h"
        "kernel/uapi/linux/ipmi.h"
        "kernel/uapi/linux/ipmi_bmc.h"
        "kernel/uapi/linux/ipmi_msgdefs.h"
        "kernel/uapi/linux/ipsec.h"
        "kernel/uapi/linux/ipv6.h"
        "kernel/uapi/linux/ipv6_route.h"
        "kernel/uapi/linux/ipx.h"
        "kernel/uapi/linux/irqnr.h"
        "kernel/uapi/linux/isdn.h"
        "kernel/uapi/linux/isdn_divertif.h"
        "kernel/uapi/linux/isdn_ppp.h"
        "kernel/uapi/linux/isdnif.h"
        "kernel/uapi/linux/iso_fs.h"
        "kernel/uapi/linux/ivtv.h"
        "kernel/uapi/linux/ivtvfb.h"
        "kernel/uapi/linux/jffs2.h"
        "kernel/uapi/linux/joystick.h"
        "kernel/uapi/linux/kcm.h"
        "kernel/uapi/linux/kcmp.h"
        "kernel/uapi/linux/kcov.h"
        "kernel/uapi/linux/kd.h"
        "kernel/uapi/linux/kdev_t.h"
        "kernel/uapi/linux/kernel-page-flags.h"
        "kernel/uapi/linux/kernel.h"
        "kernel/uapi/linux/kernelcapi.h"
        "kernel/uapi/linux/kexec.h"
        "kernel/uapi/linux/keyboard.h"
        "kernel/uapi/linux/keyctl.h"
        "kernel/uapi/linux/kfd_ioctl.h"
        "kernel/uapi/linux/kvm.h"
        "kernel/uapi/linux/kvm_para.h"
        "kernel/uapi/linux/l2tp.h"
        "kernel/uapi/linux/libc-compat.h"
        "kernel/uapi/linux/lightnvm.h"
        "kernel/uapi/linux/limits.h"
        "kernel/uapi/linux/lirc.h"
        "kernel/uapi/linux/llc.h"
        "kernel/uapi/linux/loop.h"
        "kernel/uapi/linux/lp.h"
        "kernel/uapi/linux/lwtunnel.h"
        "kernel/uapi/linux/magic.h"
        "kernel/uapi/linux/major.h"
        "kernel/uapi/linux/map_to_7segment.h"
        "kernel/uapi/linux/matroxfb.h"
        "kernel/uapi/linux/max2175.h"
        "kernel/uapi/linux/mdio.h"
        "kernel/uapi/linux/media-bus-format.h"
        "kernel/uapi/linux/media.h"
        "kernel/uapi/linux/mei.h"
        "kernel/uapi/linux/membarrier.h"
        "kernel/uapi/linux/memfd.h"
        "kernel/uapi/linux/mempolicy.h"
        "kernel/uapi/linux/meye.h"
        "kernel/uapi/linux/mic_common.h"
        "kernel/uapi/linux/mic_ioctl.h"
        "kernel/uapi/linux/mii.h"
        "kernel/uapi/linux/minix_fs.h"
        "kernel/uapi/linux/mman.h"
        "kernel/uapi/linux/mmtimer.h"
        "kernel/uapi/linux/module.h"
        "kernel/uapi/linux/mount.h"
        "kernel/uapi/linux/mpls.h"
        "kernel/uapi/linux/mpls_iptunnel.h"
        "kernel/uapi/linux/mqueue.h"
        "kernel/uapi/linux/mroute.h"
        "kernel/uapi/linux/mroute6.h"
        "kernel/uapi/linux/msdos_fs.h"
        "kernel/uapi/linux/msg.h"
        "kernel/uapi/linux/mtio.h"
        "kernel/uapi/linux/n_r3964.h"
        "kernel/uapi/linux/nbd-netlink.h"
        "kernel/uapi/linux/nbd.h"
        "kernel/uapi/linux/ncsi.h"
        "kernel/uapi/linux/ndctl.h"
        "kernel/uapi/linux/neighbour.h"
        "kernel/uapi/linux/net.h"
        "kernel/uapi/linux/net_dropmon.h"
        "kernel/uapi/linux/net_namespace.h"
        "kernel/uapi/linux/net_tstamp.h"
        "kernel/uapi/linux/netconf.h"
        "kernel/uapi/linux/netdevice.h"
        "kernel/uapi/linux/netfilter.h"
        "kernel/uapi/linux/netfilter_arp.h"
        "kernel/uapi/linux/netfilter_bridge.h"
        "kernel/uapi/linux/netfilter_decnet.h"
        "kernel/uapi/linux/netfilter_ipv4.h"
        "kernel/uapi/linux/netfilter_ipv6.h"
        "kernel/uapi/linux/netlink.h"
        "kernel/uapi/linux/netlink_diag.h"
        "kernel/uapi/linux/netrom.h"
        "kernel/uapi/linux/nfc.h"
        "kernel/uapi/linux/nfs.h"
        "kernel/uapi/linux/nfs2.h"
        "kernel/uapi/linux/nfs3.h"
        "kernel/uapi/linux/nfs4.h"
        "kernel/uapi/linux/nfs4_mount.h"
        "kernel/uapi/linux/nfs_fs.h"
        "kernel/uapi/linux/nfs_idmap.h"
        "kernel/uapi/linux/nfs_mount.h"
        "kernel/uapi/linux/nfsacl.h"
        "kernel/uapi/linux/nilfs2_api.h"
        "kernel/uapi/linux/nilfs2_ondisk.h"
        "kernel/uapi/linux/nl80211.h"
        "kernel/uapi/linux/nsfs.h"
        "kernel/uapi/linux/nubus.h"
        "kernel/uapi/linux/nvme_ioctl.h"
        "kernel/uapi/linux/nvram.h"
        "kernel/uapi/linux/omap3isp.h"
        "kernel/uapi/linux/omapfb.h"
        "kernel/uapi/linux/oom.h"
        "kernel/uapi/linux/openvswitch.h"
        "kernel/uapi/linux/packet_diag.h"
        "kernel/uapi/linux/param.h"
        "kernel/uapi/linux/parport.h"
        "kernel/uapi/linux/patchkey.h"
        "kernel/uapi/linux/pci.h"
        "kernel/uapi/linux/pci_regs.h"
        "kernel/uapi/linux/pcitest.h"
        "kernel/uapi/linux/perf_event.h"
        "kernel/uapi/linux/personality.h"
        "kernel/uapi/linux/pfkeyv2.h"
        "kernel/uapi/linux/pg.h"
        "kernel/uapi/linux/phantom.h"
        "kernel/uapi/linux/phonet.h"
        "kernel/uapi/linux/pkt_cls.h"
        "kernel/uapi/linux/pkt_sched.h"
        "kernel/uapi/linux/pktcdvd.h"
        "kernel/uapi/linux/pmu.h"
        "kernel/uapi/linux/poll.h"
        "kernel/uapi/linux/posix_acl.h"
        "kernel/uapi/linux/posix_acl_xattr.h"
        "kernel/uapi/linux/posix_types.h"
        "kernel/uapi/linux/ppdev.h"
        "kernel/uapi/linux/ppp-comp.h"
        "kernel/uapi/linux/ppp-ioctl.h"
        "kernel/uapi/linux/ppp_defs.h"
        "kernel/uapi/linux/pps.h"
        "kernel/uapi/linux/pr.h"
        "kernel/uapi/linux/prctl.h"
        "kernel/uapi/linux/psample.h"
        "kernel/uapi/linux/psci.h"
        "kernel/uapi/linux/psp-sev.h"
        "kernel/uapi/linux/ptp_clock.h"
        "kernel/uapi/linux/ptrace.h"
        "kernel/uapi/linux/qemu_fw_cfg.h"
        "kernel/uapi/linux/qnx4_fs.h"
        "kernel/uapi/linux/qnxtypes.h"
        "kernel/uapi/linux/qrtr.h"
        "kernel/uapi/linux/quota.h"
        "kernel/uapi/linux/radeonfb.h"
        "kernel/uapi/linux/random.h"
        "kernel/uapi/linux/raw.h"
        "kernel/uapi/linux/rds.h"
        "kernel/uapi/linux/reboot.h"
        "kernel/uapi/linux/reiserfs_fs.h"
        "kernel/uapi/linux/reiserfs_xattr.h"
        "kernel/uapi/linux/resource.h"
        "kernel/uapi/linux/rfkill.h"
        "kernel/uapi/linux/rio_cm_cdev.h"
        "kernel/uapi/linux/rio_mport_cdev.h"
        "kernel/uapi/linux/romfs_fs.h"
        "kernel/uapi/linux/rose.h"
        "kernel/uapi/linux/route.h"
        "kernel/uapi/linux/rpmsg.h"
        "kernel/uapi/linux/rseq.h"
        "kernel/uapi/linux/rtc.h"
        "kernel/uapi/linux/rtnetlink.h"
        "kernel/uapi/linux/rxrpc.h"
        "kernel/uapi/linux/scc.h"
        "kernel/uapi/linux/sched.h"
        "kernel/uapi/linux/scif_ioctl.h"
        "kernel/uapi/linux/screen_info.h"
        "kernel/uapi/linux/sctp.h"
        "kernel/uapi/linux/sdla.h"
        "kernel/uapi/linux/seccomp.h"
        "kernel/uapi/linux/securebits.h"
        "kernel/uapi/linux/sed-opal.h"
        "kernel/uapi/linux/seg6.h"
        "kernel/uapi/linux/seg6_genl.h"
        "kernel/uapi/linux/seg6_hmac.h"
        "kernel/uapi/linux/seg6_iptunnel.h"
        "kernel/uapi/linux/seg6_local.h"
        "kernel/uapi/linux/selinux_netlink.h"
        "kernel/uapi/linux/sem.h"
        "kernel/uapi/linux/serial.h"
        "kernel/uapi/linux/serial_core.h"
        "kernel/uapi/linux/serial_reg.h"
        "kernel/uapi/linux/serio.h"
        "kernel/uapi/linux/shm.h"
        "kernel/uapi/linux/signal.h"
        "kernel/uapi/linux/signalfd.h"
        "kernel/uapi/linux/smc.h"
        "kernel/uapi/linux/smc_diag.h"
        "kernel/uapi/linux/smiapp.h"
        "kernel/uapi/linux/snmp.h"
        "kernel/uapi/linux/sock_diag.h"
        "kernel/uapi/linux/socket.h"
        "kernel/uapi/linux/sockios.h"
        "kernel/uapi/linux/sonet.h"
        "kernel/uapi/linux/sonypi.h"
        "kernel/uapi/linux/sound.h"
        "kernel/uapi/linux/soundcard.h"
        "kernel/uapi/linux/stat.h"
        "kernel/uapi/linux/stddef.h"
        "kernel/uapi/linux/stm.h"
        "kernel/uapi/linux/string.h"
        "kernel/uapi/linux/suspend_ioctls.h"
        "kernel/uapi/linux/swab.h"
        "kernel/uapi/linux/switchtec_ioctl.h"
        "kernel/uapi/linux/sync_file.h"
        "kernel/uapi/linux/synclink.h"
        "kernel/uapi/linux/sysctl.h"
        "kernel/uapi/linux/sysinfo.h"
        "kernel/uapi/linux/target_core_user.h"
        "kernel/uapi/linux/taskstats.h"
        "kernel/uapi/linux/tcp.h"
        "kernel/uapi/linux/tcp_metrics.h"
        "kernel/uapi/linux/tee.h"
        "kernel/uapi/linux/termios.h"
        "kernel/uapi/linux/thermal.h"
        "kernel/uapi/linux/time.h"
        "kernel/uapi/linux/timerfd.h"
        "kernel/uapi/linux/times.h"
        "kernel/uapi/linux/timex.h"
        "kernel/uapi/linux/tiocl.h"
        "kernel/uapi/linux/tipc.h"
        "kernel/uapi/linux/tipc_config.h"
        "kernel/uapi/linux/tipc_netlink.h"
        "kernel/uapi/linux/tipc_sockets_diag.h"
        "kernel/uapi/linux/tls.h"
        "kernel/uapi/linux/toshiba.h"
        "kernel/uapi/linux/tty.h"
        "kernel/uapi/linux/tty_flags.h"
        "kernel/uapi/linux/types.h"
        "kernel/uapi/linux/udf_fs_i.h"
        "kernel/uapi/linux/udmabuf.h"
        "kernel/uapi/linux/udp.h"
        "kernel/uapi/linux/uhid.h"
        "kernel/uapi/linux/uinput.h"
        "kernel/uapi/linux/uio.h"
        "kernel/uapi/linux/uleds.h"
        "kernel/uapi/linux/ultrasound.h"
        "kernel/uapi/linux/un.h"
        "kernel/uapi/linux/unistd.h"
        "kernel/uapi/linux/unix_diag.h"
        "kernel/uapi/linux/usbdevice_fs.h"
        "kernel/uapi/linux/usbip.h"
        "kernel/uapi/linux/userfaultfd.h"
        "kernel/uapi/linux/userio.h"
        "kernel/uapi/linux/utime.h"
        "kernel/uapi/linux/utsname.h"
        "kernel/uapi/linux/uuid.h"
        "kernel/uapi/linux/uvcvideo.h"
        "kernel/uapi/linux/v4l2-common.h"
        "kernel/uapi/linux/v4l2-controls.h"
        "kernel/uapi/linux/v4l2-dv-timings.h"
        "kernel/uapi/linux/v4l2-mediabus.h"
        "kernel/uapi/linux/v4l2-subdev.h"
        "kernel/uapi/linux/vbox_err.h"
        "kernel/uapi/linux/vbox_vmmdev_types.h"
        "kernel/uapi/linux/vboxguest.h"
        "kernel/uapi/linux/version.h"
        "kernel/uapi/linux/veth.h"
        "kernel/uapi/linux/vfio.h"
        "kernel/uapi/linux/vfio_ccw.h"
        "kernel/uapi/linux/vhost.h"
        "kernel/uapi/linux/vhost_types.h"
        "kernel/uapi/linux/videodev2.h"
        "kernel/uapi/linux/virtio_9p.h"
        "kernel/uapi/linux/virtio_balloon.h"
        "kernel/uapi/linux/virtio_blk.h"
        "kernel/uapi/linux/virtio_config.h"
        "kernel/uapi/linux/virtio_console.h"
        "kernel/uapi/linux/virtio_crypto.h"
        "kernel/uapi/linux/virtio_gpu.h"
        "kernel/uapi/linux/virtio_ids.h"
        "kernel/uapi/linux/virtio_input.h"
        "kernel/uapi/linux/virtio_mmio.h"
        "kernel/uapi/linux/virtio_net.h"
        "kernel/uapi/linux/virtio_pci.h"
        "kernel/uapi/linux/virtio_ring.h"
        "kernel/uapi/linux/virtio_rng.h"
        "kernel/uapi/linux/virtio_scsi.h"
        "kernel/uapi/linux/virtio_types.h"
        "kernel/uapi/linux/virtio_vsock.h"
        "kernel/uapi/linux/vm_sockets.h"
        "kernel/uapi/linux/vm_sockets_diag.h"
        "kernel/uapi/linux/vmcore.h"
        "kernel/uapi/linux/vsoc_shm.h"
        "kernel/uapi/linux/vsockmon.h"
        "kernel/uapi/linux/vt.h"
        "kernel/uapi/linux/vtpm_proxy.h"
        "kernel/uapi/linux/wait.h"
        "kernel/uapi/linux/wanrouter.h"
        "kernel/uapi/linux/watchdog.h"
        "kernel/uapi/linux/wimax.h"
        "kernel/uapi/linux/wireless.h"
        "kernel/uapi/linux/wmi.h"
        "kernel/uapi/linux/x25.h"
        "kernel/uapi/linux/xattr.h"
        "kernel/uapi/linux/xfrm.h"
        "kernel/uapi/linux/xilinx-v4l2-controls.h"
        "kernel/uapi/linux/zorro.h"
        "kernel/uapi/linux/zorro_ids.h"
        "kernel/uapi/linux/android/binder.h"
        "kernel/uapi/linux/android/binderfs.h"
        "kernel/uapi/linux/byteorder/big_endian.h"
        "kernel/uapi/linux/byteorder/little_endian.h"
        "kernel/uapi/linux/caif/caif_socket.h"
        "kernel/uapi/linux/caif/if_caif.h"
        "kernel/uapi/linux/can/bcm.h"
        "kernel/uapi/linux/can/error.h"
        "kernel/uapi/linux/can/gw.h"
        "kernel/uapi/linux/can/netlink.h"
        "kernel/uapi/linux/can/raw.h"
        "kernel/uapi/linux/can/vxcan.h"
        "kernel/uapi/linux/cifs/cifs_mount.h"
        "kernel/uapi/linux/dvb/audio.h"
        "kernel/uapi/linux/dvb/ca.h"
        "kernel/uapi/linux/dvb/dmx.h"
        "kernel/uapi/linux/dvb/frontend.h"
        "kernel/uapi/linux/dvb/net.h"
        "kernel/uapi/linux/dvb/osd.h"
        "kernel/uapi/linux/dvb/version.h"
        "kernel/uapi/linux/dvb/video.h"
        "kernel/uapi/linux/genwqe/genwqe_card.h"
        "kernel/uapi/linux/hdlc/ioctl.h"
        "kernel/uapi/linux/hsi/cs-protocol.h"
        "kernel/uapi/linux/hsi/hsi_char.h"
        "kernel/uapi/linux/iio/events.h"
        "kernel/uapi/linux/iio/types.h"
        "kernel/uapi/linux/isdn/capicmd.h"
        "kernel/uapi/linux/mmc/ioctl.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_common.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_ftp.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_sctp.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_tcp.h"
        "kernel/uapi/linux/netfilter/nf_conntrack_tuple_common.h"
        "kernel/uapi/linux/netfilter/nf_log.h"
        "kernel/uapi/linux/netfilter/nf_nat.h"
        "kernel/uapi/linux/netfilter/nf_tables.h"
        "kernel/uapi/linux/netfilter/nf_tables_compat.h"
        "kernel/uapi/linux/netfilter/nfnetlink.h"
        "kernel/uapi/linux/netfilter/nfnetlink_acct.h"
        "kernel/uapi/linux/netfilter/nfnetlink_compat.h"
        "kernel/uapi/linux/netfilter/nfnetlink_conntrack.h"
        "kernel/uapi/linux/netfilter/nfnetlink_cthelper.h"
        "kernel/uapi/linux/netfilter/nfnetlink_cttimeout.h"
        "kernel/uapi/linux/netfilter/nfnetlink_log.h"
        "kernel/uapi/linux/netfilter/nfnetlink_osf.h"
        "kernel/uapi/linux/netfilter/nfnetlink_queue.h"
        "kernel/uapi/linux/netfilter/x_tables.h"
        "kernel/uapi/linux/netfilter/xt_AUDIT.h"
        "kernel/uapi/linux/netfilter/xt_CHECKSUM.h"
        "kernel/uapi/linux/netfilter/xt_CLASSIFY.h"
        "kernel/uapi/linux/netfilter/xt_CONNMARK.h"
        "kernel/uapi/linux/netfilter/xt_CONNSECMARK.h"
        "kernel/uapi/linux/netfilter/xt_CT.h"
        "kernel/uapi/linux/netfilter/xt_DSCP.h"
        "kernel/uapi/linux/netfilter/xt_HMARK.h"
        "kernel/uapi/linux/netfilter/xt_IDLETIMER.h"
        "kernel/uapi/linux/netfilter/xt_LED.h"
        "kernel/uapi/linux/netfilter/xt_LOG.h"
        "kernel/uapi/linux/netfilter/xt_MARK.h"
        "kernel/uapi/linux/netfilter/xt_NFLOG.h"
        "kernel/uapi/linux/netfilter/xt_NFQUEUE.h"
        "kernel/uapi/linux/netfilter/xt_RATEEST.h"
        "kernel/uapi/linux/netfilter/xt_SECMARK.h"
        "kernel/uapi/linux/netfilter/xt_SYNPROXY.h"
        "kernel/uapi/linux/netfilter/xt_TCPMSS.h"
        "kernel/uapi/linux/netfilter/xt_TCPOPTSTRIP.h"
        "kernel/uapi/linux/netfilter/xt_TEE.h"
        "kernel/uapi/linux/netfilter/xt_TPROXY.h"
        "kernel/uapi/linux/netfilter/xt_addrtype.h"
        "kernel/uapi/linux/netfilter/xt_bpf.h"
        "kernel/uapi/linux/netfilter/xt_cgroup.h"
        "kernel/uapi/linux/netfilter/xt_cluster.h"
        "kernel/uapi/linux/netfilter/xt_comment.h"
        "kernel/uapi/linux/netfilter/xt_connbytes.h"
        "kernel/uapi/linux/netfilter/xt_connlabel.h"
        "kernel/uapi/linux/netfilter/xt_connlimit.h"
        "kernel/uapi/linux/netfilter/xt_connmark.h"
        "kernel/uapi/linux/netfilter/xt_conntrack.h"
        "kernel/uapi/linux/netfilter/xt_cpu.h"
        "kernel/uapi/linux/netfilter/xt_dccp.h"
        "kernel/uapi/linux/netfilter/xt_devgroup.h"
        "kernel/uapi/linux/netfilter/xt_dscp.h"
        "kernel/uapi/linux/netfilter/xt_ecn.h"
        "kernel/uapi/linux/netfilter/xt_esp.h"
        "kernel/uapi/linux/netfilter/xt_hashlimit.h"
        "kernel/uapi/linux/netfilter/xt_helper.h"
        "kernel/uapi/linux/netfilter/xt_ipcomp.h"
        "kernel/uapi/linux/netfilter/xt_iprange.h"
        "kernel/uapi/linux/netfilter/xt_ipvs.h"
        "kernel/uapi/linux/netfilter/xt_l2tp.h"
        "kernel/uapi/linux/netfilter/xt_length.h"
        "kernel/uapi/linux/netfilter/xt_limit.h"
        "kernel/uapi/linux/netfilter/xt_mac.h"
        "kernel/uapi/linux/netfilter/xt_mark.h"
        "kernel/uapi/linux/netfilter/xt_multiport.h"
        "kernel/uapi/linux/netfilter/xt_nfacct.h"
        "kernel/uapi/linux/netfilter/xt_osf.h"
        "kernel/uapi/linux/netfilter/xt_owner.h"
        "kernel/uapi/linux/netfilter/xt_physdev.h"
        "kernel/uapi/linux/netfilter/xt_pkttype.h"
        "kernel/uapi/linux/netfilter/xt_policy.h"
        "kernel/uapi/linux/netfilter/xt_quota.h"
        "kernel/uapi/linux/netfilter/xt_rateest.h"
        "kernel/uapi/linux/netfilter/xt_realm.h"
        "kernel/uapi/linux/netfilter/xt_recent.h"
        "kernel/uapi/linux/netfilter/xt_rpfilter.h"
        "kernel/uapi/linux/netfilter/xt_sctp.h"
        "kernel/uapi/linux/netfilter/xt_set.h"
        "kernel/uapi/linux/netfilter/xt_socket.h"
        "kernel/uapi/linux/netfilter/xt_state.h"
        "kernel/uapi/linux/netfilter/xt_statistic.h"
        "kernel/uapi/linux/netfilter/xt_string.h"
        "kernel/uapi/linux/netfilter/xt_tcpmss.h"
        "kernel/uapi/linux/netfilter/xt_tcpudp.h"
        "kernel/uapi/linux/netfilter/xt_time.h"
        "kernel/uapi/linux/netfilter/xt_u32.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set_bitmap.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set_hash.h"
        "kernel/uapi/linux/netfilter/ipset/ip_set_list.h"
        "kernel/uapi/linux/netfilter_arp/arp_tables.h"
        "kernel/uapi/linux/netfilter_arp/arpt_mangle.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_802_3.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_among.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_arp.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_arpreply.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_ip.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_ip6.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_limit.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_log.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_mark_m.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_mark_t.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_nat.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_nflog.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_pkttype.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_redirect.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_stp.h"
        "kernel/uapi/linux/netfilter_bridge/ebt_vlan.h"
        "kernel/uapi/linux/netfilter_bridge/ebtables.h"
        "kernel/uapi/linux/netfilter_ipv4/ip_tables.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_CLUSTERIP.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ECN.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_LOG.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_REJECT.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_TTL.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ah.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ecn.h"
        "kernel/uapi/linux/netfilter_ipv4/ipt_ttl.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6_tables.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_HL.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_LOG.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_NPT.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_REJECT.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_ah.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_frag.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_hl.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_ipv6header.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_mh.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_opts.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_rt.h"
        "kernel/uapi/linux/netfilter_ipv6/ip6t_srh.h"
        "kernel/uapi/linux/nfsd/cld.h"
        "kernel/uapi/linux/nfsd/debug.h"
        "kernel/uapi/linux/nfsd/export.h"
        "kernel/uapi/linux/nfsd/nfsfh.h"
        "kernel/uapi/linux/nfsd/stats.h"
        "kernel/uapi/linux/raid/md_p.h"
        "kernel/uapi/linux/raid/md_u.h"
        "kernel/uapi/linux/sched/types.h"
        "kernel/uapi/linux/spi/spidev.h"
        "kernel/uapi/linux/sunrpc/debug.h"
        "kernel/uapi/linux/tc_act/tc_bpf.h"
        "kernel/uapi/linux/tc_act/tc_connmark.h"
        "kernel/uapi/linux/tc_act/tc_csum.h"
        "kernel/uapi/linux/tc_act/tc_defact.h"
        "kernel/uapi/linux/tc_act/tc_gact.h"
        "kernel/uapi/linux/tc_act/tc_ife.h"
        "kernel/uapi/linux/tc_act/tc_ipt.h"
        "kernel/uapi/linux/tc_act/tc_mirred.h"
        "kernel/uapi/linux/tc_act/tc_nat.h"
        "kernel/uapi/linux/tc_act/tc_pedit.h"
        "kernel/uapi/linux/tc_act/tc_sample.h"
        "kernel/uapi/linux/tc_act/tc_skbedit.h"
        "kernel/uapi/linux/tc_act/tc_skbmod.h"
        "kernel/uapi/linux/tc_act/tc_tunnel_key.h"
        "kernel/uapi/linux/tc_act/tc_vlan.h"
        "kernel/uapi/linux/tc_ematch/tc_em_cmp.h"
        "kernel/uapi/linux/tc_ematch/tc_em_ipt.h"
        "kernel/uapi/linux/tc_ematch/tc_em_meta.h"
        "kernel/uapi/linux/tc_ematch/tc_em_nbyte.h"
        "kernel/uapi/linux/tc_ematch/tc_em_text.h"
        "kernel/uapi/linux/usb/audio.h"
        "kernel/uapi/linux/usb/cdc-wdm.h"
        "kernel/uapi/linux/usb/cdc.h"
        "kernel/uapi/linux/usb/ch11.h"
        "kernel/uapi/linux/usb/ch9.h"
        "kernel/uapi/linux/usb/charger.h"
        "kernel/uapi/linux/usb/functionfs.h"
        "kernel/uapi/linux/usb/g_printer.h"
        "kernel/uapi/linux/usb/g_uvc.h"
        "kernel/uapi/linux/usb/gadgetfs.h"
        "kernel/uapi/linux/usb/midi.h"
        "kernel/uapi/linux/usb/tmc.h"
        "kernel/uapi/linux/usb/video.h"
        "kernel/uapi/linux/wimax/i2400m.h"
        "kernel/uapi/misc/cxl.h"
        "kernel/uapi/misc/ocxl.h"
        "kernel/uapi/mtd/inftl-user.h"
        "kernel/uapi/mtd/mtd-abi.h"
        "kernel/uapi/mtd/mtd-user.h"
        "kernel/uapi/mtd/nftl-user.h"
        "kernel/uapi/mtd/ubi-user.h"
        "kernel/uapi/rdma/bnxt_re-abi.h"
        "kernel/uapi/rdma/cxgb3-abi.h"
        "kernel/uapi/rdma/cxgb4-abi.h"
        "kernel/uapi/rdma/hns-abi.h"
        "kernel/uapi/rdma/i40iw-abi.h"
        "kernel/uapi/rdma/ib_user_cm.h"
        "kernel/uapi/rdma/ib_user_ioctl_cmds.h"
        "kernel/uapi/rdma/ib_user_ioctl_verbs.h"
        "kernel/uapi/rdma/ib_user_mad.h"
        "kernel/uapi/rdma/ib_user_sa.h"
        "kernel/uapi/rdma/ib_user_verbs.h"
        "kernel/uapi/rdma/mlx4-abi.h"
        "kernel/uapi/rdma/mlx5-abi.h"
        "kernel/uapi/rdma/mlx5_user_ioctl_cmds.h"
        "kernel/uapi/rdma/mlx5_user_ioctl_verbs.h"
        "kernel/uapi/rdma/mthca-abi.h"
        "kernel/uapi/rdma/nes-abi.h"
        "kernel/uapi/rdma/ocrdma-abi.h"
        "kernel/uapi/rdma/qedr-abi.h"
        "kernel/uapi/rdma/rdma_netlink.h"
        "kernel/uapi/rdma/rdma_user_cm.h"
        "kernel/uapi/rdma/rdma_user_ioctl.h"
        "kernel/uapi/rdma/rdma_user_ioctl_cmds.h"
        "kernel/uapi/rdma/rdma_user_rxe.h"
        "kernel/uapi/rdma/vmw_pvrdma-abi.h"
        "kernel/uapi/rdma/hfi/hfi1_ioctl.h"
        "kernel/uapi/rdma/hfi/hfi1_user.h"
        "kernel/uapi/scsi/cxlflash_ioctl.h"
        "kernel/uapi/scsi/scsi_bsg_fc.h"
        "kernel/uapi/scsi/scsi_bsg_ufs.h"
        "kernel/uapi/scsi/scsi_netlink.h"
        "kernel/uapi/scsi/scsi_netlink_fc.h"
        "kernel/uapi/scsi/fc/fc_els.h"
        "kernel/uapi/scsi/fc/fc_fs.h"
        "kernel/uapi/scsi/fc/fc_gs.h"
        "kernel/uapi/scsi/fc/fc_ns.h"
        "kernel/uapi/sound/asequencer.h"
        "kernel/uapi/sound/asoc.h"
        "kernel/uapi/sound/asound.h"
        "kernel/uapi/sound/asound_fm.h"
        "kernel/uapi/sound/compress_offload.h"
        "kernel/uapi/sound/compress_params.h"
        "kernel/uapi/sound/emu10k1.h"
        "kernel/uapi/sound/firewire.h"
        "kernel/uapi/sound/hdsp.h"
        "kernel/uapi/sound/hdspm.h"
        "kernel/uapi/sound/sb16_csp.h"
        "kernel/uapi/sound/sfnt_info.h"
        "kernel/uapi/sound/skl-tplg-interface.h"
        "kernel/uapi/sound/snd_sst_tokens.h"
        "kernel/uapi/sound/tlv.h"
        "kernel/uapi/sound/usb_stream.h"
        "kernel/uapi/video/edid.h"
        "kernel/uapi/video/sisfb.h"
        "kernel/uapi/video/uvesafb.h"
        "kernel/uapi/xen/evtchn.h"
        "kernel/uapi/xen/gntalloc.h"
        "kernel/uapi/xen/gntdev.h"
        "kernel/uapi/xen/privcmd.h"
    ];

    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

func_to_syscall_nrs = cc_genrule {
    name = "func_to_syscall_nrs";
    recovery_available = true;
    cmd = "$(location genfunctosyscallnrs) --out-dir=$(genDir) $(in)";

    tools = ["genfunctosyscallnrs"];

    srcs = [
        "SYSCALLS.TXT"
        ":libseccomp_gen_syscall_nrs_arm"
        ":libseccomp_gen_syscall_nrs_arm64"
        ":libseccomp_gen_syscall_nrs_mips"
        ":libseccomp_gen_syscall_nrs_mips64"
        ":libseccomp_gen_syscall_nrs_x86"
        ":libseccomp_gen_syscall_nrs_x86_64"
    ];

    out = [
        "func_to_syscall_nrs.h"
    ];
};

#  SECCOMP_BLACKLIST_APP_ZYGOTE.TXT = SECCOMP_BLACKLIST_APP.txt - setresgid*
generate_app_zygote_blacklist = genrule {
    name = "generate_app_zygote_blacklist";
    out = ["SECCOMP_BLACKLIST_APP_ZYGOTE.TXT"];
    srcs = ["SECCOMP_BLACKLIST_APP.TXT"];
    cmd = "grep -v '^int[ \t]*setresgid' $(in) > $(out)";
};

libseccomp_policy_app_zygote_sources = cc_genrule {
    name = "libseccomp_policy_app_zygote_sources";
    recovery_available = true;
    cmd = "$(location genseccomp) --out-dir=$(genDir) --name-modifier=app_zygote $(in)";

    tools = ["genseccomp"];

    srcs = [
        "SYSCALLS.TXT"
        "SECCOMP_WHITELIST_COMMON.TXT"
        "SECCOMP_WHITELIST_APP.TXT"
        "SECCOMP_BLACKLIST_COMMON.TXT"
        ":generate_app_zygote_blacklist"
        ":libseccomp_gen_syscall_nrs_arm"
        ":libseccomp_gen_syscall_nrs_arm64"
        ":libseccomp_gen_syscall_nrs_mips"
        ":libseccomp_gen_syscall_nrs_mips64"
        ":libseccomp_gen_syscall_nrs_x86"
        ":libseccomp_gen_syscall_nrs_x86_64"
    ];

    out = [
        "arm64_app_zygote_policy.cpp"
        "arm_app_zygote_policy.cpp"
        "mips64_app_zygote_policy.cpp"
        "mips_app_zygote_policy.cpp"
        "x86_64_app_zygote_policy.cpp"
        "x86_app_zygote_policy.cpp"
    ];
};

libseccomp_policy_app_sources = cc_genrule {
    name = "libseccomp_policy_app_sources";
    recovery_available = true;
    cmd = "$(location genseccomp) --out-dir=$(genDir) --name-modifier=app $(in)";

    tools = ["genseccomp"];

    srcs = [
        "SYSCALLS.TXT"
        "SECCOMP_WHITELIST_COMMON.TXT"
        "SECCOMP_WHITELIST_APP.TXT"
        "SECCOMP_BLACKLIST_COMMON.TXT"
        "SECCOMP_BLACKLIST_APP.TXT"
        ":libseccomp_gen_syscall_nrs_arm"
        ":libseccomp_gen_syscall_nrs_arm64"
        ":libseccomp_gen_syscall_nrs_mips"
        ":libseccomp_gen_syscall_nrs_mips64"
        ":libseccomp_gen_syscall_nrs_x86"
        ":libseccomp_gen_syscall_nrs_x86_64"
    ];

    out = [
        "arm64_app_policy.cpp"
        "arm_app_policy.cpp"
        "mips64_app_policy.cpp"
        "mips_app_policy.cpp"
        "x86_64_app_policy.cpp"
        "x86_app_policy.cpp"
    ];
};

libseccomp_policy_system_sources = cc_genrule {
    name = "libseccomp_policy_system_sources";
    recovery_available = true;
    cmd = "$(location genseccomp) --out-dir=$(genDir) --name-modifier=system $(in)";

    tools = ["genseccomp"];

    srcs = [
        "SYSCALLS.TXT"
        "SECCOMP_WHITELIST_COMMON.TXT"
        "SECCOMP_WHITELIST_SYSTEM.TXT"
        "SECCOMP_BLACKLIST_COMMON.TXT"
        ":libseccomp_gen_syscall_nrs_arm"
        ":libseccomp_gen_syscall_nrs_arm64"
        ":libseccomp_gen_syscall_nrs_mips"
        ":libseccomp_gen_syscall_nrs_mips64"
        ":libseccomp_gen_syscall_nrs_x86"
        ":libseccomp_gen_syscall_nrs_x86_64"
    ];

    out = [
        "arm64_system_policy.cpp"
        "arm_system_policy.cpp"
        "mips64_system_policy.cpp"
        "mips_system_policy.cpp"
        "x86_64_system_policy.cpp"
        "x86_system_policy.cpp"
    ];
};

libseccomp_policy_global_sources = cc_genrule {
    name = "libseccomp_policy_global_sources";
    recovery_available = true;
    cmd = "$(location genseccomp) --out-dir=$(genDir) --name-modifier=global $(in)";

    tools = ["genseccomp"];

    srcs = [
        "SYSCALLS.TXT"
        "SECCOMP_WHITELIST_COMMON.TXT"
        "SECCOMP_WHITELIST_SYSTEM.TXT"
        "SECCOMP_WHITELIST_APP.TXT"
        "SECCOMP_WHITELIST_GLOBAL.TXT"
        "SECCOMP_BLACKLIST_COMMON.TXT"
        ":libseccomp_gen_syscall_nrs_arm"
        ":libseccomp_gen_syscall_nrs_arm64"
        ":libseccomp_gen_syscall_nrs_mips"
        ":libseccomp_gen_syscall_nrs_mips64"
        ":libseccomp_gen_syscall_nrs_x86"
        ":libseccomp_gen_syscall_nrs_x86_64"
    ];

    out = [
        "arm64_global_policy.cpp"
        "arm_global_policy.cpp"
        "mips64_global_policy.cpp"
        "mips_global_policy.cpp"
        "x86_64_global_policy.cpp"
        "x86_global_policy.cpp"
    ];
};

libseccomp_policy = cc_library {
    name = "libseccomp_policy";
    recovery_available = true;
    generated_headers = ["func_to_syscall_nrs"];
    generated_sources = [
        "libseccomp_policy_app_sources"
        "libseccomp_policy_app_zygote_sources"
        "libseccomp_policy_global_sources"
        "libseccomp_policy_system_sources"
    ];

    srcs = [
        "seccomp/seccomp_policy.cpp"
    ];

    export_include_dirs = ["seccomp/include"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared = {
        shared_libs = ["libbase"];
    };
    static = {
        static_libs = ["libbase"];
    };
};

#  This is a temporary library that will use scudo as the native memory
#  allocator. To use it, add it as the first shared library.
libc_scudo = cc_library_shared {
    name = "libc_scudo";
    vendor_available = true;
    srcs = [
        "bionic/malloc_common.cpp"
        "bionic/malloc_common_dynamic.cpp"
        "bionic/malloc_heapprofd.cpp"
        "bionic/malloc_limit.cpp"
        "bionic/scudo_wrapper.cpp"
        "bionic/__set_errno.cpp"
    ];
    cflags = ["-DUSE_SCUDO"];
    stl = "none";
    system_shared_libs = [];

    header_libs = ["libc_headers"];

    static_libs = ["libasync_safe"];

    allow_undefined_symbols = true;
    shared_libs = ["libscudo_wrapper"];

    arch = {
        arm = {
            srcs = ["arch-arm/syscalls/__rt_sigprocmask.S"];
        };
        arm64 = {
            srcs = ["arch-arm64/syscalls/__rt_sigprocmask.S"];
        };
        x86 = {
            srcs = [
                "arch-x86/bionic/__libc_init_sysinfo.cpp"
                "arch-x86/syscalls/__rt_sigprocmask.S"
            ];
        };
        x86_64 = {
            srcs = ["arch-x86_64/syscalls/__rt_sigprocmask.S"];
        };
    };

    #  Mark this library as global so it overrides all the allocation
    #  definitions properly.
    ldflags = ["-Wl,-z,global"];
};

subdirs = [
    "bionic/scudo"
];

in { inherit "libc.arm.map" "libc.arm64.map" "libc.x86.map" "libc.x86_64.map" "libstdc++" "libstdc++.arm.map" "libstdc++.arm64.map" "libstdc++.x86.map" "libstdc++.x86_64.map" crt_defaults crt_so_defaults crtbegin_dynamic crtbegin_dynamic1 crtbegin_so crtbegin_so1 crtbegin_static crtbegin_static1 crtbrand crtend_android crtend_so func_to_syscall_nrs generate_app_zygote_blacklist generated_android_ids genfunctosyscallnrs genseccomp kernel_input_headers libc libc_aeabi libc_bionic libc_bionic_ndk libc_common libc_common_shared libc_common_static libc_defaults libc_dns libc_fortify libc_freebsd libc_freebsd_large_stack libc_gdtoa libc_headers libc_init_dynamic libc_init_static libc_malloc libc_ndk libc_netbsd libc_nomalloc libc_nopthread libc_openbsd libc_openbsd_large_stack libc_openbsd_ndk libc_pthread libc_scudo libc_sources_shared libc_sources_shared_arm libc_sources_static libc_sources_static_arm libc_stack_protector libc_syscalls libc_tzcode libseccomp_gen_syscall_nrs_arm libseccomp_gen_syscall_nrs_arm64 libseccomp_gen_syscall_nrs_defaults libseccomp_gen_syscall_nrs_mips libseccomp_gen_syscall_nrs_mips64 libseccomp_gen_syscall_nrs_x86 libseccomp_gen_syscall_nrs_x86_64 libseccomp_policy libseccomp_policy_app_sources libseccomp_policy_app_zygote_sources libseccomp_policy_global_sources libseccomp_policy_system_sources; }
