{ cc_library_shared }:
let

build = ["Android.sources.bp"];

libdrm_freedreno = cc_library_shared {
    name = "libdrm_freedreno";
    defaults = [
        "libdrm_defaults"
        "libdrm_freedreno_sources"
    ];
    vendor = true;
    shared_libs = ["libdrm"];
};

in { inherit libdrm_freedreno; }
