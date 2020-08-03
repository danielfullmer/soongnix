{ cc_library_shared }:
let

libmidiextractor = cc_library_shared {

    srcs = ["MidiExtractor.cpp"];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
    ];

    shared_libs = [
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libmedia_midiiowrapper"
        "libsonivox"
        "libstagefright_foundation"
        "libwatchdog"
        "libbase"
    ];
    name = "libmidiextractor";
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

in { inherit libmidiextractor; }
