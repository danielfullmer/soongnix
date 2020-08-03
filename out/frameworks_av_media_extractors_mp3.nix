{ cc_library_shared }:
let

libmp3extractor = cc_library_shared {

    srcs = [
        "MP3Extractor.cpp"
        "VBRISeeker.cpp"
        "XINGSeeker.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
    ];

    shared_libs = [
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libutils"
        "libstagefright_id3"
        "libstagefright_foundation"
    ];

    name = "libmp3extractor";
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

in { inherit libmp3extractor; }
