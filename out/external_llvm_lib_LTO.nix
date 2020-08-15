{ cc_library_static }:
let

libLLVMLTO = cc_library_static {
    name = "libLLVMLTO";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "LTO.cpp"
        "LTOCodeGenerator.cpp"
        "LTOModule.cpp"
        "ThinLTOCodeGenerator.cpp"
        "UpdateCompilerUsed.cpp"
    ];
};

in { inherit libLLVMLTO; }
