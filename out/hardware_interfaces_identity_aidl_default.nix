{ cc_binary }:
let

"android.hardware.identity-service.example" = cc_binary {
    name = "android.hardware.identity-service.example";
    relative_install_path = "hw";
    init_rc = ["identity-default.rc"];
    vintf_fragments = ["identity-default.xml"];
    vendor = true;
    cflags = [
        "-Wall"
        "-Wextra"
    ];
    shared_libs = [
        "libbase"
        "libbinder_ndk"
        "libcppbor"
        "libcrypto"
        "liblog"
        "libutils"
        "android.hardware.identity-support-lib"
        "android.hardware.identity-ndk_platform"
        "android.hardware.keymaster-ndk_platform"
    ];
    srcs = [
        "IdentityCredential.cpp"
        "IdentityCredentialStore.cpp"
        "WritableIdentityCredential.cpp"
        "Util.cpp"
        "service.cpp"
    ];
};

in { inherit "android.hardware.identity-service.example"; }
