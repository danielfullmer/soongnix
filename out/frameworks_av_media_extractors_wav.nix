{ cc_library_shared }:
let

libwavextractor = cc_library_shared {

    srcs = ["WAVExtractor.cpp"];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
    ];

    shared_libs = [
        "libbinder_ndk"
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libaudioutils"
        "libfifo"
        "libstagefright_foundation"
    ];

    name = "libwavextractor";
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

in { inherit libwavextractor; }
