{ cc_library_shared }:
let

build = ["Android.sources.bp"];

libdrm_radeon = cc_library_shared {
    name = "libdrm_radeon";
    defaults = [
        "libdrm_defaults"
        "libdrm_radeon_sources"
    ];
    vendor = true;
    shared_libs = ["libdrm"];
};

in { inherit libdrm_radeon; }
