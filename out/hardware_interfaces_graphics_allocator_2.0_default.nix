{ cc_binary, cc_library_shared }:
let

"android.hardware.graphics.allocator@2.0-impl" = cc_library_shared {
    name = "android.hardware.graphics.allocator@2.0-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["passthrough.cpp"];
    header_libs = [
        "android.hardware.graphics.allocator@2.0-passthrough"
    ];
    shared_libs = [
        "android.hardware.graphics.allocator@2.0"
        "libbase"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
    cflags = ["-DLOG_TAG=\"AllocatorHal\""];
};

"android.hardware.graphics.allocator@2.0-service" = cc_binary {
    name = "android.hardware.graphics.allocator@2.0-service";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = ["service.cpp"];
    init_rc = ["android.hardware.graphics.allocator@2.0-service.rc"];

    shared_libs = [
        "android.hardware.graphics.allocator@2.0"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
};

in { inherit "android.hardware.graphics.allocator@2.0-impl" "android.hardware.graphics.allocator@2.0-service"; }
