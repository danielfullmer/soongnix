{ cc_library_shared }:
let



libgeofencing = cc_library_shared {

    name = "libgeofencing";
    vendor = true;

    sanitize = GNSS_SANITIZE;

    srcs = [
        "GeofenceAdapter.cpp"
        "location_geofence.cpp"
    ];

    shared_libs = [
        "libutils"
        "libcutils"
        "libgps.utils"
        "liblog"
        "libloc_core"
    ];

    header_libs = [
        "libgps.utils_headers"
        "libloc_core_headers"
        "libloc_pla_headers"
        "liblocation_api_headers"
    ];

    cflags = GNSS_CFLAGS;
};

in { inherit libgeofencing; }
