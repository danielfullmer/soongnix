{ cc_library_shared }:
let

libbatching = cc_library_shared {

    name = "libbatching";
    vendor = true;

    sanitize = GNSS_SANITIZE;

    shared_libs = [
        "libutils"
        "libcutils"
        "liblog"
        "libloc_core"
        "libgps.utils"
        "libdl"
    ];

    srcs = [
        "location_batching.cpp"
        "BatchingAdapter.cpp"
    ];

    header_libs = [
        "libgps.utils_headers"
        "libloc_core_headers"
        "libloc_pla_headers"
        "liblocation_api_headers"
    ];

    cflags = GNSS_CFLAGS;
};

in { inherit libbatching; }
