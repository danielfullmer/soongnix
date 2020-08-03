{ cc_binary, cc_defaults }:
let

f2fs-io-defaults = cc_defaults {
    name = "f2fs-io-defaults";
    cflags = [
        "-Wno-unused-function"
    ];
};

f2fs_io = cc_binary {
    name = "f2fs_io";
    defaults = ["f2fs-io-defaults"];
    srcs = [
        "f2fs_io.c"
    ];
    product_specific = true;
};

in { inherit f2fs-io-defaults f2fs_io; }
