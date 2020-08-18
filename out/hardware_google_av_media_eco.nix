{ cc_library_shared }:
let

libmedia_ecoservice = cc_library_shared {
    name = "libmedia_ecoservice";
    vendor_available = true;

    srcs = [
        "aidl/android/media/eco/IECOService.aidl"
        "aidl/android/media/eco/IECOSession.aidl"
        "aidl/android/media/eco/IECOServiceStatsProvider.aidl"
        "aidl/android/media/eco/IECOServiceInfoListener.aidl"
        "ECOData.cpp"
        "ECODebug.cpp"
        "ECOService.cpp"
        "ECOSession.cpp"
        "ECOUtils.cpp"
    ];

    aidl = {
        local_include_dirs = [
            "include"
            "aidl"
        ];
        export_aidl_headers = true;
    };

    cflags = [
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = [
        "include"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];

    export_include_dirs = [
        "include"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = false; #  true,
        diag = {
            cfi = false; #  true,
        };
    };

    ldflags = ["-Wl,-Bsymbolic"];
};

in { inherit libmedia_ecoservice; }
