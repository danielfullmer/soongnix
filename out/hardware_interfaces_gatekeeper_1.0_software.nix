{ cc_binary }:
let

"android.hardware.gatekeeper@1.0-service.software" = cc_binary {
    name = "android.hardware.gatekeeper@1.0-service.software";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.gatekeeper@1.0-service.software.rc"];

    srcs = [
        "service.cpp"
        "SoftGateKeeperDevice.cpp"
    ];

    shared_libs = [
        "android.hardware.gatekeeper@1.0"
        "libbase"
        "libhardware"
        "libhidlbase"
        "libutils"
        "liblog"
        "libcrypto"
        "libgatekeeper"
    ];

    static_libs = ["libscrypt_static"];

    vintf_fragments = ["android.hardware.gatekeeper@1.0-service.software.xml"];
};

in { inherit "android.hardware.gatekeeper@1.0-service.software"; }
