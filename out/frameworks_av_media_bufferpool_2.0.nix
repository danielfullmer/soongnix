{ cc_defaults, cc_library }:
let

"libstagefright_bufferpool@2.0-default" = cc_defaults {
    name = "libstagefright_bufferpool@2.0-default";
    srcs = [
        "Accessor.cpp"
        "AccessorImpl.cpp"
        "BufferPoolClient.cpp"
        "BufferStatus.cpp"
        "ClientManager.cpp"
        "Connection.cpp"
        "Observer.cpp"
    ];
    export_include_dirs = [
        "include"
    ];
    shared_libs = [
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libutils"
        "android.hardware.media.bufferpool@2.0"
    ];
    export_shared_lib_headers = [
        "libfmq"
        "android.hardware.media.bufferpool@2.0"
    ];
};

"libstagefright_bufferpool@2.0.1" = cc_library {
    name = "libstagefright_bufferpool@2.0.1";
    defaults = ["libstagefright_bufferpool@2.0-default"];
    vendor_available = true;
    min_sdk_version = "29";
    #  TODO: b/147147992
    double_loadable = true;
    cflags = [
        "-DBUFFERPOOL_CLONE_HANDLES"
    ];
};

#  Deprecated. Do not use. Use libstagefright_bufferpool@2.0.1 instead.
"libstagefright_bufferpool@2.0" = cc_library {
    name = "libstagefright_bufferpool@2.0";
    defaults = ["libstagefright_bufferpool@2.0-default"];
    vendor_available = true;
    #  TODO: b/147147992
    double_loadable = true;
    vndk = {
        enabled = true;
    };
};

in { inherit "libstagefright_bufferpool@2.0" "libstagefright_bufferpool@2.0-default" "libstagefright_bufferpool@2.0.1"; }
