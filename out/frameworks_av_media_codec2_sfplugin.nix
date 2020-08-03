{ cc_library_shared }:
let

libsfplugin_ccodec = cc_library_shared {
    name = "libsfplugin_ccodec";

    srcs = [
        "C2OMXNode.cpp"
        "CCodec.cpp"
        "CCodecBufferChannel.cpp"
        "CCodecBuffers.cpp"
        "CCodecConfig.cpp"
        "Codec2Buffer.cpp"
        "Codec2InfoBuilder.cpp"
        "Omx2IGraphicBufferSource.cpp"
        "PipelineWatcher.cpp"
        "ReflectedParamUpdater.cpp"
        "SkipCutBuffer.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    header_libs = [
        "libcodec2_internal"
    ];

    shared_libs = [
        "android.hardware.cas.native@1.0"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.media.c2@1.0"
        "android.hardware.media.omx@1.0"
        "libbase"
        "libbinder"
        "libcodec2"
        "libcodec2_client"
        "libcodec2_vndk"
        "libcutils"
        "libgui"
        "libhidlallocatorutils"
        "libhidlbase"
        "liblog"
        "libmedia"
        "libmedia_omx"
        "libsfplugin_ccodec_utils"
        "libstagefright_bufferqueue_helper"
        "libstagefright_codecbase"
        "libstagefright_foundation"
        "libstagefright_omx"
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

in { inherit libsfplugin_ccodec; }
