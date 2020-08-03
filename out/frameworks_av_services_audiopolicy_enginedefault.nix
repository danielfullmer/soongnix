{ cc_library_shared }:
let

libaudiopolicyenginedefault = cc_library_shared {
    name = "libaudiopolicyenginedefault";
    export_include_dirs = ["include"];
    srcs = [
        "src/Engine.cpp"
        "src/EngineInstance.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    local_include_dirs = ["include"];
    header_libs = [
        "libbase_headers"
        "libaudiopolicycommon"
        "libaudiopolicyengine_interface_headers"
    ];
    static_libs = [
        "libaudiopolicycomponents"
        "libaudiopolicyengine_common"
        "libaudiopolicyengine_config"
    ];
    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libmedia_helper"
        "libaudiopolicy"
        "libxml2"
    ];
};

in { inherit libaudiopolicyenginedefault; }
