{ cc_binary }:
let

"android.hardware.radio.config@1.0-service" = cc_binary {
    name = "android.hardware.radio.config@1.0-service";
    init_rc = ["android.hardware.radio.config@1.0-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "RadioConfig.cpp"
        "RadioConfigIndication.cpp"
        "RadioConfigResponse.cpp"
        "service.cpp"
    ];
    shared_libs = [
        "libhidlbase"
        "liblog"
        "libutils"
        "android.hardware.radio.config@1.0"
        "android.hardware.radio@1.0"
    ];
};

in { inherit "android.hardware.radio.config@1.0-service"; }
