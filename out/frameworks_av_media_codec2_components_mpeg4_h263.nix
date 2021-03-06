{ cc_library_shared }:
let

libcodec2_soft_mpeg4dec = cc_library_shared {
    name = "libcodec2_soft_mpeg4dec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Dec.cpp"];

    static_libs = ["libstagefright_m4vh263dec"];

    cflags = [
        "-DOSCL_IMPORT_REF="
        "-DMPEG4"
    ];
};

libcodec2_soft_h263dec = cc_library_shared {
    name = "libcodec2_soft_h263dec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Dec.cpp"];

    static_libs = ["libstagefright_m4vh263dec"];

    cflags = [
        "-DOSCL_IMPORT_REF="
    ];
};

libcodec2_soft_mpeg4enc = cc_library_shared {
    name = "libcodec2_soft_mpeg4enc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Enc.cpp"];

    static_libs = ["libstagefright_m4vh263enc"];

    cflags = [
        "-DMPEG4"
        "-DOSCL_IMPORT_REF="
    ];
};

libcodec2_soft_h263enc = cc_library_shared {
    name = "libcodec2_soft_h263enc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg4Enc.cpp"];

    static_libs = ["libstagefright_m4vh263enc"];

    cflags = [
        "-DOSCL_IMPORT_REF="
    ];
};

in { inherit libcodec2_soft_h263dec libcodec2_soft_h263enc libcodec2_soft_mpeg4dec libcodec2_soft_mpeg4enc; }
