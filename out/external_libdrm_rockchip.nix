{ cc_library_shared }:
let

libdrm_rockchip = cc_library_shared {
    name = "libdrm_rockchip";
    vendor = true;
    shared_libs = ["libdrm"];

    srcs = ["rockchip_drm.c"];

    cflags = [
        "-DHAVE_LIBDRM_ATOMIC_PRIMITIVES=1"
        "-Wall"
        "-Werror"
    ];
};

in { inherit libdrm_rockchip; }
