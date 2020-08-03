{ cc_library_static }:
let

libLLVMAArch64Desc = cc_library_static {
    name = "libLLVMAArch64Desc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAArch64Desc; }
