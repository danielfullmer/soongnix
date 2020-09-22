{ cc_library }:
let

libmpeg2extractor = cc_library {
    name = "libmpeg2extractor";

    defaults = ["extractor-defaults"];

    srcs = [
        "ExtractorBundle.cpp"
        "MPEG2PSExtractor.cpp"
        "MPEG2TSExtractor.cpp"
    ];

    shared_libs = [
        "libbase"
        "libcgrouprc#29"
        "libvndksupport#29"
    ];

    header_libs = [
        "libaudioclient_headers"
        "libbase_headers"
        "libstagefright_headers"
        "libmedia_headers"
    ];

    static_libs = [
        "android.hardware.cas@1.0"
        "android.hardware.cas.native@1.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "android.hidl.token@1.0"
        "android.hidl.token@1.0-utils"
        "libcutils"
        "libhidlbase"
        "libhidlmemory"
        "libjsoncpp"
        "libprocessgroup"
        "libstagefright_esds"
        "libstagefright_foundation_without_imemory"
        "libstagefright_mpeg2extractor"
        "libstagefright_mpeg2support"
        "libutils"
    ];

    apex_available = [
        "com.android.media"
        "test_com.android.media"
    ];

    static = {
        apex_available = [
            #  Needed for unit tests
            "//apex_available:platform"
        ];
    };
};

in { inherit libmpeg2extractor; }
