{ cc_library_static }:
let

libLLVMInterpreter = cc_library_static {
    name = "libLLVMInterpreter";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMInterpreter; }
