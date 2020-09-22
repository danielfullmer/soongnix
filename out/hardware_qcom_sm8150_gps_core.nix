{ cc_library_headers, cc_library_shared }:
let

libloc_core = cc_library_shared {

    name = "libloc_core";
    vendor = true;

    sanitize = GNSS_SANITIZE;

    shared_libs = [
        "liblog"
        "libutils"
        "libcutils"
        "libgps.utils"
        "libdl"
        "liblog"
    ];

    srcs = [
        "LocApiBase.cpp"
        "LocAdapterBase.cpp"
        "ContextBase.cpp"
        "LocContext.cpp"
        "loc_core_log.cpp"
        "data-items/DataItemsFactoryProxy.cpp"
        "SystemStatusOsObserver.cpp"
        "SystemStatus.cpp"
    ];

    cflags = [
        "-fno-short-enums"
        "-D_ANDROID_"
    ] ++ GNSS_CFLAGS;

    local_include_dirs = [
        "data-items"
        "observer"
    ];

    header_libs = [
        "libutils_headers"
        "libgps.utils_headers"
        "libloc_pla_headers"
        "liblocation_api_headers"
    ];

};

libloc_core_headers = cc_library_headers {

    name = "libloc_core_headers";
    vendor = true;
    export_include_dirs = ["."] ++ [
        "data-items"
        "observer"
    ];
};

in { inherit libloc_core libloc_core_headers; }
