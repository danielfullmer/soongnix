{ cc_library_headers, cc_library_shared }:
let

libaudiopolicyengineconfigurable_interface_headers = cc_library_headers {
    name = "libaudiopolicyengineconfigurable_interface_headers";
    host_supported = true;
    export_include_dirs = ["interface"];
};

libaudiopolicyengineconfigurable = cc_library_shared {
    name = "libaudiopolicyengineconfigurable";
    export_include_dirs = ["include"];
    srcs = [
        "src/Engine.cpp"
        "src/EngineInstance.cpp"
        "src/Stream.cpp"
        "src/InputSource.cpp"
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
        "libaudiopolicyengineconfigurable_interface_headers"
    ];
    static_libs = [
        "libaudiopolicycomponents"
        "libaudiopolicyengine_common"
        "libaudiopolicyengine_config"
        "libaudiopolicyengineconfigurable_pfwwrapper"

    ];
    shared_libs = [
        "libaudiofoundation"
        "liblog"
        "libcutils"
        "libutils"
        "libmedia_helper"
        "libaudiopolicy"
        "libparameter"
        "libxml2"
    ];
};

in { inherit libaudiopolicyengineconfigurable libaudiopolicyengineconfigurable_interface_headers; }
