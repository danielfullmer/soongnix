{ cc_library_shared }:
let

libflacextractor = cc_library_shared {

    srcs = ["FLACExtractor.cpp"];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
        "external/flac/include"
    ];

    shared_libs = [
        "libbinder_ndk"
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libaudioutils"
        "libFLAC"
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libutils"
    ];

    name = "libflacextractor";
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

in { inherit libflacextractor; }
