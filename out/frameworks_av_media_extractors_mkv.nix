{ cc_library_shared }:
let

libmkvextractor = cc_library_shared {

    srcs = ["MatroskaExtractor.cpp"];

    include_dirs = [
        "external/flac/include"
        "external/libvpx/libwebm"
        "frameworks/av/media/libstagefright/flac/dec"
        "frameworks/av/media/libstagefright/include"
    ];

    shared_libs = [
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libstagefright_flacdec"
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libwebm"
        "libutils"
    ];

    name = "libmkvextractor";
    relative_install_path = "extractors";

    compile_multilib = "first";

    cflags = [
        "-Werror"
        "-Wall"
        "-fvisibility=hidden"
    ];
    version_script = "exports.lds";

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };

};

in { inherit libmkvextractor; }
