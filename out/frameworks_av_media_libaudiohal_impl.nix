{ cc_defaults, cc_library_shared }:
let

libaudiohal_default = cc_defaults {
    name = "libaudiohal_default";

    srcs = [
        "DeviceHalLocal.cpp"
        "DevicesFactoryHalHybrid.cpp"
        "DevicesFactoryHalLocal.cpp"
        "StreamHalLocal.cpp"

        "ConversionHelperHidl.cpp"
        "DeviceHalHidl.cpp"
        "DevicesFactoryHalHidl.cpp"
        "EffectBufferHalHidl.cpp"
        "EffectHalHidl.cpp"
        "EffectsFactoryHalHidl.cpp"
        "StreamHalHidl.cpp"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-fvisibility=hidden"
    ];
    shared_libs = [
        "android.hardware.audio.common-util"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libaudiofoundation"
        "libaudiohal_deathhandler"
        "libaudioutils"
        "libbase"
        "libbinder"
        "libcutils"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libmedia_helper"
        "libmediautils"
        "libutils"
    ];
    header_libs = [
        "android.hardware.audio.common.util@all-versions"
        "libaudioclient_headers"
        "libaudiohal_headers"
    ];

    export_shared_lib_headers = [
        "libfmq"
    ];
};

"libaudiohal@2.0" = cc_library_shared {
    name = "libaudiohal@2.0";
    defaults = ["libaudiohal_default"];
    shared_libs = [
        "android.hardware.audio.common@2.0"
        "android.hardware.audio.common@2.0-util"
        "android.hardware.audio.effect@2.0"
        "android.hardware.audio@2.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=2"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"libaudiohal@4.0" = cc_library_shared {
    name = "libaudiohal@4.0";
    defaults = ["libaudiohal_default"];
    shared_libs = [
        "android.hardware.audio.common@4.0"
        "android.hardware.audio.common@4.0-util"
        "android.hardware.audio.effect@4.0"
        "android.hardware.audio@4.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=4"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"libaudiohal@5.0" = cc_library_shared {
    name = "libaudiohal@5.0";
    defaults = ["libaudiohal_default"];
    shared_libs = [
        "android.hardware.audio.common@5.0"
        "android.hardware.audio.common@5.0-util"
        "android.hardware.audio.effect@5.0"
        "android.hardware.audio@5.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=5"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

"libaudiohal@6.0" = cc_library_shared {
    name = "libaudiohal@6.0";
    defaults = ["libaudiohal_default"];
    shared_libs = [
        "android.hardware.audio.common@6.0"
        "android.hardware.audio.common@6.0-util"
        "android.hardware.audio.effect@6.0"
        "android.hardware.audio@6.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=6"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

in { inherit "libaudiohal@2.0" "libaudiohal@4.0" "libaudiohal@5.0" "libaudiohal@6.0" libaudiohal_default; }
