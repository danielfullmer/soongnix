{ cc_binary }:
let

"android.hardware.secure_element@1.0-service.st" = cc_binary {
    name = "android.hardware.secure_element@1.0-service.st";
    relative_install_path = "hw";
    init_rc = ["android.hardware.secure_element@1.0-service.st.rc"];
    proprietary = true;
    defaults = ["hidl_defaults"];
    srcs = [
        "StEseService.cpp"
        "SecureElement.cpp"
    ];

    shared_libs = [
        "android.hardware.secure_element@1.0"
        "ese_spi_st"
        "libbase"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
};

in { inherit "android.hardware.secure_element@1.0-service.st"; }
