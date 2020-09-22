{ cc_defaults, cc_library_static, cc_test }:
let

igt-gpu-tools-defaults = cc_defaults {
    name = "igt-gpu-tools-defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        "-DHAVE_GETTID"
        "-DHAVE_LIBGEN_H"
        "-DHAVE_MEMFD_CREATE"
    ];
    static_libs = [
        "libelf"
        "libkmod"
        "libion"
        "liblog"
    ];
    shared_libs = ["libdrm"];
};

igt-gpu-tools = cc_library_static {
    name = "igt-gpu-tools";
    defaults = ["igt-gpu-tools-defaults"];
    srcs = [
        "lib/drmtest.c"
        "lib/gem.c"
        "lib/gem_msm.c"
        "lib/igt_aux.c"
        "lib/igt_color_encoding.c"
        "lib/igt_core.c"
        "lib/igt_debugfs.c"
        "lib/igt_device.c"
        "lib/igt_dummy.c"
        "lib/igt_dummyload.c"
        "lib/igt_fb.c"
        "lib/igt_kmod.c"
        "lib/igt_kms.c"
        "lib/igt_pm.c"
        "lib/igt_stats.c"
        "lib/igt_sysfs.c"
        "lib/ion.c"
        "lib/ioctl_wrappers.c"
        "lib/sw_sync.c"
        "lib/i915/gem_mman.c"
        "lib/uwildmat/uwildmat.c"
    ];
    export_include_dirs = [
        "include"
        "lib"
        "lib/stubs/drm"
        "prebuilt-intermediates"
    ];
};

igt-gpu-tools-test-defaults = cc_defaults {
    name = "igt-gpu-tools-test-defaults";
    defaults = ["igt-gpu-tools-defaults"];
    static_libs = ["igt-gpu-tools"];
};

gem_blt = cc_test {
    name = "gem_blt";
    defaults = ["igt-gpu-tools-test-defaults"];
    srcs = ["benchmarks/gem_blt.c"];
};

kms_flip = cc_test {
    name = "kms_flip";
    defaults = ["igt-gpu-tools-test-defaults"];
    srcs = ["tests/kms_flip.c"];
};

kms_atomic = cc_test {
    name = "kms_atomic";
    defaults = ["igt-gpu-tools-test-defaults"];
    srcs = ["tests/kms_atomic.c"];
};

ion_fb = cc_test {
    name = "ion_fb";
    defaults = ["igt-gpu-tools-test-defaults"];
    srcs = ["tests/ion_fb.c"];
};

kms_vblank = cc_test {
    name = "kms_vblank";
    defaults = ["igt-gpu-tools-test-defaults"];
    srcs = ["tests/kms_vblank.c"];
};

in { inherit gem_blt igt-gpu-tools igt-gpu-tools-defaults igt-gpu-tools-test-defaults ion_fb kms_atomic kms_flip kms_vblank; }
