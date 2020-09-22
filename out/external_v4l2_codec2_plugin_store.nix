{ cc_library_shared }:
let

libc2plugin_store = cc_library_shared {
    name = "libc2plugin_store";
    vendor = true;

    defaults = [
        "libcodec2-impl-defaults"
    ];

    srcs = [
        "C2VdaBqBlockPool.cpp"
        "V4L2PluginStore.cpp"
        "VendorAllocatorLoader.cpp"
    ];
    export_include_dirs = [
        "include"
    ];

    header_libs = [
        "libcodec2_internal"
    ];
    shared_libs = [
        "android.hardware.graphics.bufferqueue@2.0"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libnativewindow"
        "liblog"
        "libstagefright_bufferqueue_helper"
        "libstagefright_foundation"
        "libui"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit libc2plugin_store; }
