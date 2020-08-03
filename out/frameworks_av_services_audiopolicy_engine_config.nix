{ cc_library_static }:
let

libaudiopolicyengine_config = cc_library_static {
    name = "libaudiopolicyengine_config";
    export_include_dirs = ["include"];
    include_dirs = [
        "external/libxml2/include"
        "external/icu/icu4c/source/common"
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
        "libandroidicu"
        "libxml2"
        "libutils"
        "liblog"
        "libcutils"
    ];
    static_libs = [
        "libaudiopolicycomponents"
    ];
    header_libs = [
        "libaudio_system_headers"
        "libaudiopolicycommon"
    ];
};

in { inherit libaudiopolicyengine_config; }
