{ cc_library_shared, llndk_library }:
let

libft2 = cc_library_shared {
    name = "libft2";
    host_supported = true;

    #  compile in ARM mode, since the glyph loader/renderer is a hotspot
    #  when loading complex pages in the browser
    #
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    srcs = [
        "src/autofit/autofit.c"
        "src/base/ftbase.c"
        "src/base/ftbbox.c"
        "src/base/ftbitmap.c"
        "src/base/ftdebug.c"
        "src/base/ftfstype.c"
        "src/base/ftgasp.c"
        "src/base/ftglyph.c"
        "src/base/ftinit.c"
        "src/base/ftmm.c"
        "src/base/ftstroke.c"
        "src/base/fttype1.c"
        "src/base/ftsystem.c"
        "src/cid/type1cid.c"
        "src/cff/cff.c"
        "src/gzip/ftgzip.c"
        "src/psaux/psaux.c"
        "src/pshinter/pshinter.c"
        "src/psnames/psnames.c"
        "src/raster/raster.c"
        "src/sfnt/sfnt.c"
        "src/smooth/smooth.c"
        "src/truetype/truetype.c"
        "src/type1/type1.c"
    ];

    export_include_dirs = ["include"];

    cflags = [
        "-W"
        "-Wall"
        "-Werror"

        "-DDARWIN_NO_CARBON"
        "-DFT2_BUILD_LIBRARY"

        "-O2"

        #  Upstream ignores unused parameter warning
        "-Wno-unused-parameter"
        #  Disabling some of modules results in warnings
        "-Wno-unused-variable"
        #  the following is for testing only, and should not be used in final
        #  builds of the product
        #  "-DTT_CONFIG_OPTION_BYTECODE_INTERPRETER",
    ];

    shared_libs = [
        "libpng"
        "libz"
    ];

    target = {
        android = {
            cflags = [
                "-fPIC"
                "-DPIC"
            ];
        };
        not_windows = {
            cflags = [
                "-fPIC"
                "-DPIC"
            ];
        };
        windows = {
            enabled = true;
        };
    };
};

libft2 = llndk_library {
    name = "libft2";
    vendor_available = false;
    symbol_file = "libft2.map.txt";
    export_include_dirs = ["include"];
};

in { inherit libft2; }
