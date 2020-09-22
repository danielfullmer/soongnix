{ cc_library_static }:
let

libaudiopolicycomponents = cc_library_static {
    name = "libaudiopolicycomponents";

    srcs = [
        "src/AudioCollections.cpp"
        "src/AudioInputDescriptor.cpp"
        "src/AudioOutputDescriptor.cpp"
        "src/AudioPatch.cpp"
        "src/AudioPolicyMix.cpp"
        "src/AudioProfileVectorHelper.cpp"
        "src/AudioRoute.cpp"
        "src/ClientDescriptor.cpp"
        "src/DeviceDescriptor.cpp"
        "src/EffectDescriptor.cpp"
        "src/HwModule.cpp"
        "src/IOProfile.cpp"
        "src/PolicyAudioPort.cpp"
        "src/Serializer.cpp"
        "src/SoundTriggerSession.cpp"
        "src/TypeConverter.cpp"
    ];
    shared_libs = [
        "libaudiofoundation"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libmedia"
        "libmedia_helper"
        "libutils"
        "libxml2"
    ];
    export_shared_lib_headers = [
        "libaudiofoundation"
        "libmedia"
        "libmedia_helper"
    ];
    static_libs = [
        "libaudioutils"
    ];
    header_libs = [
        "libaudiopolicycommon"
        "libaudiopolicymanager_interface_headers"
    ];
    export_header_lib_headers = ["libaudiopolicycommon"];

    include_dirs = [
        "frameworks/av/services/audiopolicy"
    ];

    export_include_dirs = ["include"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

};

in { inherit libaudiopolicycomponents; }
