{ cc_binary }:
let

"android.hardware.radio@1.2-radio-service" = cc_binary {
    name = "android.hardware.radio@1.2-radio-service";
    init_rc = ["android.hardware.radio@1.2-radio-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "Radio.cpp"
        "radio-service.cpp"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.radio@1.2"
        "android.hardware.radio@1.0"
        "android.hardware.radio@1.1"
    ];
};

"android.hardware.radio@1.2-sap-service" = cc_binary {
    name = "android.hardware.radio@1.2-sap-service";
    init_rc = ["android.hardware.radio@1.2-sap-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "Sap.cpp"
        "sap-service.cpp"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.radio@1.2"
        "android.hardware.radio@1.0"
        "android.hardware.radio@1.1"
    ];
};

in { inherit "android.hardware.radio@1.2-radio-service" "android.hardware.radio@1.2-sap-service"; }
