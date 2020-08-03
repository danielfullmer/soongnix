{ cc_library_shared }:
let

libstagefright_soft_avcenc = cc_library_shared {
    name = "libstagefright_soft_avcenc";
    defaults = ["libstagefright_softomx-defaults"];

    static_libs = ["libavcenc"];
    srcs = ["SoftAVCEnc.cpp"];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    cflags = [
        "-Wall"
        "-Wno-unused-variable"
    ];
    ldflags = ["-Wl,-Bsymbolic"];

    version_script = "exports.lds";
};

in { inherit libstagefright_soft_avcenc; }
