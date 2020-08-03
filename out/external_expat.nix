{ cc_library }:
let

#  We need to build this for both the device (as a shared library)
#  and the host (as a static library for tools to use).

libexpat = cc_library {
    name = "libexpat";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    host_supported = true;
    unique_host_soname = true;
    sdk_version = "9";

    srcs = [
        "lib/loadlibrary.c"
        "lib/xmlparse.c"
        "lib/xmlrole.c"
        "lib/xmltok.c"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wmissing-prototypes"
        "-Wstrict-prototypes"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
        "-Wno-missing-field-initializers"
        "-fexceptions"
        "-DHAVE_EXPAT_CONFIG_H"
        "-UWIN32_LEAN_AND_MEAN"
    ];

    target = {
        darwin = {
            cflags = ["-fno-common"];
        };

        windows = {
            enabled = true;
        };
    };

    local_include_dirs = ["lib"];
    export_include_dirs = ["lib"];
};

in { inherit libexpat; }
