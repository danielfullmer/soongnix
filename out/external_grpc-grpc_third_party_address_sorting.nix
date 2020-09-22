{ cc_library_static }:
let

libaddress_sorting = cc_library_static {
    name = "libaddress_sorting";
    defaults = ["grpc_defaults"];
    srcs = [
        "address_sorting.c"
        "address_sorting_posix.c"
        "address_sorting_windows.c"
    ];
    local_include_dirs = [
        "include"
        "include/address_sorting"
    ];
};

in { inherit libaddress_sorting; }
