{ cc_library_headers, cc_library_shared, filegroup }:
let

libaudioclient_headers = cc_library_headers {
    name = "libaudioclient_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
};

libaudiopolicy = cc_library_shared {
    name = "libaudiopolicy";
    srcs = [
        "AudioAttributes.cpp"
        "AudioPolicy.cpp"
        "AudioProductStrategy.cpp"
        "AudioVolumeGroup.cpp"
    ];
    shared_libs = [
        "libaudioutils"
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    include_dirs = ["system/media/audio_utils/include"];
    export_include_dirs = ["include"];
};

libaudioclient = cc_library_shared {
    name = "libaudioclient";

    aidl = {
        export_aidl_headers = true;
        local_include_dirs = ["aidl"];
        include_dirs = [
            "frameworks/av/media/libaudioclient/aidl"
        ];
    };

    srcs = [
        #  AIDL files for audioclient interfaces
        #  The headers for these interfaces will be available to any modules that
        #  include libaudioclient, at the path "aidl/package/path/BnFoo.h"
        "aidl/android/media/IAudioRecord.aidl"
        ":libaudioclient_aidl"

        "AudioEffect.cpp"
        "AudioRecord.cpp"
        "AudioSystem.cpp"
        "AudioTrack.cpp"
        "AudioTrackShared.cpp"
        "IAudioFlinger.cpp"
        "IAudioFlingerClient.cpp"
        "IAudioPolicyService.cpp"
        "IAudioPolicyServiceClient.cpp"
        "IAudioTrack.cpp"
        "IEffect.cpp"
        "IEffectClient.cpp"
        "ToneGenerator.cpp"
        "PlayerBase.cpp"
        "RecordingActivityTracker.cpp"
        "TrackPlayerBase.cpp"
    ];
    shared_libs = [
        "libaudioutils"
        "libaudiopolicy"
        "libaudiomanager"
        "libbinder"
        "libcutils"
        "libdl"
        "liblog"
        "libmedia_helper"
        "libmediametrics"
        "libmediautils"
        "libnblog"
        "libprocessgroup"
        "libutils"
        "libvibrator"
    ];
    export_shared_lib_headers = ["libbinder"];

    local_include_dirs = [
        "include/media"
        "aidl"
    ];
    header_libs = [
        "libaudioclient_headers"
        "libbase_headers"
    ];
    export_header_lib_headers = ["libaudioclient_headers"];

    #  for memory heap analysis
    static_libs = [
        "libc_malloc_debug_backtrace"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-declarations"
    ];
    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

#  AIDL interface between libaudioclient and framework.jar
libaudioclient_aidl = filegroup {
    name = "libaudioclient_aidl";
    srcs = [
        "aidl/android/media/IPlayer.aidl"
    ];
};

in { inherit libaudioclient libaudioclient_aidl libaudioclient_headers libaudiopolicy; }
