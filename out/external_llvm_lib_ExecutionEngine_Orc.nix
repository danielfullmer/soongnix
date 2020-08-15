{ cc_library_static }:
let

libLLVMOrcJIT = cc_library_static {
    name = "libLLVMOrcJIT";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "ExecutionUtils.cpp"
        "IndirectionUtils.cpp"
        "NullResolver.cpp"
        "OrcABISupport.cpp"
        "OrcCBindings.cpp"
        "OrcError.cpp"
        "OrcMCJITReplacement.cpp"
        "OrcRemoteTargetRPCAPI.cpp"
    ];
};

in { inherit libLLVMOrcJIT; }
