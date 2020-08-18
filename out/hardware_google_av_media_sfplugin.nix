{ cc_library_shared }:
let

libstagefright_ccodec = cc_library_shared {
    name = "libstagefright_ccodec";

    srcs = [
        "C2OMXNode.cpp"
        "CCodec.cpp"
        "CCodecBufferChannel.cpp"
        "CCodecConfig.cpp"
        "Codec2Buffer.cpp"
        "Codec2InfoBuilder.cpp"
        "ReflectedParamUpdater.cpp"
        "SkipCutBuffer.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    header_libs = [
        "libstagefright_codec2_internal"
    ];

    shared_libs = [
        "android.hardware.cas.native@1.0"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.media.omx@1.0"
        "hardware.google.media.c2@1.0"
        "libbase"
        "libbinder"
        "libcodec2_hidl_client"
        "libcutils"
        "libgui"
        "libhidlallocatorutils"
        "libhidlbase"
        "liblog"
        "libmedia"
        "libmedia_omx"
        "libstagefright_bufferqueue_helper"
        "libstagefright_ccodec_utils"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
        "libstagefright_codecbase"
        "libstagefright_foundation"
        "libstagefright_omx_utils"
        "libstagefright_xmlparser"
        "libui"
        "libutils"
    ];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

in { inherit libstagefright_ccodec; }
