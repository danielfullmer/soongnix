{ cc_library_shared }:
let



libaudioflinger = cc_library_shared {
    name = "libaudioflinger";

    srcs = [
        "AudioFlinger.cpp"
        "AudioHwDevice.cpp"
        "AudioStreamOut.cpp"
        "AudioWatchdog.cpp"
        "BufLog.cpp"
        "Effects.cpp"
        "FastCapture.cpp"
        "FastCaptureDumpState.cpp"
        "FastCaptureState.cpp"
        "FastMixer.cpp"
        "FastMixerDumpState.cpp"
        "FastMixerState.cpp"
        "FastThread.cpp"
        "FastThreadDumpState.cpp"
        "FastThreadState.cpp"
        "NBAIO_Tee.cpp"
        "PatchPanel.cpp"
        "SpdifStreamOut.cpp"
        "StateQueue.cpp"
        "Threads.cpp"
        "Tracks.cpp"
        "TypedLogger.cpp"
    ];

    include_dirs = [
        "frameworks/av/services/audiopolicy"
        "frameworks/av/services/medialog"
    ];

    shared_libs = [
        "libaudiohal"
        "libaudioprocessing"
        "libaudiospdif"
        "libaudioutils"
        "libcutils"
        "libutils"
        "liblog"
        "libbinder"
        "libaudioclient"
        "libmedialogservice"
        "libmediametrics"
        "libmediautils"
        "libnbaio"
        "libnblog"
        "libpowermanager"
        "libmediautils"
        "libmemunreachable"
        "libmedia_helper"
        "libvibrator"
    ];

    static_libs = [
        "libcpustats"
        "libsndfile"
    ];

    cflags = [
        "-DSTATE_QUEUE_INSTANTIATIONS=\"StateQueueInstantiations.cpp\""
        "-fvisibility=hidden"
        "-Werror"
        "-Wall"
    ];
    sanitize = {
        integer_overflow = true;
    };

};

in { inherit libaudioflinger; }
