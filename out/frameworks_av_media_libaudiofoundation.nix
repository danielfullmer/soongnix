{ cc_library, cc_library_headers }:
let

libaudiofoundation_headers = cc_library_headers {
    name = "libaudiofoundation_headers";
    vendor_available = true;
    min_sdk_version = "29";

    export_include_dirs = ["include"];
    header_libs = [
        "libaudio_system_headers"
        "libmedia_helper_headers"
    ];
    export_header_lib_headers = [
        "libaudio_system_headers"
        "libmedia_helper_headers"
    ];
};

libaudiofoundation = cc_library {
    name = "libaudiofoundation";
    vendor_available = true;
    double_loadable = true;

    srcs = [
        "AudioContainers.cpp"
        "AudioDeviceTypeAddr.cpp"
        "AudioGain.cpp"
        "AudioPort.cpp"
        "AudioProfile.cpp"
        "DeviceDescriptorBase.cpp"
    ];

    shared_libs = [
        "libaudioutils"
        "libbase"
        "libbinder"
        "liblog"
        "libmedia_helper"
        "libutils"
    ];

    header_libs = [
        "libaudiofoundation_headers"
    ];

    export_header_lib_headers = [
        "libaudiofoundation_headers"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit libaudiofoundation libaudiofoundation_headers; }
