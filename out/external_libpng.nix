{ cc_defaults, cc_library, cc_library_static, cc_test }:
let

#  We need to build this for both the device (as a shared library)
#  and the host (as a static library for tools to use).

libpng-defaults = cc_defaults {
    name = "libpng-defaults";
    exclude_srcs = [
        "example.c"
        "pngtest.c"
    ];
    srcs = [
        "example.c"
        "png.c"
        "pngerror.c"
        "pngget.c"
        "pngmem.c"
        "pngpread.c"
        "pngread.c"
        "pngrio.c"
        "pngrtran.c"
        "pngrutil.c"
        "pngset.c"
        "pngtest.c"
        "pngtrans.c"
        "pngwio.c"
        "pngwrite.c"
        "pngwtran.c"
        "pngwutil.c"
    ];
    cflags = [
        "-std=gnu89"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    arch = {
        arm = {
            srcs = ["arm/*"];
        };
        arm64 = {
            srcs = ["arm/*"];
        };
        x86 = {
            srcs = ["intel/*"];
            #  Disable optimizations because they crash on windows
            #  cflags: ["-DPNG_INTEL_SSE_OPT=1"],
        };
        x86_64 = {
            srcs = ["intel/*"];
            #  Disable optimizations because they crash on windows
            #  cflags: ["-DPNG_INTEL_SSE_OPT=1"],
        };
    };
    shared_libs = ["libz"];
    target = {
        android_x86 = {
            cflags = ["-DPNG_INTEL_SSE_OPT=1"];
        };
        android_x86_64 = {
            cflags = ["-DPNG_INTEL_SSE_OPT=1"];
        };
    };
    export_include_dirs = ["."];
};

#  For the host and device platform
#  =====================================================

libpng = cc_library {
    name = "libpng";
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    recovery_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    host_supported = true;
    defaults = ["libpng-defaults"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

#  For the device (static) for NDK
#  =====================================================

libpng_ndk = cc_library_static {
    name = "libpng_ndk";
    defaults = ["libpng-defaults"];
    cflags = ["-ftrapv"];

    shared_libs = ["libz"];
    sdk_version = "14";
};

#  For testing
#  =====================================================

pngtest = cc_test {
    host_supported = true;
    gtest = false;
    srcs = ["pngtest.c"];
    name = "pngtest";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libpng"
        "libz"
    ];
};

in { inherit libpng libpng-defaults libpng_ndk pngtest; }
