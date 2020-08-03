{ cc_library_shared }:
let

libstagefright_soft_gsmdec = cc_library_shared {
    name = "libstagefright_soft_gsmdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftGSM.cpp"];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    static_libs = ["libgsm"];
};

in { inherit libstagefright_soft_gsmdec; }
