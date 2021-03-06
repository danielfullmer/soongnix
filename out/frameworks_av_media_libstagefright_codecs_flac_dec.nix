{ cc_library_shared }:
let

libstagefright_soft_flacdec = cc_library_shared {
    name = "libstagefright_soft_flacdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = [
        "SoftFlacDecoder.cpp"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    shared_libs = [
        "libstagefright_flacdec"
    ];
};

in { inherit libstagefright_soft_flacdec; }
