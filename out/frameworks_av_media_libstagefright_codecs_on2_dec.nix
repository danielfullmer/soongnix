{ cc_library_shared }:
let

libstagefright_soft_vpxdec = cc_library_shared {
    name = "libstagefright_soft_vpxdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftVPX.cpp"];

    shared_libs = ["libvpx"];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libstagefright_soft_vpxdec; }
