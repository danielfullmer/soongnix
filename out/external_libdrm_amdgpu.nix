{ cc_library_shared }:
let

build = ["Android.sources.bp"];

libdrm_amdgpu = cc_library_shared {
    name = "libdrm_amdgpu";

    cflags = [
        "-DAMDGPU_ASIC_ID_TABLE=\"/vendor/etc/hwdata/amdgpu.ids\""
    ];

    defaults = [
        "libdrm_defaults"
        "libdrm_amdgpu_sources"
    ];
    vendor = true;
    shared_libs = ["libdrm"];
};

in { inherit libdrm_amdgpu; }
