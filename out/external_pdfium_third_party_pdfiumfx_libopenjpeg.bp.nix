{ cc_library_static }:
let

libpdfiumfx_libopenjpeg = cc_library_static {
    name = "libpdfiumfx_libopenjpeg";
    defaults = ["pdfium-third-party"];

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
        "libopenjpeg20/t2.c"
        "libopenjpeg20/tcd.c"
        "libopenjpeg20/tgt.c"
        "libopenjpeg20/thread.c"
    ];
};

in { inherit libpdfiumfx_libopenjpeg; }
