{ cc_library_static }:
let

libLLVMInterpreter = cc_library_static {
    name = "libLLVMInterpreter";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "Execution.cpp"
        "ExternalFunctions.cpp"
        "Interpreter.cpp"
    ];
};

in { inherit libLLVMInterpreter; }
