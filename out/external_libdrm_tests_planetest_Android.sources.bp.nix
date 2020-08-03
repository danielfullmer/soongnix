{ cc_defaults }:
let

#  Autogenerated with Android.sources.bp.mk

planetest_common_sources = cc_defaults {
    name = "planetest_common_sources";
    srcs = [
        "bo.c"
        "dev.c"
        "modeset.c"
    ];
};

planetest_sources = cc_defaults {
    name = "planetest_sources";
    srcs = [
        "planetest.c"
    ];
};

atomictest_sources = cc_defaults {
    name = "atomictest_sources";
    srcs = [
        "atomictest.c"
    ];
};

in { inherit atomictest_sources planetest_common_sources planetest_sources; }
