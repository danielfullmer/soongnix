{ cc_library_shared }:
let

libwifikeystorehal = cc_library_shared {
    name = "libwifikeystorehal";
    cppflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    srcs = ["keystore.cpp"];
    shared_libs = [
        "android.system.wifi.keystore@1.0"
        "libbase"
        "libbinder"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
        "liblog"
        "libutils"
    ];
    export_include_dirs = ["include"];
    cpp_std = "c++17";
};

in { inherit libwifikeystorehal; }
