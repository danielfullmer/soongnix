{ cc_binary, cc_defaults }:
let

tuner_service_defaults = cc_defaults {
    name = "tuner_service_defaults";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "Filter.cpp"
        "Frontend.cpp"
        "Descrambler.cpp"
        "Demux.cpp"
        "Dvr.cpp"
        "TimeFilter.cpp"
        "Tuner.cpp"
        "Lnb.cpp"
        "service.cpp"
    ];

    compile_multilib = "first";

    shared_libs = [
        "android.hardware.tv.tuner@1.0"
        "android.hidl.memory@1.0"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidlmemory"
        "libion"
        "liblog"
        "libstagefright_foundation"
        "libutils"
    ];
    header_libs = [
        "media_plugin_headers"
    ];
};

"android.hardware.tv.tuner@1.0-service" = cc_binary {
    name = "android.hardware.tv.tuner@1.0-service";
    vintf_fragments = ["android.hardware.tv.tuner@1.0-service.xml"];
    defaults = ["tuner_service_defaults"];
    init_rc = ["android.hardware.tv.tuner@1.0-service.rc"];
};

"android.hardware.tv.tuner@1.0-service-lazy" = cc_binary {
    name = "android.hardware.tv.tuner@1.0-service-lazy";
    vintf_fragments = ["android.hardware.tv.tuner@1.0-service-lazy.xml"];
    overrides = ["android.hardware.tv.tuner@1.0-service"];
    defaults = ["tuner_service_defaults"];
    init_rc = ["android.hardware.tv.tuner@1.0-service-lazy.rc"];
    cflags = ["-DLAZY_SERVICE"];
};

in { inherit "android.hardware.tv.tuner@1.0-service" "android.hardware.tv.tuner@1.0-service-lazy" tuner_service_defaults; }
