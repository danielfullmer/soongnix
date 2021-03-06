{ cc_binary }:
let

"android.hardware.authsecret@1.0-service" = cc_binary {
    name = "android.hardware.authsecret@1.0-service";
    init_rc = ["android.hardware.authsecret@1.0-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "service.cpp"
        "AuthSecret.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.authsecret@1.0"
    ];
};

in { inherit "android.hardware.authsecret@1.0-service"; }
