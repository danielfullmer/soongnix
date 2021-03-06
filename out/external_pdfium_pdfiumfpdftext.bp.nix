{ cc_library_static }:
let

libpdfiumfpdftext = cc_library_static {
    name = "libpdfiumfpdftext";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumfxcrt"
    ];

    srcs = [
        "core/fpdftext/cpdf_linkextract.cpp"
        "core/fpdftext/cpdf_textpage.cpp"
        "core/fpdftext/cpdf_textpagefind.cpp"
        "core/fpdftext/unicodenormalizationdata.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfiumfpdftext; }
