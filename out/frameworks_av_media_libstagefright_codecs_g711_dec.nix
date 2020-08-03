{ cc_library_shared }:
let

libstagefright_soft_g711dec = cc_library_shared {
    name = "libstagefright_soft_g711dec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftG711.cpp"];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libstagefright_soft_g711dec; }
