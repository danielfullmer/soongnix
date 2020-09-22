{ cc_library_static }:
let

libwifikeystorehal = cc_library_static {
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
        "libcrypto"
        "libcutils"
        "libhidlbase"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
        "liblog"
        "libssl"
        "libutils"
    ];
    export_include_dirs = ["include"];
    cpp_std = "c++17";
};

in { inherit libwifikeystorehal; }
