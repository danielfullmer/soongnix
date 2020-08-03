{ cc_library_shared }:
let

build = ["Android.sources.bp"];

libkms = cc_library_shared {
    name = "libkms";
    defaults = [
        "libdrm_defaults"
        "libkms_sources"
        "libkms_vmwgfx_sources"
        "libkms_intel_sources"
        "libkms_nouveau_sources"
        "libkms_radeon_sources"
    ];
    vendor = true;
    shared_libs = ["libdrm"];
};

in { inherit libkms; }
