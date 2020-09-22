{ cc_library_headers, cc_library_shared }:
let

#
#  libmediadrm
#

libmediadrm_headers = cc_library_headers {
    name = "libmediadrm_headers";

    export_include_dirs = [
        "interface"
    ];

};

libmediadrm = cc_library_shared {
    name = "libmediadrm";

    srcs = [
        "DrmPluginPath.cpp"
        "DrmSessionManager.cpp"
        "SharedLibrary.cpp"
        "DrmHal.cpp"
        "CryptoHal.cpp"
        "DrmUtils.cpp"
    ];

    local_include_dirs = [
        "include"
        "interface"
    ];

    export_include_dirs = [
        "include"
    ];

    header_libs = [
        "libmedia_headers"
    ];

    shared_libs = [
        "libbinder_ndk"
        "libcutils"
        "libdl"
        "liblog"
        "libmedia"
        "libmediadrmmetrics_lite"
        "libmediametrics#1"
        "libmediautils"
        "libstagefright_foundation"
        "libutils"
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "android.hardware.drm@1.3"
        "libhidlallocatorutils"
        "libhidlbase"
    ];

    static_libs = [
        "resourcemanager_aidl_interface-ndk_platform"
    ];

    export_shared_lib_headers = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

#  This is the version of the drm metrics configured for protobuf lite.
libmediadrmmetrics_lite = cc_library_shared {
    name = "libmediadrmmetrics_lite";
    srcs = [
        "DrmMetrics.cpp"
        "PluginMetricsReporting.cpp"
        "protos/metrics.proto"
    ];

    local_include_dirs = [
        "include"
    ];

    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    header_libs = [
        "libmedia_headers"
    ];
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "liblog"
        "libmediametrics"
        "libprotobuf-cpp-lite"
        "libutils"
    ];
    cflags = [
        #  Suppress unused parameter and no error options. These cause problems
        #  with the when using the map type in a proto definition.
        "-Wno-unused-parameter"
    ];
};

#  This is the version of the drm metrics library configured for full protobuf.
libmediadrmmetrics_full = cc_library_shared {
    name = "libmediadrmmetrics_full";
    srcs = [
        "DrmMetrics.cpp"
        "PluginMetricsReporting.cpp"
        "protos/metrics.proto"
    ];

    local_include_dirs = [
        "include"
    ];

    proto = {
        export_proto_headers = true;
        type = "full";
    };
    header_libs = [
        "libmedia_headers"
    ];
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "libbase"
        "liblog"
        "libmediametrics"
        "libprotobuf-cpp-full"
        "libstagefright_foundation"
        "libutils"
    ];
    cflags = [
        #  Suppress unused parameter and no error options. These cause problems
        #  when using the map type in a proto definition.
        "-Wno-unused-parameter"
    ];
};

libmediadrmmetrics_consumer = cc_library_shared {
    name = "libmediadrmmetrics_consumer";
    srcs = [
        "DrmMetricsConsumer.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/libmedia/include"
    ];

    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "libbinder"
        "libhidlbase"
        "liblog"
        "libmediadrm"
        "libmediadrmmetrics_full"
        "libutils"
    ];

    header_libs = [
        "libmediametrics_headers"
        "libstagefright_foundation_headers"
    ];
};

in { inherit libmediadrm libmediadrm_headers libmediadrmmetrics_consumer libmediadrmmetrics_full libmediadrmmetrics_lite; }
