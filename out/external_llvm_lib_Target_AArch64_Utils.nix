{ cc_library_static }:
let

libLLVMAArch64Utils = cc_library_static {
    name = "libLLVMAArch64Utils";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAArch64Utils; }
