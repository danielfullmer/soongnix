{ cc_library_static }:
let

libLLVMExecutionEngine = cc_library_static {
    name = "libLLVMExecutionEngine";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "ExecutionEngine.cpp"
        "ExecutionEngineBindings.cpp"
        "GDBRegistrationListener.cpp"
        "SectionMemoryManager.cpp"
        "TargetSelect.cpp"
    ];
};

subdirs = ["*"];

in { inherit libLLVMExecutionEngine; }
