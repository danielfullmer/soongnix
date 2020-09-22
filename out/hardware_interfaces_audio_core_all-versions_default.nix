{ cc_defaults, cc_library_shared }:
let

"android.hardware.audio-impl_default" = cc_defaults {
    name = "android.hardware.audio-impl_default";
    relative_install_path = "hw";
    proprietary = true;
    vendor = true;
    srcs = [
        "Conversions.cpp"
        "Device.cpp"
        "DevicesFactory.cpp"
        "ParametersUtil.cpp"
        "PrimaryDevice.cpp"
        "Stream.cpp"
        "StreamIn.cpp"
        "StreamOut.cpp"
    ];

    defaults = ["hidl_defaults"];

    export_include_dirs = ["include"];

    static_libs = [
        "libaudiofoundation"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libmedia_helper"
        "libutils"
        "android.hardware.audio.common-util"
    ];

    header_libs = [
        "android.hardware.audio.common.util@all-versions"
        "libaudioclient_headers"
        "libaudio_system_headers"
        "libhardware_headers"
        "libmedia_headers"
    ];
};

"android.hardware.audio@2.0-impl" = cc_library_shared {
    name = "android.hardware.audio@2.0-impl";
    defaults = ["android.hardware.audio-impl_default"];
    shared_libs = [
        "android.hardware.audio@2.0"
        "android.hardware.audio.common@2.0"
        "android.hardware.audio.common@2.0-util"
    ];
    cflags = [
        "-DMAJOR_VERSION=2"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"android.hardware.audio@4.0-impl" = cc_library_shared {
    name = "android.hardware.audio@4.0-impl";
    defaults = ["android.hardware.audio-impl_default"];

    shared_libs = [
        "android.hardware.audio@4.0"
        "android.hardware.audio.common@4.0"
        "android.hardware.audio.common@4.0-util"
    ];
    cflags = [
        "-DMAJOR_VERSION=4"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"android.hardware.audio@5.0-impl" = cc_library_shared {
    name = "android.hardware.audio@5.0-impl";
    defaults = ["android.hardware.audio-impl_default"];
    shared_libs = [
        "android.hardware.audio@5.0"
        "android.hardware.audio.common@5.0"
        "android.hardware.audio.common@5.0-util"
    ];
    cflags = [
        "-DMAJOR_VERSION=5"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"android.hardware.audio@6.0-impl" = cc_library_shared {
    name = "android.hardware.audio@6.0-impl";
    defaults = ["android.hardware.audio-impl_default"];
    shared_libs = [
        "android.hardware.audio@6.0"
        "android.hardware.audio.common@6.0"
        "android.hardware.audio.common@6.0-util"
    ];
    cflags = [
        "-DMAJOR_VERSION=6"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

in { inherit "android.hardware.audio-impl_default" "android.hardware.audio@2.0-impl" "android.hardware.audio@4.0-impl" "android.hardware.audio@5.0-impl" "android.hardware.audio@6.0-impl"; }
