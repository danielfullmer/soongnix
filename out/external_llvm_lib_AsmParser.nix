{ cc_library_static }:
let

libLLVMAsmParser = cc_library_static {
    name = "libLLVMAsmParser";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAsmParser; }
