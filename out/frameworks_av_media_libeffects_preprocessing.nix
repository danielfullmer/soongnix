{ cc_library_shared }:
let

#  audio preprocessing wrapper
libaudiopreprocessing = cc_library_shared {
    name = "libaudiopreprocessing";

    vendor = true;

    relative_install_path = "soundfx";

    srcs = ["PreProcessing.cpp"];

    include_dirs = [
        "external/webrtc"
        "external/webrtc/webrtc/modules/include"
        "external/webrtc/webrtc/modules/audio_processing/include"
    ];

    shared_libs = [
        "libwebrtc_audio_preprocessing"
        "libspeexresampler"
        "libutils"
        "liblog"
    ];

    cflags = [
        "-DWEBRTC_POSIX"
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
    ];

    header_libs = [
        "libaudioeffects"
        "libhardware_headers"
    ];
};

in { inherit libaudiopreprocessing; }
