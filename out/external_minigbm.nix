{ cc_defaults, cc_library_shared }:
let

#  Use of this source code is governed by a BSD-style license that can be
#  found in the LICENSE file.

"gralloc.minigbm_intel_defaults" = cc_defaults {
    name = "gralloc.minigbm_intel_defaults";
    cflags = ["-DDRV_I915"];
};

"gralloc.minigbm_meson_defaults" = cc_defaults {
    name = "gralloc.minigbm_meson_defaults";
    cflags = ["-DDRV_MESON"];
};

"gralloc.minigbm_defaults" = cc_defaults {
    name = "gralloc.minigbm_defaults";

    srcs = [
        "amdgpu.c"
        "drv.c"
        "evdi.c"
        "exynos.c"
        "helpers_array.c"
        "helpers.c"
        "i915.c"
        "marvell.c"
        "mediatek.c"
        "meson.c"
        "msm.c"
        "nouveau.c"
        "radeon.c"
        "rockchip.c"
        "tegra.c"
        "udl.c"
        "vc4.c"
        "vgem.c"
        "virtio_gpu.c"

        "cros_gralloc/cros_gralloc_buffer.cc"
        "cros_gralloc/cros_gralloc_driver.cc"
        "cros_gralloc/cros_gralloc_helpers.cc"
        "cros_gralloc/gralloc0/gralloc0.cc"
    ];

    cflags = [
        "-D_GNU_SOURCE=1"
        "-D_FILE_OFFSET_BITS=64"
        "-Wall"
        "-Wsign-compare"
        "-Wpointer-arith"
        "-Wcast-qual"
        "-Wcast-align"
        "-Wno-unused-parameter"
    ];
    cppflags = ["-std=c++14"];

    #  The preferred path for vendor HALs is /vendor/lib/hw
    vendor = true;
    relative_install_path = "hw";

    header_libs = [
        "libhardware_headers"
        "libnativebase_headers"
        "libsystem_headers"
    ];

    shared_libs = [
        "libcutils"
        "libdrm"

        "libnativewindow"
        "libsync"
        "liblog"
    ];

    static_libs = ["libarect"];
};

"gralloc.minigbm" = cc_library_shared {
    name = "gralloc.minigbm";
    defaults = ["gralloc.minigbm_defaults"];
};

"gralloc.minigbm_intel" = cc_library_shared {
    name = "gralloc.minigbm_intel";
    defaults = [
        "gralloc.minigbm_defaults"
        "gralloc.minigbm_intel_defaults"
    ];
    enabled = false;
    arch = {
        x86 = {
            enabled = true;
        };
        x86_64 = {
            enabled = true;
        };
    };
};

"gralloc.minigbm_meson" = cc_library_shared {
    name = "gralloc.minigbm_meson";
    defaults = [
        "gralloc.minigbm_defaults"
        "gralloc.minigbm_meson_defaults"
    ];
};

libminigbm = cc_library_shared {
    name = "libminigbm";
    defaults = ["gralloc.minigbm_defaults"];
    shared_libs = ["liblog"];
    static_libs = ["libdrm"];

    srcs = [
        "gbm.c"
        "gbm_helpers.c"
    ];

    export_include_dirs = ["."];
};

in { inherit "gralloc.minigbm" "gralloc.minigbm_defaults" "gralloc.minigbm_intel" "gralloc.minigbm_intel_defaults" "gralloc.minigbm_meson" "gralloc.minigbm_meson_defaults" libminigbm; }
