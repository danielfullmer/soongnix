{ cc_library_shared }:
let

libstagefright_soft_flacenc = cc_library_shared {
    name = "libstagefright_soft_flacenc";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftFlacEncoder.cpp"];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    header_libs = ["libbase_headers"];
    static_libs = [
        "libaudioutils"
        "libFLAC"
    ];
};

in { inherit libstagefright_soft_flacenc; }
