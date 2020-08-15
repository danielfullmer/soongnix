{ cc_library_static }:
let

libLLVMOption = cc_library_static {
    name = "libLLVMOption";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "Arg.cpp"
        "ArgList.cpp"
        "OptTable.cpp"
        "Option.cpp"
    ];
};

in { inherit libLLVMOption; }
