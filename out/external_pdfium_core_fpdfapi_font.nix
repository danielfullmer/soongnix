{ cc_library_static }:
let

libpdfium-font = cc_library_static {
    name = "libpdfium-font";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    static_libs = [
        "libpdfium-fxcrt"
        "libpdfium-fxge"
        "libpdfium-cmaps"
        "libpdfium-parser"
    ];

    srcs = [
        "cfx_cttgsubtable.cpp"
        "cfx_stockfontarray.cpp"
        "cpdf_cid2unicodemap.cpp"
        "cpdf_cidfont.cpp"
        "cpdf_cidfont_unittest.cpp"
        "cpdf_cmap.cpp"
        "cpdf_cmapmanager.cpp"
        "cpdf_cmapparser.cpp"
        "cpdf_cmapparser_unittest.cpp"
        "cpdf_font.cpp"
        "cpdf_fontencoding.cpp"
        "cpdf_fontglobals.cpp"
        "cpdf_simplefont.cpp"
        "cpdf_tounicodemap.cpp"
        "cpdf_tounicodemap_unittest.cpp"
        "cpdf_truetypefont.cpp"
        "cpdf_type1font.cpp"
        "cpdf_type3char.cpp"
        "cpdf_type3font.cpp"
    ];
};

in { inherit libpdfium-font; }
