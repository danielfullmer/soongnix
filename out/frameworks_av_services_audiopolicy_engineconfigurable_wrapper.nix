{ cc_library }:
let

libaudiopolicyengineconfigurable_pfwwrapper = cc_library {
    name = "libaudiopolicyengineconfigurable_pfwwrapper";
    export_include_dirs = ["include"];
    srcs = ["ParameterManagerWrapper.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    header_libs = [
        "libbase_headers"
        "libaudiopolicycommon"
    ];
    static_libs = ["libaudiopolicycomponents"];
    shared_libs = [
        "liblog"
        "libutils"
        "libmedia_helper"
        "libparameter"
    ];
};

in { inherit libaudiopolicyengineconfigurable_pfwwrapper; }
