{ cc_library }:
let

"libstagefright_bufferpool@1.0" = cc_library {
    name = "libstagefright_bufferpool@1.0";
    vendor_available = true;
    srcs = [
        "Accessor.cpp"
        "AccessorImpl.cpp"
        "BufferPoolClient.cpp"
        "BufferStatus.cpp"
        "ClientManager.cpp"
        "Connection.cpp"
    ];
    export_include_dirs = [
        "include"
    ];
    shared_libs = [
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhwbinder"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.media.bufferpool@1.0"
    ];
    export_shared_lib_headers = [
        "libfmq"
        "android.hardware.media.bufferpool@1.0"
    ];
};

in { inherit "libstagefright_bufferpool@1.0"; }
