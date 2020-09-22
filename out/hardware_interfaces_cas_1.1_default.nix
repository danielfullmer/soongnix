{ cc_binary, cc_defaults }:
let

"cas_service_defaults@1.1" = cc_defaults {
    name = "cas_service_defaults@1.1";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "CasImpl.cpp"
        "DescramblerImpl.cpp"
        "MediaCasService.cpp"
        "service.cpp"
        "SharedLibrary.cpp"
        "TypeConvert.cpp"
    ];

    compile_multilib = "32";

    shared_libs = [
        "android.hardware.cas@1.0"
        "android.hardware.cas@1.1"
        "android.hardware.cas.native@1.0"
        "android.hidl.memory@1.0"
        "libbinder"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libutils"
    ];
    header_libs = [
        "libstagefright_foundation_headers"
        "media_plugin_headers"
    ];
};

"android.hardware.cas@1.1-service" = cc_binary {
    name = "android.hardware.cas@1.1-service";
    vintf_fragments = ["android.hardware.cas@1.1-service.xml"];
    defaults = ["cas_service_defaults@1.1"];
    init_rc = ["android.hardware.cas@1.1-service.rc"];
};

"android.hardware.cas@1.1-service-lazy" = cc_binary {
    name = "android.hardware.cas@1.1-service-lazy";
    vintf_fragments = ["android.hardware.cas@1.1-service-lazy.xml"];
    overrides = ["android.hardware.cas@1.1-service"];
    defaults = ["cas_service_defaults@1.1"];
    init_rc = ["android.hardware.cas@1.1-service-lazy.rc"];
    cflags = ["-DLAZY_SERVICE"];
};

in { inherit "android.hardware.cas@1.1-service" "android.hardware.cas@1.1-service-lazy" "cas_service_defaults@1.1"; }
