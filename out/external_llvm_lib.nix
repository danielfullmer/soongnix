{ cc_defaults }:
let

llvm-lib-defaults = cc_defaults {
    name = "llvm-lib-defaults";
    vendor_available = true;
    defaults = ["llvm-defaults"];
    cflags = [
        "-W"
        "-Wall"
        "-Wno-unused-lambda-capture"
        "-Wno-unused-parameter"
    ];
    export_header_lib_headers = ["llvm-headers"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

subdirs = ["*"];

in { inherit llvm-lib-defaults; }
