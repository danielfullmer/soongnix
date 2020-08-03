{ cc_defaults, cc_library_headers }:
let

iptables_headers = cc_library_headers {
    name = "iptables_headers";
    export_include_dirs = ["include"];
};

iptables_config_header = cc_library_headers {
    name = "iptables_config_header";
    export_include_dirs = ["."];
};

iptables_iptables_headers = cc_library_headers {
    name = "iptables_iptables_headers";
    export_include_dirs = ["iptables"];
};

iptables_defaults = cc_defaults {
    name = "iptables_defaults";

    cflags = [
        "-D_LARGEFILE_SOURCE=1"
        "-D_LARGE_FILES"
        "-D_FILE_OFFSET_BITS=64"
        "-D_REENTRANT"

        "-DENABLE_IPV4"
        "-DENABLE_IPV6"

        "-Wall"
        "-Werror"
        "-Wno-pointer-arith"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];

    header_libs = ["iptables_headers"];
};

in { inherit iptables_config_header iptables_defaults iptables_headers iptables_iptables_headers; }
