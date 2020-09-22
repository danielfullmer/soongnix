{ cc_library_shared }:
let

libsfplugin_ccodec = cc_library_shared {
    name = "libsfplugin_ccodec";

    export_include_dirs = ["include"];

    srcs = [
        "C2OMXNode.cpp"
        "CCodec.cpp"
        "CCodecBufferChannel.cpp"
        "CCodecBuffers.cpp"
        "CCodecConfig.cpp"
        "Codec2Buffer.cpp"
        "Codec2InfoBuilder.cpp"
        "PipelineWatcher.cpp"
        "ReflectedParamUpdater.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    header_libs = [
        "libcodec2_internal"
        "libmediadrm_headers"
        "libmediametrics_headers"
        "media_ndk_headers"
    ];

    shared_libs = [
        "android.hardware.cas.native@1.0"
        "android.hardware.drm@1.0"
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
        "libmedia_codeclist"
        "libmedia_omx"
        "libsfplugin_ccodec_utils"
        "libstagefright_bufferqueue_helper"
        "libstagefright_codecbase"
        "libstagefright_foundation"
        "libstagefright_omx"
        "libstagefright_xmlparser"
        "libui"
        "libutils"
    ];

    export_shared_lib_headers = [
        "libcodec2"
        "libcodec2_client"
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
