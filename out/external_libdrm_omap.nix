{ cc_library_shared }:
let

build = ["Android.sources.bp"];

libdrm_omap = cc_library_shared {
    name = "libdrm_omap";
    defaults = [
        "libdrm_defaults"
        "libdrm_omap_sources"
    ];
    vendor = true;

    shared_libs = ["libdrm"];
};

in { inherit libdrm_omap; }
