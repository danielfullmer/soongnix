{ cc_library_static }:
let

libstagefright_mpeg2support = cc_library_static {
    name = "libstagefright_mpeg2support";

    srcs = [
        "AnotherPacketSource.cpp"
        "ATSParser.cpp"
        "CasManager.cpp"
        "ESQueue.cpp"
        "HlsSampleDecryptor.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/native/include/media/openmax"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    shared_libs = [
        "libcrypto"
        "libhidlmemory"
        "android.hardware.cas.native@1.0"
        "android.hidl.memory@1.0"
        "android.hidl.allocator@1.0"
    ];

    header_libs = [
        "libmedia_headers"
        "libaudioclient_headers"
        "media_ndk_headers"
    ];

    export_include_dirs = ["."];

    whole_static_libs = [
        "libstagefright_metadatautils"
    ];

    min_sdk_version = "29";
};

in { inherit libstagefright_mpeg2support; }
