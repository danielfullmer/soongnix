{ cc_library_static }:
let

libfdt = cc_library_static {
    name = "libfdt";
    host_supported = true;

    cflags = [
        "-Werror"
        "-Wno-macro-redefined"
        "-Wno-sign-compare"
    ];
    srcs = [
        "fdt.c"
        "fdt_ro.c"
        "fdt_wip.c"
        "fdt_sw.c"
        "fdt_rw.c"
        "fdt_strerror.c"
        "fdt_empty_tree.c"
        "fdt_addresses.c"
        "fdt_overlay.c"
        "acpi.c"
    ];
    export_include_dirs = ["."];
};

in { inherit libfdt; }
