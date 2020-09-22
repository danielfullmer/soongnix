{ cc_binary, cc_defaults }:
let

cas_service_defaults = cc_defaults {
    name = "cas_service_defaults";
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
        "android.hardware.cas.native@1.0"
        "android.hidl.memory@1.0"
        "libbinder"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libstagefright_foundation"
        "libutils"
    ];
    header_libs = [
        "media_plugin_headers"
    ];
};

"android.hardware.cas@1.0-service" = cc_binary {
    name = "android.hardware.cas@1.0-service";
    vintf_fragments = ["android.hardware.cas@1.0-service.xml"];
    defaults = ["cas_service_defaults"];
    init_rc = ["android.hardware.cas@1.0-service.rc"];
};

"android.hardware.cas@1.0-service-lazy" = cc_binary {
    name = "android.hardware.cas@1.0-service-lazy";
    vintf_fragments = ["android.hardware.cas@1.0-service-lazy.xml"];
    overrides = ["android.hardware.cas@1.0-service"];
    defaults = ["cas_service_defaults"];
    init_rc = ["android.hardware.cas@1.0-service-lazy.rc"];
    cflags = ["-DLAZY_SERVICE"];
};

in { inherit "android.hardware.cas@1.0-service" "android.hardware.cas@1.0-service-lazy" cas_service_defaults; }
