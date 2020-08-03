{ cc_library_shared }:
let

libmpeg2extractor = cc_library_shared {

    srcs = [
        "ExtractorBundle.cpp"
        "MPEG2PSExtractor.cpp"
        "MPEG2TSExtractor.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/av/media/libstagefright/include"
    ];

    shared_libs = [
        "android.hardware.cas@1.0"
        "android.hardware.cas.native@1.0"
        "android.hidl.token@1.0-utils"
        "android.hidl.allocator@1.0"
        "libhidlmemory"
        "libhidlbase"
        "liblog"
        "libmediandk"
    ];

    header_libs = [
        "libbase_headers"
        "libstagefright_headers"
        "libmedia_headers"
    ];

    static_libs = [
        "libcrypto"
        "libstagefright_foundation_without_imemory"
        "libstagefright_mpeg2support"
        "libutils"
        "libstagefright_mpeg2extractor"
        "libstagefright_esds"
    ];

    name = "libmpeg2extractor";
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

in { inherit libmpeg2extractor; }
