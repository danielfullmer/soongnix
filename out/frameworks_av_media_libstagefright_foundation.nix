{ cc_defaults, cc_library, cc_library_headers, cc_library_static }:
let

libstagefright_foundation_headers = cc_library_headers {
    name = "libstagefright_foundation_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
};

libstagefright_foundation_defaults = cc_defaults {
    name = "libstagefright_foundation_defaults";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    include_dirs = [
        "frameworks/av/include"
        "frameworks/native/include"
        "frameworks/native/libs/arect/include"
        "frameworks/native/libs/nativebase/include"
    ];

    local_include_dirs = [
        "include/media/stagefright/foundation"
    ];

    header_libs = [
        "libhardware_headers"
        "libstagefright_foundation_headers"
        "media_ndk_headers"
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "libstagefright_foundation_headers"
        "media_plugin_headers"
    ];

    export_shared_lib_headers = [
        "libbinder"
    ];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wall"
    ];

    shared_libs = [
        "libbinder"
        "libutils"
        "libcutils"
        "liblog"
    ];

    srcs = [
        "AAtomizer.cpp"
        "ABitReader.cpp"
        "ABuffer.cpp"
        "ADebug.cpp"
        "AHandler.cpp"
        "ALooper.cpp"
        "ALooperRoster.cpp"
        "AMessage.cpp"
        "AString.cpp"
        "AStringUtils.cpp"
        "AudioPresentationInfo.cpp"
        "ByteUtils.cpp"
        "ColorUtils.cpp"
        "MediaBuffer.cpp"
        "MediaBufferBase.cpp"
        "MediaBufferGroup.cpp"
        "MediaDefs.cpp"
        "MediaKeys.cpp"
        "MetaData.cpp"
        "MetaDataBase.cpp"
        "OpusHeader.cpp"
        "avc_utils.cpp"
        "base64.cpp"
        "hexdump.cpp"
    ];

    clang = true;

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

libstagefright_foundation = cc_library {
    name = "libstagefright_foundation";
    defaults = ["libstagefright_foundation_defaults"];
};

libstagefright_foundation_without_imemory = cc_library_static {
    name = "libstagefright_foundation_without_imemory";
    defaults = ["libstagefright_foundation_defaults"];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wall"
        "-DNO_IMEMORY"
    ];
};

in { inherit libstagefright_foundation libstagefright_foundation_defaults libstagefright_foundation_headers libstagefright_foundation_without_imemory; }
