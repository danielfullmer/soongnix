{ cc_library_static }:
let

#  Copyright 2011 The Android Open Source Project

# AUDIO_POLICY_TEST := true
# ENABLE_AUDIO_DUMP := true

libaudiohw_legacy = cc_library_static {

    srcs = [
        "AudioHardwareInterface.cpp"
        "audio_hw_hal.cpp"
    ];

    name = "libaudiohw_legacy";
    static_libs = ["libmedia_helper"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        "-Wno-gnu-designator"
    ];

    header_libs = [
        "libaudioclient_headers"
        "libbase_headers"
        "libhardware_legacy_headers"
    ];
    export_header_lib_headers = ["libhardware_legacy_headers"];
};

in { inherit libaudiohw_legacy; }
