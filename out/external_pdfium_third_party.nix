{ cc_defaults, cc_library_static }:
let

pdfium-third-party = cc_defaults {
    name = "pdfium-third-party";
    defaults = [
        "pdfium-common"
    ];
    visibility = ["//external/pdfium:__subpackages__"];
};

libpdfium-third_party-base = cc_library_static {
    name = "libpdfium-third_party-base";
    defaults = ["pdfium-third-party"];
    visibility = ["//external/pdfium:__subpackages__"];

    arch = {
        arm = {
            cflags = [
                "-DARCH_CPU_32_BITS"
                "-DARCH_CPU_ARMEL"
            ];
        };
        arm64 = {
            cflags = [
                "-DARCH_CPU_64_BITS"
                "-DARCH_CPU_ARM64"
            ];
        };
        x86 = {
            cflags = [
                "-DARCH_CPU_32_BITS"
                "-DARCH_CPU_X86"
            ];
        };
        x86_64 = {
            cflags = [
                "-DARCH_CPU_64_BITS"
                "-DARCH_CPU_X86_64"
            ];
        };
    };

    srcs = [
        "base/debug/alias.cc"
        "base/allocator/partition_allocator/address_space_randomization.cc"
        "base/allocator/partition_allocator/oom_callback.cc"
        "base/allocator/partition_allocator/page_allocator.cc"
        "base/allocator/partition_allocator/partition_alloc.cc"
        "base/allocator/partition_allocator/partition_bucket.cc"
        "base/allocator/partition_allocator/partition_oom.cc"
        "base/allocator/partition_allocator/partition_page.cc"
        "base/allocator/partition_allocator/partition_root_base.cc"
        "base/allocator/partition_allocator/random.cc"
        "base/allocator/partition_allocator/spin_lock.cc"
    ];
};

libpdfium-lcms2 = cc_library_static {
    name = "libpdfium-lcms2";
    defaults = ["pdfium-third-party"];

    cflags = [
        #  cmslut.cc is sloppy with aggregate initialization. Version 2.7 of this
        #  library doesn't appear to have this problem.
        "-Wno-missing-braces"

        #  FindPrev() in cmsplugin.c is unused.
        "-Wno-unused-function"
    ];

    srcs = [
        "lcms/src/cmsalpha.c"
        "lcms/src/cmscam02.c"
        "lcms/src/cmscgats.c"
        "lcms/src/cmscnvrt.c"
        "lcms/src/cmserr.c"
        "lcms/src/cmsgamma.c"
        "lcms/src/cmsgmt.c"
        "lcms/src/cmshalf.c"
        "lcms/src/cmsintrp.c"
        "lcms/src/cmsio0.c"
        "lcms/src/cmsio1.c"
        "lcms/src/cmslut.c"
        "lcms/src/cmsmd5.c"
        "lcms/src/cmsmtrx.c"
        "lcms/src/cmsnamed.c"
        "lcms/src/cmsopt.c"
        "lcms/src/cmspack.c"
        "lcms/src/cmspcs.c"
        "lcms/src/cmsplugin.c"
        "lcms/src/cmsps2.c"
        "lcms/src/cmssamp.c"
        "lcms/src/cmssm.c"
        "lcms/src/cmstypes.c"
        "lcms/src/cmsvirt.c"
        "lcms/src/cmswtpnt.c"
        "lcms/src/cmsxform.c"
    ];
};

libpdfium-libopenjpeg2 = cc_library_static {
    name = "libpdfium-libopenjpeg2";
    defaults = ["pdfium-third-party"];

    exclude_srcs = [
        "libopenjpeg20/t1_generate_luts.c"
    ];

    srcs = [
        "libopenjpeg20/bio.c"
        "libopenjpeg20/cio.c"
        "libopenjpeg20/dwt.c"
        "libopenjpeg20/event.c"
        "libopenjpeg20/function_list.c"
        "libopenjpeg20/image.c"
        "libopenjpeg20/invert.c"
        "libopenjpeg20/j2k.c"
        "libopenjpeg20/jp2.c"
        "libopenjpeg20/mct.c"
        "libopenjpeg20/mqc.c"
        "libopenjpeg20/openjpeg.c"
        "libopenjpeg20/opj_clock.c"
        "libopenjpeg20/pi.c"
        "libopenjpeg20/sparse_array.c"
        "libopenjpeg20/t1.c"
        "libopenjpeg20/t1_generate_luts.c"
        "libopenjpeg20/t2.c"
        "libopenjpeg20/tcd.c"
        "libopenjpeg20/tgt.c"
        "libopenjpeg20/thread.c"
    ];
};

libpdfium-agg = cc_library_static {
    name = "libpdfium-agg";
    defaults = ["pdfium-third-party"];

    cflags = [
        #  calc_butt_cap() in agg_vcgen_stroke.cpp is unused.
        "-Wno-unused-function"
    ];

    srcs = [
        "agg23/agg_curves.cpp"
        "agg23/agg_path_storage.cpp"
        "agg23/agg_rasterizer_scanline_aa.cpp"
        "agg23/agg_vcgen_dash.cpp"
        "agg23/agg_vcgen_stroke.cpp"
    ];
};

libpdfium-skia_shared = cc_library_static {
    name = "libpdfium-skia_shared";
    defaults = ["pdfium-third-party"];

    srcs = [
        "skia_shared/SkFloatToDecimal.cpp"
    ];
};

in { inherit libpdfium-agg libpdfium-lcms2 libpdfium-libopenjpeg2 libpdfium-skia_shared libpdfium-third_party-base pdfium-third-party; }
