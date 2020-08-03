{ cc_library_shared }:
let

libmediametrics = cc_library_shared {
    name = "libmediametrics";

    srcs = [
        "IMediaAnalyticsService.cpp"
        "MediaAnalyticsItem.cpp"
        "MediaMetrics.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];

    export_include_dirs = ["include"];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    #  enumerate stable entry points, for apex use
    stubs = {
        symbol_file = "libmediametrics.map.txt";
        versions = [
            "1"
        ];
    };
};

in { inherit libmediametrics; }
