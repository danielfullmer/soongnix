{ cc_binary, cc_defaults, cc_library, cc_library_static }:
let

#  Set up common variables for usage across the libjpeg-turbo modules

libjpeg-defaults = cc_defaults {
    name = "libjpeg-defaults";
    cflags = [
        "-O3"
        "-fstrict-aliasing"

        "-Werror"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
    srcs = [
        "jaricom.c"
        "jcapimin.c"
        "jcapistd.c"
        "jcarith.c"
        "jccoefct.c"
        "jccolor.c"
        "jcdctmgr.c"
        "jchuff.c"
        "jcinit.c"
        "jcmainct.c"
        "jcmarker.c"
        "jcmaster.c"
        "jcomapi.c"
        "jcparam.c"
        "jcphuff.c"
        "jcprepct.c"
        "jcsample.c"
        "jctrans.c"
        "jdapimin.c"
        "jdapistd.c"
        "jdarith.c"
        "jdatadst.c"
        "jdatasrc.c"
        "jdcoefct.c"
        "jdcolor.c"
        "jddctmgr.c"
        "jdhuff.c"
        "jdinput.c"
        "jdmainct.c"
        "jdmarker.c"
        "jdmaster.c"
        "jdmerge.c"
        "jdphuff.c"
        "jdpostct.c"
        "jdsample.c"
        "jdtrans.c"
        "jerror.c"
        "jfdctflt.c"
        "jfdctfst.c"
        "jfdctint.c"
        "jidctflt.c"
        "jidctfst.c"
        "jidctint.c"
        "jidctred.c"
        "jmemmgr.c"
        "jmemnobs.c"
        "jquant1.c"
        "jquant2.c"
        "jutils.c"
    ];

    arch = {
        arm = {
            #  By default, the build system generates ARM target binaries in
            #  thumb mode, where each instruction is 16 bits wide.  Defining
            #  this variable as arm forces the build system to generate object
            #  files in 32-bit arm mode.  This is the same setting previously
            #  used by libjpeg and it provides a small performance benefit.
            instruction_set = "arm";
            #  ARM v7 NEON
            srcs = [
                "simd/arm/jsimd.c"
                "simd/arm/jsimd_neon.S"
            ];
        };
        arm64 = {
            #  ARM v8 64-bit NEON
            srcs = [
                "simd/arm64/jsimd.c"
                "simd/arm64/jsimd_neon.S"
            ];
        };
        x86 = {
            #  x86 MMX and SSE2
            srcs = [
                "simd/i386/jccolor-avx2.asm"
                "simd/i386/jccolor-mmx.asm"
                "simd/i386/jccolor-sse2.asm"
                "simd/i386/jcgray-avx2.asm"
                "simd/i386/jcgray-mmx.asm"
                "simd/i386/jcgray-sse2.asm"
                "simd/i386/jchuff-sse2.asm"
                "simd/i386/jcphuff-sse2.asm"
                "simd/i386/jcsample-avx2.asm"
                "simd/i386/jcsample-mmx.asm"
                "simd/i386/jcsample-sse2.asm"
                "simd/i386/jdcolor-avx2.asm"
                "simd/i386/jdcolor-mmx.asm"
                "simd/i386/jdcolor-sse2.asm"
                "simd/i386/jdmerge-avx2.asm"
                "simd/i386/jdmerge-mmx.asm"
                "simd/i386/jdmerge-sse2.asm"
                "simd/i386/jdsample-avx2.asm"
                "simd/i386/jdsample-mmx.asm"
                "simd/i386/jdsample-sse2.asm"
                "simd/i386/jfdctflt-3dn.asm"
                "simd/i386/jfdctflt-sse.asm"
                "simd/i386/jfdctfst-mmx.asm"
                "simd/i386/jfdctfst-sse2.asm"
                "simd/i386/jfdctint-avx2.asm"
                "simd/i386/jfdctint-mmx.asm"
                "simd/i386/jfdctint-sse2.asm"
                "simd/i386/jidctflt-3dn.asm"
                "simd/i386/jidctflt-sse.asm"
                "simd/i386/jidctflt-sse2.asm"
                "simd/i386/jidctfst-mmx.asm"
                "simd/i386/jidctfst-sse2.asm"
                "simd/i386/jidctint-avx2.asm"
                "simd/i386/jidctint-mmx.asm"
                "simd/i386/jidctint-sse2.asm"
                "simd/i386/jidctred-mmx.asm"
                "simd/i386/jidctred-sse2.asm"
                "simd/i386/jquant-3dn.asm"
                "simd/i386/jquant-mmx.asm"
                "simd/i386/jquant-sse.asm"
                "simd/i386/jquantf-sse2.asm"
                "simd/i386/jquanti-avx2.asm"
                "simd/i386/jquanti-sse2.asm"
                "simd/i386/jsimd.c"
                "simd/i386/jsimdcpu.asm"
            ];
            asflags = [
                "-DPIC"
            ];
            local_include_dirs = [
                "simd"
                "simd/nasm"
            ];
        };
        x86_64 = {
            #  x86-64 SSE2
            srcs = [
                "simd/x86_64/jccolor-avx2.asm"
                "simd/x86_64/jccolor-sse2.asm"
                "simd/x86_64/jcgray-avx2.asm"
                "simd/x86_64/jcgray-sse2.asm"
                "simd/x86_64/jchuff-sse2.asm"
                "simd/x86_64/jcphuff-sse2.asm"
                "simd/x86_64/jcsample-avx2.asm"
                "simd/x86_64/jcsample-sse2.asm"
                "simd/x86_64/jdcolor-avx2.asm"
                "simd/x86_64/jdcolor-sse2.asm"
                "simd/x86_64/jdmerge-avx2.asm"
                "simd/x86_64/jdmerge-sse2.asm"
                "simd/x86_64/jdsample-avx2.asm"
                "simd/x86_64/jdsample-sse2.asm"
                "simd/x86_64/jfdctflt-sse.asm"
                "simd/x86_64/jfdctfst-sse2.asm"
                "simd/x86_64/jfdctint-avx2.asm"
                "simd/x86_64/jfdctint-sse2.asm"
                "simd/x86_64/jidctflt-sse2.asm"
                "simd/x86_64/jidctfst-sse2.asm"
                "simd/x86_64/jidctint-avx2.asm"
                "simd/x86_64/jidctint-sse2.asm"
                "simd/x86_64/jidctred-sse2.asm"
                "simd/x86_64/jquantf-sse2.asm"
                "simd/x86_64/jquanti-avx2.asm"
                "simd/x86_64/jquanti-sse2.asm"
                "simd/x86_64/jsimd.c"
                "simd/x86_64/jsimdcpu.asm"
            ];
            asflags = [
                "-DPIC"
                "-D__x86_64__"
            ];
            local_include_dirs = [
                "simd"
                "simd/nasm"
            ];
        };
        mips = {
            srcs = ["jsimd_none.c"];
        };
        mips64 = {
            srcs = ["jsimd_none.c"];
        };
    };

    target = {
        linux = {
            asflags = [
                "-DELF"
            ];
        };
        darwin = {
            asflags = [
                "-DMACHO"
            ];
        };
        windows_x86 = {
            asflags = [
                "-DWIN32"
            ];
        };
        windows_x86_64 = {
            asflags = [
                "-DWIN64"
            ];
        };
    };
};

#  Also build as a shared library.
libjpeg = cc_library {
    name = "libjpeg";
    host_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    defaults = ["libjpeg-defaults"];
    export_include_dirs = ["."];
    target = {
        windows = {
            enabled = true;
        };
    };
};

#  Build static library against the NDK
libjpeg_static_ndk = cc_library_static {
    name = "libjpeg_static_ndk";
    defaults = ["libjpeg-defaults"];
    export_include_dirs = ["."];
    sdk_version = "17";
};

#  Definition for TJBench
tjbench = cc_binary {
    name = "tjbench";

    whole_static_libs = ["libjpeg"];

    multilib = {
        lib32 = {
            stem = "tj32";
        };
        lib64 = {
            stem = "tj64";
        };
    };

    compile_multilib = "both";

    cflags = [
        "-DBMP_SUPPORTED"
        "-DPPM_SUPPORTED"
        "-Werror"
        "-Wno-unused-parameter"
    ];

    srcs = [
        "jdatadst-tj.c"
        "jdatasrc-tj.c"
        "rdbmp.c"
        "rdppm.c"
        "tjbench.c"
        "tjutil.c"
        "transupp.c"
        "turbojpeg.c"
        "wrbmp.c"
        "wrppm.c"
    ];
};

in { inherit libjpeg libjpeg-defaults libjpeg_static_ndk tjbench; }
