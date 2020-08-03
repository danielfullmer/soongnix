{ cc_library_shared }:
let

liboggextractor = cc_library_shared {

    srcs = ["OggExtractor.cpp"];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
        "external/tremolo"
    ];

    header_libs = [
        "libaudio_system_headers"
    ];

    shared_libs = [
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libutils"
        "libvorbisidec"
    ];

    name = "liboggextractor";
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

in { inherit liboggextractor; }
