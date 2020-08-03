{ cc_library_shared }:
let

libaacextractor = cc_library_shared {

    srcs = ["AACExtractor.cpp"];

    include_dirs = [
        "frameworks/av/media/libstagefright/"
    ];

    shared_libs = [
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libutils"
    ];

    name = "libaacextractor";
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

in { inherit libaacextractor; }
