{ cc_library_shared }:
let

libstagefright_soft_vpxenc = cc_library_shared {
    name = "libstagefright_soft_vpxenc";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = [
        "SoftVPXEncoder.cpp"
        "SoftVP8Encoder.cpp"
        "SoftVP9Encoder.cpp"
    ];

    cflags = ["-Wall"];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    shared_libs = ["libvpx"];
};

in { inherit libstagefright_soft_vpxenc; }
