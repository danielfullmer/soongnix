{ cc_library_shared }:
let

build = ["Android.sources.bp"];

libdrm_nouveau = cc_library_shared {
    name = "libdrm_nouveau";
    defaults = [
        "libdrm_defaults"
        "libdrm_nouveau_sources"
    ];
    vendor = true;
    shared_libs = ["libdrm"];
};

in { inherit libdrm_nouveau; }
