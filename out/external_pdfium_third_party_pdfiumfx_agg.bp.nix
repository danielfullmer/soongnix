{ cc_library_static }:
let

libpdfiumfx_agg = cc_library_static {
    name = "libpdfiumfx_agg";
    defaults = ["pdfium-third-party"];

    cflags = [
        "-Wno-unused-function"
    ];

    static_libs = [
        "libpdfiumfxcrt"
    ];

    srcs = [
        "agg23/agg_curves.cpp"
        "agg23/agg_path_storage.cpp"
        "agg23/agg_rasterizer_scanline_aa.cpp"
        "agg23/agg_vcgen_dash.cpp"
        "agg23/agg_vcgen_stroke.cpp"
    ];
};

in { inherit libpdfiumfx_agg; }
