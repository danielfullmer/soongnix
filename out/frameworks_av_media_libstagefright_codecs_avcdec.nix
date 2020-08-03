{ cc_library_shared }:
let

libstagefright_soft_avcdec = cc_library_shared {
    name = "libstagefright_soft_avcdec";
    defaults = ["libstagefright_softomx-defaults"];

    static_libs = ["libavcdec"];
    srcs = ["SoftAVCDec.cpp"];

    cflags = [
        "-Wall"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    ldflags = ["-Wl,-Bsymbolic"];
};

in { inherit libstagefright_soft_avcdec; }
