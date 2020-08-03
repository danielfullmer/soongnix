{ cc_library, cc_library_headers, cc_library_shared, cc_library_static }:
let

libstagefright_headers = cc_library_headers {
    name = "libstagefright_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
};

libstagefright_esds = cc_library_static {
    name = "libstagefright_esds";

    srcs = ["ESDS.cpp"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    shared_libs = ["libmedia"];
};

libstagefright_metadatautils = cc_library_static {
    name = "libstagefright_metadatautils";

    srcs = ["MetaDataUtils.cpp"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    shared_libs = [
        "libmedia"
        "libmediandk"
    ];
};

libstagefright_codecbase = cc_library_shared {
    name = "libstagefright_codecbase";

    export_include_dirs = ["include"];

    srcs = [
        "CodecBase.cpp"
        "FrameRenderTracker.cpp"
        "MediaCodecListWriter.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    shared_libs = [
        "libgui"
        "liblog"
        "libmedia_omx"
        "libstagefright_foundation"
        "libui"
        "libutils"
        "android.hardware.cas.native@1.0"
    ];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

libstagefright_mpeg2extractor = cc_library_static {
    name = "libstagefright_mpeg2extractor";

    srcs = [
        "Utils.cpp"
        "MediaSource.cpp"
        "HevcUtils.cpp"
    ];

    shared_libs = [
        "liblog"
        "libmedia"
        "libmedia_omx"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

libstagefright = cc_library {
    name = "libstagefright";

    srcs = [
        "AACWriter.cpp"
        "ACodec.cpp"
        "ACodecBufferChannel.cpp"
        "AHierarchicalStateMachine.cpp"
        "AMRWriter.cpp"
        "AudioPlayer.cpp"
        "AudioSource.cpp"
        "BufferImpl.cpp"
        "CallbackDataSource.cpp"
        "CallbackMediaSource.cpp"
        "CameraSource.cpp"
        "CameraSourceTimeLapse.cpp"
        "DataConverter.cpp"
        "DataSourceFactory.cpp"
        "DataURISource.cpp"
        "ClearFileSource.cpp"
        "FileSource.cpp"
        "FrameDecoder.cpp"
        "HTTPBase.cpp"
        "HevcUtils.cpp"
        "InterfaceUtils.cpp"
        "JPEGSource.cpp"
        "MPEG2TSWriter.cpp"
        "MPEG4Writer.cpp"
        "MediaAdapter.cpp"
        "MediaClock.cpp"
        "MediaCodec.cpp"
        "MediaCodecList.cpp"
        "MediaCodecListOverrides.cpp"
        "MediaCodecSource.cpp"
        "MediaExtractor.cpp"
        "MediaExtractorFactory.cpp"
        "MediaSource.cpp"
        "MediaSync.cpp"
        "MediaTrack.cpp"
        "http/ClearMediaHTTP.cpp"
        "http/MediaHTTP.cpp"
        "MediaMuxer.cpp"
        "NuCachedSource2.cpp"
        "NuMediaExtractor.cpp"
        "OggWriter.cpp"
        "OMXClient.cpp"
        "OmxInfoBuilder.cpp"
        "RemoteMediaExtractor.cpp"
        "RemoteMediaSource.cpp"
        "SimpleDecodingSource.cpp"
        "SkipCutBuffer.cpp"
        "StagefrightMediaScanner.cpp"
        "StagefrightMetadataRetriever.cpp"
        "StagefrightPluginLoader.cpp"
        "SurfaceUtils.cpp"
        "Utils.cpp"
        "ThrottledSource.cpp"
        "VideoFrameSchedulerBase.cpp"
        "VideoFrameScheduler.cpp"
    ];

    shared_libs = [
        "libaudioutils"
        "libbase"
        "libbinder"
        "libcamera_client"
        "libcutils"
        "libdl"
        "libdl_android"
        "libdrmframework"
        "libgui"
        "liblog"
        "libmedia"
        "libmedia_omx"
        "libmedia_omx_client"
        "libaudioclient"
        "libmediametrics"
        "libmediautils"
        "libui"
        "libutils"
        "libmedia_helper"
        "libstagefright_codecbase"
        "libstagefright_foundation"
        "libstagefright_omx_utils"
        "libRScpp"
        "libhidlallocatorutils"
        "libhidlbase"
        "libhidlmemory"
        "android.hidl.allocator@1.0"
        "android.hardware.cas.native@1.0"
        "android.hardware.media.omx@1.0"
    ];

    static_libs = [
        "libstagefright_color_conversion"
        "libyuv_static"
        "libstagefright_mediafilter"
        "libstagefright_webm"
        "libstagefright_timedtext"
        "libogg"
        "libwebm"
        "libstagefright_esds"
        "libstagefright_id3"
        "libFLAC"
    ];

    header_libs = [
        "libnativeloader-dummy-headers"
        "libstagefright_xmlparser_headers"
        "media_ndk_headers"
    ];

    export_shared_lib_headers = [
        "libgui"
        "libhidlmemory"
        "libmedia"
        "android.hidl.allocator@1.0"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    version_script = "exports.lds";

    product_variables = {
        debuggable = {
            #  enable experiments only in userdebug and eng builds
            cflags = ["-DENABLE_STAGEFRIGHT_EXPERIMENTS"];
        };
    };

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

libstagefright_player2 = cc_library_static {
    name = "libstagefright_player2";

    srcs = [
        "ClearFileSource.cpp"
        "DataURISource.cpp"
        "HTTPBase.cpp"
        "HevcUtils.cpp"
        "MediaClock.cpp"
        "MediaSource.cpp"
        "NdkUtils.cpp"
        "Utils.cpp"
        "VideoFrameSchedulerBase.cpp"
        "VideoFrameScheduler2.cpp"
        "http/ClearMediaHTTP.cpp"
    ];

    shared_libs = [
        "libgui"
        "liblog"
        "libnetd_client"
        "libutils"
        "libstagefright_foundation"
        "libandroid"
    ];

    static_libs = [
        "libmedia_player2_util"
        "libmedia2_jni_core"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    product_variables = {
        debuggable = {
            #  enable experiments only in userdebug and eng builds
            cflags = ["-DENABLE_STAGEFRIGHT_EXPERIMENTS"];
        };
    };

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

in { inherit libstagefright libstagefright_codecbase libstagefright_esds libstagefright_headers libstagefright_metadatautils libstagefright_mpeg2extractor libstagefright_player2; }
