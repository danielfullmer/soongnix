{ cc_library_static }:
let

libLLVMDebugInfoPDB = cc_library_static {
    name = "libLLVMDebugInfoPDB";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "*.cpp"
        "Raw/*.cpp"
    ];
};

in { inherit libLLVMDebugInfoPDB; }
