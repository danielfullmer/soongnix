{ cc_binary, cc_defaults }:
let

"cas_service_defaults@1.2" = cc_defaults {
    name = "cas_service_defaults@1.2";
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
        "android.hardware.cas@1.2"
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

"android.hardware.cas@1.2-service" = cc_binary {
    name = "android.hardware.cas@1.2-service";
    vintf_fragments = ["android.hardware.cas@1.2-service.xml"];
    defaults = ["cas_service_defaults@1.2"];
    init_rc = ["android.hardware.cas@1.2-service.rc"];
};

"android.hardware.cas@1.2-service-lazy" = cc_binary {
    name = "android.hardware.cas@1.2-service-lazy";
    vintf_fragments = ["android.hardware.cas@1.2-service-lazy.xml"];
    overrides = ["android.hardware.cas@1.2-service"];
    defaults = ["cas_service_defaults@1.2"];
    init_rc = ["android.hardware.cas@1.2-service-lazy.rc"];
    cflags = ["-DLAZY_SERVICE"];
};

in { inherit "android.hardware.cas@1.2-service" "android.hardware.cas@1.2-service-lazy" "cas_service_defaults@1.2"; }
