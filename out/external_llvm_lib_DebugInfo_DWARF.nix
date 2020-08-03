{ cc_library_static }:
let

libLLVMDebugInfoDWARF = cc_library_static {
    name = "libLLVMDebugInfoDWARF";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMDebugInfoDWARF; }
