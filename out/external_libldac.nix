{ cc_library_shared }:
let

libldacBT_enc = cc_library_shared {
    name = "libldacBT_enc";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
    export_include_dirs = ["inc"];
    srcs = [
        "src/ldaclib.c"
        "src/ldacBT.c"
    ];
    #  -D_32BIT_FIXED_POINT should be added to cflags for devices without a FPU
    #  unit such as ARM Cortex-R series or external 32-bit DSPs.
    cflags = [
        "-O2"
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

libldacBT_abr = cc_library_shared {
    name = "libldacBT_abr";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
    export_include_dirs = ["abr/inc"];
    srcs = ["abr/src/ldacBT_abr.c"];
    shared_libs = ["libldacBT_enc"];
    cflags = [
        "-O2"
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

in { inherit libldacBT_abr libldacBT_enc; }
