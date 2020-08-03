{ cc_defaults, cc_library_shared, cc_library_static }:
let

libmp4extractor_defaults = cc_defaults {
    name = "libmp4extractor_defaults";

    srcs = [
        "AC4Parser.cpp"
        "ItemTable.cpp"
        "MPEG4Extractor.cpp"
        "SampleIterator.cpp"
        "SampleTable.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright/"
    ];

    shared_libs = [
        "liblog"
        "libmediandk"
    ];

    static_libs = [
        "libstagefright_esds"
        "libstagefright_foundation"
        "libstagefright_id3"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-fvisibility=hidden"
    ];
    version_script = "exports.lds";
    relative_install_path = "extractors";
    compile_multilib = "first";
};

libmp4extractor = cc_library_shared {

    name = "libmp4extractor";
    defaults = ["libmp4extractor_defaults"];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };

};

libmp4extractor_fuzzing = cc_library_static {
    name = "libmp4extractor_fuzzing";

    defaults = ["libmp4extractor_defaults"];
};

in { inherit libmp4extractor libmp4extractor_defaults libmp4extractor_fuzzing; }
