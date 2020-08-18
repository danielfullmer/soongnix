{ cc_library_shared }:
let

libstagefright_soft_c2mpeg4dec = cc_library_shared {
    name = "libstagefright_soft_c2mpeg4dec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Dec.cpp"];

    static_libs = ["libstagefright_m4vh263dec"];

    cflags = [
        "-DOSCL_IMPORT_REF="
        "-DMPEG4"
    ];
};

libstagefright_soft_c2h263dec = cc_library_shared {
    name = "libstagefright_soft_c2h263dec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Dec.cpp"];

    static_libs = ["libstagefright_m4vh263dec"];

    cflags = [
        "-DOSCL_IMPORT_REF="
    ];
};

libstagefright_soft_c2mpeg4enc = cc_library_shared {
    name = "libstagefright_soft_c2mpeg4enc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Enc.cpp"];

    static_libs = ["libstagefright_m4vh263enc"];

    cflags = [
        "-DMPEG4"
        "-DOSCL_IMPORT_REF="
    ];
};

libstagefright_soft_c2h263enc = cc_library_shared {
    name = "libstagefright_soft_c2h263enc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Enc.cpp"];

    static_libs = ["libstagefright_m4vh263enc"];

    cflags = [
        "-DOSCL_IMPORT_REF="
    ];
};

in { inherit libstagefright_soft_c2h263dec libstagefright_soft_c2h263enc libstagefright_soft_c2mpeg4dec libstagefright_soft_c2mpeg4enc; }
