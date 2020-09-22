{ cc_library }:
let

libaudiopolicyengine_config = cc_library {
    name = "libaudiopolicyengine_config";
    export_include_dirs = ["include"];
    include_dirs = [
        "external/libxml2/include"
    ];
    srcs = [
        "src/EngineConfig.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    shared_libs = [
        "libmedia_helper"
        "libxml2"
        "libutils"
        "liblog"
        "libcutils"
    ];
    header_libs = [
        "libaudio_system_headers"
        "libmedia_headers"
        "libaudioclient_headers"
    ];
};

in { inherit libaudiopolicyengine_config; }
