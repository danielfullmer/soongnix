{ cc_library_static }:
let

libpdfium-fpdftext = cc_library_static {
    name = "libpdfium-fpdftext";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    static_libs = [
        "libpdfium-font"
        "libpdfium-page"
        "libpdfium-parser"
        "libpdfium-fxcrt"
    ];

    srcs = [
        "cpdf_linkextract.cpp"
        "cpdf_linkextract_unittest.cpp"
        "cpdf_textpage.cpp"
        "cpdf_textpagefind.cpp"
        "unicodenormalizationdata.cpp"
    ];
};

in { inherit libpdfium-fpdftext; }
