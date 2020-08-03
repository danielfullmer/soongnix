{ cc_library_static }:
let

libLLVMMCParser = cc_library_static {
    name = "libLLVMMCParser";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMMCParser; }
