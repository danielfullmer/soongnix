{ cc_library_static }:
let

libpdfium-render = cc_library_static {
    name = "libpdfium-render";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-fxcodec"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
        "libpdfium-font"
        "libpdfium-page"
        "libpdfium-parser"
    ];

    exclude_srcs = [
        #  is_win
        "cpdf_windowsrenderdevice.cpp"
    ];

    srcs = [
        "cpdf_charposlist.cpp"
        "cpdf_devicebuffer.cpp"
        "cpdf_docrenderdata.cpp"
        "cpdf_docrenderdata_unittest.cpp"
        "cpdf_imagecacheentry.cpp"
        "cpdf_imageloader.cpp"
        "cpdf_imagerenderer.cpp"
        "cpdf_pagerendercache.cpp"
        "cpdf_pagerendercontext.cpp"
        "cpdf_progressiverenderer.cpp"
        "cpdf_rendercontext.cpp"
        "cpdf_renderoptions.cpp"
        "cpdf_rendershading.cpp"
        "cpdf_renderstatus.cpp"
        "cpdf_scaledrenderbuffer.cpp"
        "cpdf_textrenderer.cpp"
        "cpdf_type3cache.cpp"
        "cpdf_type3glyphmap.cpp"
        "cpdf_windowsrenderdevice.cpp"
        "fpdf_progressive_render_embeddertest.cpp"
        "fpdf_render_pattern_embeddertest.cpp"
    ];
};

in { inherit libpdfium-render; }
