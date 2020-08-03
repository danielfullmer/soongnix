{ cc_library_shared }:
let

libpolicy-subsystem = cc_library_shared {
    name = "libpolicy-subsystem";
    srcs = [
        "PolicySubsystemBuilder.cpp"
        "PolicySubsystem.cpp"
        "InputSource.cpp"
        "Stream.cpp"
        "ProductStrategy.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-fvisibility-inlines-hidden"
        "-fvisibility=hidden"
    ];
    header_libs = [
        "libbase_headers"
        "libaudiopolicycommon"
        "libaudioclient_headers"
        "libaudiopolicyengine_interface_headers"
        "libaudiopolicyengineconfigurable_interface_headers"
    ];
    static_libs = [
        "libaudiopolicycomponents"
        "libaudiopolicyengine_common"
        "libpfw_utility"
    ];
    shared_libs = [
        "libaudiopolicyengineconfigurable"
        "liblog"
        "libutils"
        "libmedia_helper"
        "libparameter"
    ];
};

in { inherit libpolicy-subsystem; }
