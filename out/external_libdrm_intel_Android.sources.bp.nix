{ cc_defaults }:
let

#  Autogenerated with Android.sources.bp.mk

libdrm_intel_sources = cc_defaults {
    name = "libdrm_intel_sources";
    srcs = [
        "intel_bufmgr.c"
        "intel_bufmgr_fake.c"
        "intel_bufmgr_gem.c"
        "intel_decode.c"
        "intel_chipset.c"
        "mm.c"
    ];
};

in { inherit libdrm_intel_sources; }
