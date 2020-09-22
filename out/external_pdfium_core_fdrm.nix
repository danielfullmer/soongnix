{ cc_library_static }:
let

libpdfium-fdrm = cc_library_static {
    name = "libpdfium-fdrm";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    static_libs = [
        "libpdfium-fxcrt"
    ];

    srcs = [
        "fx_crypt.cpp"
        "fx_crypt_aes.cpp"
        "fx_crypt_sha.cpp"
        "fx_crypt_unittest.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfium-fdrm; }
