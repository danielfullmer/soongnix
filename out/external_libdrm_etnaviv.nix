{ cc_library_shared }:
let

build = ["Android.sources.bp"];

libdrm_etnaviv = cc_library_shared {
    name = "libdrm_etnaviv";
    defaults = [
        "libdrm_defaults"
        "libdrm_etnaviv_sources"
    ];
    vendor = true;
    shared_libs = ["libdrm"];
};

in { inherit libdrm_etnaviv; }
