{ cc_library_static }:
let

libLLVMAArch64Info = cc_library_static {
    name = "libLLVMAArch64Info";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAArch64Info; }
