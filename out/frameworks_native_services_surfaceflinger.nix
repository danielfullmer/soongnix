{ cc_binary, cc_defaults, cc_library_headers, cc_library_shared, filegroup }:
let

surfaceflinger_defaults = cc_defaults {
    name = "surfaceflinger_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wformat"
        "-Wthread-safety"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

libsurfaceflinger_defaults = cc_defaults {
    name = "libsurfaceflinger_defaults";
    defaults = ["surfaceflinger_defaults"];
    cflags = [
        "-DLOG_TAG=\"SurfaceFlinger\""
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
    ];
    shared_libs = [
        "android.frameworks.vr.composer@1.0"
        "android.hardware.configstore-utils"
        "android.hardware.configstore@1.0"
        "android.hardware.configstore@1.1"
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "android.hardware.graphics.common@1.2"
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.composer@2.2"
        "android.hardware.graphics.composer@2.3"
        "android.hardware.power@1.0"
        "android.hardware.power@1.3"
        "libbase"
        "libbinder"
        "libbufferhubqueue"
        "libcutils"
        "libdl"
        "libEGL"
        "libfmq"
        "libGLESv1_CM"
        "libGLESv2"
        "libgui"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblayers_proto"
        "liblog"
        "libnativewindow"
        "libpdx_default_transport"
        "libprocessgroup"
        "libprotobuf-cpp-lite"
        "libsync"
        "libtimestats_proto"
        "libui"
        "libinput"
        "libutils"
        "libSurfaceFlingerProp"
    ];
    static_libs = [
        "libcompositionengine"
        "librenderengine"
        "libserviceutils"
        "libtrace_proto"
        "libvr_manager"
        "libvrflinger"
    ];
    header_libs = [
        "android.hardware.graphics.composer@2.1-command-buffer"
        "android.hardware.graphics.composer@2.2-command-buffer"
        "android.hardware.graphics.composer@2.3-command-buffer"
    ];
    export_static_lib_headers = [
        "libcompositionengine"
        "librenderengine"
        "libserviceutils"
    ];
    export_shared_lib_headers = [
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "android.hardware.graphics.common@1.2"
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.composer@2.2"
        "android.hardware.graphics.composer@2.3"
        "android.hardware.power@1.3"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
    ];
};

libsurfaceflinger_production_defaults = cc_defaults {
    name = "libsurfaceflinger_production_defaults";
    defaults = ["libsurfaceflinger_defaults"];
    cflags = [
        "-fvisibility=hidden"
        "-fwhole-program-vtables" #  requires ThinLTO
    ];
    lto = {
        thin = true;
    };
};

libsurfaceflinger_headers = cc_library_headers {
    name = "libsurfaceflinger_headers";
    export_include_dirs = ["."];
    static_libs = ["libserviceutils"];
    export_static_lib_headers = ["libserviceutils"];
};

libsurfaceflinger_sources = filegroup {
    name = "libsurfaceflinger_sources";
    srcs = [
        "BufferLayer.cpp"
        "BufferLayerConsumer.cpp"
        "BufferQueueLayer.cpp"
        "BufferStateLayer.cpp"
        "ClientCache.cpp"
        "Client.cpp"
        "ColorLayer.cpp"
        "ContainerLayer.cpp"
        "DisplayDevice.cpp"
        "DisplayHardware/ComposerHal.cpp"
        "DisplayHardware/DisplayIdentification.cpp"
        "DisplayHardware/FramebufferSurface.cpp"
        "DisplayHardware/HWC2.cpp"
        "DisplayHardware/HWComposer.cpp"
        "DisplayHardware/PowerAdvisor.cpp"
        "DisplayHardware/VirtualDisplaySurface.cpp"
        "Effects/Daltonizer.cpp"
        "EventLog/EventLog.cpp"
        "FrameTracker.cpp"
        "Layer.cpp"
        "LayerProtoHelper.cpp"
        "LayerRejecter.cpp"
        "LayerStats.cpp"
        "LayerVector.cpp"
        "MonitoredProducer.cpp"
        "NativeWindowSurface.cpp"
        "RefreshRateOverlay.cpp"
        "RegionSamplingThread.cpp"
        "RenderArea.cpp"
        "Scheduler/DispSync.cpp"
        "Scheduler/DispSyncSource.cpp"
        "Scheduler/EventControlThread.cpp"
        "Scheduler/EventThread.cpp"
        "Scheduler/IdleTimer.cpp"
        "Scheduler/LayerHistory.cpp"
        "Scheduler/LayerInfo.cpp"
        "Scheduler/MessageQueue.cpp"
        "Scheduler/PhaseOffsets.cpp"
        "Scheduler/Scheduler.cpp"
        "Scheduler/SchedulerUtils.cpp"
        "Scheduler/VSyncModulator.cpp"
        "StartPropertySetThread.cpp"
        "SurfaceFlinger.cpp"
        "SurfaceInterceptor.cpp"
        "SurfaceTracing.cpp"
        "TimeStats/TimeStats.cpp"
        "TransactionCompletedThread.cpp"
    ];
};

libsurfaceflinger = cc_library_shared {
    #  Please use libsurfaceflinger_defaults to configure how the sources are
    #  built, so the same settings can be used elsewhere.
    name = "libsurfaceflinger";
    defaults = ["libsurfaceflinger_production_defaults"];
    srcs = [
        ":libsurfaceflinger_sources"

        #  Note: SurfaceFlingerFactory is not in the default sources so that it
        #  can be easily replaced.
        "SurfaceFlingerFactory.cpp"
    ];
    logtags = ["EventLog/EventLogTags.logtags"];
};

libsurfaceflinger_binary = cc_defaults {
    name = "libsurfaceflinger_binary";
    defaults = ["surfaceflinger_defaults"];
    cflags = [
        "-DLOG_TAG=\"SurfaceFlinger\""
    ];
    whole_static_libs = [
        "libsigchain"
    ];
    shared_libs = [
        "android.frameworks.displayservice@1.0"
        "android.hardware.configstore-utils"
        "android.hardware.configstore@1.0"
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "libbinder"
        "libcutils"
        "libdisplayservicehidl"
        "libhidlbase"
        "libhidltransport"
        "libinput"
        "liblayers_proto"
        "liblog"
        "libprocessgroup"
        "libsync"
        "libtimestats_proto"
        "libutils"
    ];
    static_libs = [
        "libserviceutils"
        "libtrace_proto"
    ];
    ldflags = ["-Wl,--export-dynamic"];
};

surfaceflinger_binary_sources = filegroup {
    name = "surfaceflinger_binary_sources";
    srcs = ["main_surfaceflinger.cpp"];
};

surfaceflinger = cc_binary {
    name = "surfaceflinger";
    defaults = ["libsurfaceflinger_binary"];
    init_rc = ["surfaceflinger.rc"];
    srcs = [":surfaceflinger_binary_sources"];
    shared_libs = [
        "libsurfaceflinger"
        "libSurfaceFlingerProp"
    ];
};

subdirs = [
    "layerproto"
    "TimeStats/timestatsproto"
    "tests"
];

libSurfaceFlingerProp = cc_library_shared {
    name = "libSurfaceFlingerProp";
    srcs = [
        "SurfaceFlingerProperties.cpp"
    ];
    shared_libs = [
        "android.hardware.configstore-utils"
        "android.hardware.configstore@1.0"
        "android.hardware.configstore@1.1"
        "android.hardware.graphics.common@1.2"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libui"
        "libutils"
        "liblog"
    ];
    static_libs = [
        "SurfaceFlingerProperties"
    ];
    export_shared_lib_headers = [
        "android.hardware.graphics.common@1.2"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
    ];
    export_static_lib_headers = [
        "SurfaceFlingerProperties"
    ];
};

in { inherit libSurfaceFlingerProp libsurfaceflinger libsurfaceflinger_binary libsurfaceflinger_defaults libsurfaceflinger_headers libsurfaceflinger_production_defaults libsurfaceflinger_sources surfaceflinger surfaceflinger_binary_sources surfaceflinger_defaults; }
