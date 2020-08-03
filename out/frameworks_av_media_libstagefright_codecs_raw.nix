{ cc_library_shared }:
let

libstagefright_soft_rawdec = cc_library_shared {
    name = "libstagefright_soft_rawdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftRaw.cpp"];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libstagefright_soft_rawdec; }
