{ cc_library_headers, cc_library_shared }:
let

libaudiohal = cc_library_shared {
    name = "libaudiohal";

    srcs = [
        "DevicesFactoryHalInterface.cpp"
        "EffectsFactoryHalInterface.cpp"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    shared_libs = [
        "android.hardware.audio.effect@2.0"
        "android.hardware.audio.effect@4.0"
        "android.hardware.audio.effect@5.0"
        "android.hardware.audio@2.0"
        "android.hardware.audio@4.0"
        "android.hardware.audio@5.0"
        "libaudiohal@2.0"
        "libaudiohal@4.0"
        "libaudiohal@5.0"
        "libutils"
    ];

    header_libs = [
        "libaudiohal_headers"
    ];
};

libaudiohal_deathhandler = cc_library_shared {
    name = "libaudiohal_deathhandler";

    srcs = [
        "HalDeathHandlerHidl.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libhidlbase"
        "libutils"
        "liblog"
    ];

    header_libs = [
        "libaudiohal_headers"
    ];
};

libaudiohal_headers = cc_library_headers {
    name = "libaudiohal_headers";

    export_include_dirs = ["include"];
};

in { inherit libaudiohal libaudiohal_deathhandler libaudiohal_headers; }
