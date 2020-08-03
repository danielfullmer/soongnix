{ cc_defaults, cc_library_shared, cc_test }:
let

minijail_common_cflags = [
    "-Wall"
    "-Werror"
];

libavservices_minijail_defaults = cc_defaults {
    name = "libavservices_minijail_defaults";
    srcs = ["minijail.cpp"];
    cflags = minijail_common_cflags;
    shared_libs = [
        "libbase"
        "libminijail"
    ];
};

#  Small library for media.extractor and media.codec sandboxing.
libavservices_minijail = cc_library_shared {
    name = "libavservices_minijail";
    defaults = ["libavservices_minijail_defaults"];
    export_include_dirs = ["."];
};

#  Small library for media.extractor and media.codec sandboxing.
libavservices_minijail_vendor = cc_library_shared {
    name = "libavservices_minijail_vendor";
    vendor = true;
    defaults = ["libavservices_minijail_defaults"];
    export_include_dirs = ["."];
};

#  Unit tests.
libavservices_minijail_unittest = cc_test {
    name = "libavservices_minijail_unittest";
    defaults = ["libavservices_minijail_defaults"];
    srcs = [
        "av_services_minijail_unittest.cpp"
    ];
};

in { inherit libavservices_minijail libavservices_minijail_defaults libavservices_minijail_unittest libavservices_minijail_vendor; }
