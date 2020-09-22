{ aidl_interface, cc_library, cc_library_headers, cc_library_shared, cc_library_static, filegroup }:
let

libmedia_headers = cc_library_headers {
    name = "libmedia_headers";
    vendor_available = true;
    min_sdk_version = "29";

    export_include_dirs = ["include"];
    header_libs = [
        "libbase_headers"
        "libgui_headers"
        "libstagefright_headers"
        "media_plugin_headers"
    ];
    export_header_lib_headers = [
        "libgui_headers"
        "libstagefright_headers"
        "media_plugin_headers"
    ];
};

libmedia_omx_aidl = filegroup {
    name = "libmedia_omx_aidl";
    srcs = [
        "aidl/android/IOMXBufferSource.aidl"
    ];
    path = "aidl";
};

mediaextractorservice_aidl = filegroup {
    name = "mediaextractorservice_aidl";
    srcs = [
        "aidl/android/IMediaExtractorService.aidl"
    ];
    path = "aidl";
};

resourcemanager_aidl = filegroup {
    name = "resourcemanager_aidl";
    srcs = [
        "aidl/android/media/IResourceManagerClient.aidl"
        "aidl/android/media/IResourceManagerService.aidl"
        "aidl/android/media/MediaResourceType.aidl"
        "aidl/android/media/MediaResourceSubType.aidl"
        "aidl/android/media/MediaResourceParcel.aidl"
        "aidl/android/media/MediaResourcePolicyParcel.aidl"
    ];
    path = "aidl";
};

resourcemanager_aidl_interface = aidl_interface {
    name = "resourcemanager_aidl_interface";
    unstable = true;
    local_include_dir = "aidl";
    srcs = [
        ":resourcemanager_aidl"
    ];
};

libmedia_omx = cc_library_shared {
    name = "libmedia_omx";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;

    srcs = [
        ":libmedia_omx_aidl"

        "IOMX.cpp"
        "MediaCodecBuffer.cpp"
        "OMXBuffer.cpp"
        "omx/1.0/WOmxBufferSource.cpp"
        "omx/1.0/WOmxNode.cpp"
        "omx/1.0/WOmxObserver.cpp"
    ];

    aidl = {
        local_include_dirs = ["aidl"];
        export_aidl_headers = true;
    };

    local_include_dirs = [
        "include"
    ];

    shared_libs = [
        "android.hidl.token@1.0-utils"
        "android.hardware.media.omx@1.0"
        "libbinder"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libstagefright_foundation"
        "libui"
        "libutils"
    ];

    export_shared_lib_headers = [
        "android.hidl.token@1.0-utils"
        "android.hardware.media.omx@1.0"
        "libstagefright_foundation"
        "libui"
    ];

    header_libs = [
        "libstagefright_headers"
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "libstagefright_headers"
        "media_plugin_headers"
    ];

    export_include_dirs = [
        "aidl"
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

libmedia_omx_client = cc_library_shared {
    name = "libmedia_omx_client";

    srcs = [
        "omx/1.0/WOmx.cpp"
    ];

    local_include_dirs = [
        "include"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "libgui"
        "libhidlbase"
        "liblog"
        "libmedia_omx"
        "libstagefright_foundation"
        "libui"
        "libutils"
    ];

    export_shared_lib_headers = [
        "libgui"
        "libmedia_omx"
        "libstagefright_foundation"
        "libui"
    ];

    header_libs = [
        "libstagefright_headers"
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "libstagefright_headers"
        "media_plugin_headers"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

libmedia_midiiowrapper = cc_library_static {
    name = "libmedia_midiiowrapper";

    min_sdk_version = "29";

    srcs = ["MidiIoWrapper.cpp"];

    static_libs = [
        "libsonivoxwithoutjet"
    ];

    header_libs = [
        "libmedia_headers"
        "media_ndk_headers"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

libmedia_codeclist = cc_library_shared {
    name = "libmedia_codeclist";

    srcs = [
        "IMediaCodecList.cpp"
        "MediaCodecInfo.cpp"
    ];

    local_include_dirs = [
        "include"
    ];

    shared_libs = [
        "android.hardware.media.omx@1.0"
        "libbinder"
        "liblog"
        "libstagefright_foundation"
        "libutils"
    ];

    include_dirs = [
        "system/libhidl/transport/token/1.0/utils/include"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

libmedia = cc_library {
    name = "libmedia";

    srcs = [
        ":mediaextractorservice_aidl"
        "IDataSource.cpp"
        "BufferingSettings.cpp"
        "mediaplayer.cpp"
        "IMediaHTTPConnection.cpp"
        "IMediaHTTPService.cpp"
        "IMediaExtractor.cpp"
        "IMediaPlayerService.cpp"
        "IMediaPlayerClient.cpp"
        "IMediaRecorderClient.cpp"
        "IMediaPlayer.cpp"
        "IMediaRecorder.cpp"
        "IMediaSource.cpp"
        "IRemoteDisplay.cpp"
        "IRemoteDisplayClient.cpp"
        "IStreamSource.cpp"
        "Metadata.cpp"
        "mediarecorder.cpp"
        "IMediaMetadataRetriever.cpp"
        "mediametadataretriever.cpp"
        "MediaScanner.cpp"
        "MediaScannerClient.cpp"
        "CharacterEncodingDetector.cpp"
        "IMediaDeathNotifier.cpp"
        "MediaProfiles.cpp"
        "MediaResource.cpp"
        "MediaResourcePolicy.cpp"
        "StringArray.cpp"
        "NdkMediaFormatPriv.cpp"
        "NdkMediaErrorPriv.cpp"
    ];

    aidl = {
        local_include_dirs = ["aidl"];
        export_aidl_headers = true;
    };

    header_libs = [
        "libstagefright_headers"
        "media_ndk_headers"
    ];

    export_header_lib_headers = [
        "libstagefright_headers"
        "media_ndk_headers"
    ];

    shared_libs = [
        "android.hidl.token@1.0-utils"
        "liblog"
        "libcutils"
        "libprocessgroup"
        "libutils"
        "libbinder"
        "libbinder_ndk"
        # "libsonivox",
        "libandroidicu"
        "libexpat"
        "libcamera_client"
        "libstagefright_foundation"
        "libgui"
        "libdl"
        "libaudioclient"
        "libmedia_codeclist"
        "libmedia_omx"
    ];

    export_shared_lib_headers = [
        "libaudioclient"
        "libbinder"
        "libandroidicu"
        # "libsonivox",
        "libmedia_omx"
    ];

    static_libs = [
        "resourcemanager_aidl_interface-ndk_platform"
    ];

    export_static_lib_headers = [
        "resourcemanager_aidl_interface-ndk_platform"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libmedia libmedia_codeclist libmedia_headers libmedia_midiiowrapper libmedia_omx libmedia_omx_aidl libmedia_omx_client mediaextractorservice_aidl resourcemanager_aidl resourcemanager_aidl_interface; }
