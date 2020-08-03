{ cc_library_shared }:
let

libdrm_tegra = cc_library_shared {
    name = "libdrm_tegra";
    vendor = true;
    shared_libs = ["libdrm"];

    srcs = ["tegra.c"];

    cflags = [
        "-DHAVE_LIBDRM_ATOMIC_PRIMITIVES=1"
        "-Wall"
        "-Werror"
        "-Wno-unused-variable"
    ];
};

in { inherit libdrm_tegra; }
