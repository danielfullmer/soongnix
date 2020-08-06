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
        "tzcode/**/*.c"
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
        "dns/**/*.c"

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
        "kernel/uapi/**/*.h"
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
        "kernel/uapi/**/*.h"
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
