{ cc_library_shared }:
let

libstagefright_soft_vorbisdec = cc_library_shared {
    name = "libstagefright_soft_vorbisdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftVorbis.cpp"];

    shared_libs = [
        "libvorbisidec"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
    };
};

in { inherit libstagefright_soft_vorbisdec; }
