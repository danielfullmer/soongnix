{ cc_library, cc_library_shared }:
let

#
#  libmediadrm
#

#  TODO: change it back to cc_library_shared when MediaPlayer2 switches to
#  using NdkMediaDrm, instead of MediaDrm.java.
libmediadrm = cc_library {
    name = "libmediadrm";

    srcs = [
        "DrmPluginPath.cpp"
        "DrmSessionManager.cpp"
        "ICrypto.cpp"
        "IDrm.cpp"
        "IDrmClient.cpp"
        "IMediaDrmService.cpp"
        "SharedLibrary.cpp"
        "DrmHal.cpp"
        "CryptoHal.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "libdl"
        "liblog"
        "libmediadrmmetrics_lite"
        "libmediametrics"
        "libmediautils"
        "libstagefright_foundation"
        "libutils"
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "libhidlallocatorutils"
        "libhidlbase"
        "libhidltransport"
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

    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "libbinder"
        "libhidlbase"
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

    proto = {
        export_proto_headers = true;
        type = "full";
    };
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "libbase"
        "libbinder"
        "libhidlbase"
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

in { inherit libmediadrm libmediadrmmetrics_full libmediadrmmetrics_lite; }
