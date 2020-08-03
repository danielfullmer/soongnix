{ cc_library_shared }:
let

libstagefright_soft_opusdec = cc_library_shared {
    name = "libstagefright_soft_opusdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftOpus.cpp"];

    shared_libs = [
        "libopus"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libstagefright_soft_opusdec; }
