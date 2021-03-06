{ cc_library }:
let

libBlocksRuntime = cc_library {
    name = "libBlocksRuntime";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-function"
        "-DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_INT"
        "-DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_LONG"
    ];
    c_std = "c11";
    clang = true;
    srcs = [
        "data.c"
        "runtime.c"
    ];
};

in { inherit libBlocksRuntime; }
