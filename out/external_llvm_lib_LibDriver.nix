{ cc_library_static, llvm_tblgen }:
let

libLLVMLibDriver = cc_library_static {
    name = "libLLVMLibDriver";
    defaults = [
        "llvm-lib-defaults"
    ];
    generated_headers = ["llvm-gen-libdriver"];
    srcs = ["*.cpp"];
};

llvm-gen-libdriver = llvm_tblgen {
    name = "llvm-gen-libdriver";
    in = "Options.td";
    outs = ["Options.inc"];
};

in { inherit libLLVMLibDriver llvm-gen-libdriver; }
