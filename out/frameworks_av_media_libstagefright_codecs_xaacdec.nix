{ cc_library_shared }:
let

libstagefright_soft_xaacdec = cc_library_shared {
    name = "libstagefright_soft_xaacdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = [
        "SoftXAAC.cpp"
    ];

    cflags = [
        "-DENABLE_MPEG_D_DRC"
    ];

    sanitize = {
        #  integer_overflow: true,
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    static_libs = ["libxaacdec"];

    shared_libs = [
        "libcutils"
    ];
};

in { inherit libstagefright_soft_xaacdec; }
