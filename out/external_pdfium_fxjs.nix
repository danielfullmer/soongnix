{ cc_library_static }:
let

libpdfium-fxjs = cc_library_static {
    name = "libpdfium-fxjs";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-fdrm"
        "libpdfium-page"
        "libpdfium-parser"
        "libpdfium-render"
        "libpdfium-fpdfdoc"
        "libpdfium-fxge"
    ];

    srcs = [
        "cjs_event_context_stub.cpp"
        "cjs_runtimestub.cpp"
        "ijs_runtime.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfium-fxjs; }
