{ cc_library_static }:
let

libpdfium-edit = cc_library_static {
    name = "libpdfium-edit";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-fxcrt"
        "libpdfium-font"
        "libpdfium-page"
        "libpdfium-parser"
        "libpdfium-skia_shared"
    ];

    srcs = [
        "cpdf_contentstream_write_utils.cpp"
        "cpdf_creator.cpp"
        "cpdf_creator_embeddertest.cpp"
        "cpdf_pagecontentgenerator.cpp"
        "cpdf_pagecontentgenerator_unittest.cpp"
        "cpdf_pagecontentmanager.cpp"
        "cpdf_stringarchivestream.cpp"
    ];
};

in { inherit libpdfium-edit; }
