{ cc_library_static }:
let

libpdfiumfdrm = cc_library_static {
    name = "libpdfiumfdrm";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumfxcrt"
    ];

    srcs = [
        "core/fdrm/crypto/fx_crypt.cpp"
        "core/fdrm/crypto/fx_crypt_aes.cpp"
        "core/fdrm/crypto/fx_crypt_sha.cpp"
    ];
};

in { inherit libpdfiumfdrm; }
