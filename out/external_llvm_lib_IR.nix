{ cc_library_static, llvm_tblgen }:
let

libLLVMCore = cc_library_static {
    name = "libLLVMCore";
    defaults = [
        "llvm-lib-defaults"
    ];
    generated_headers = ["llvm-gen-core"];
    srcs = ["*.cpp"];
};

llvm-gen-core = llvm_tblgen {
    name = "llvm-gen-core";
    in = "AttributesCompatFunc.td";
    outs = ["AttributesCompatFunc.inc"];
};

in { inherit libLLVMCore llvm-gen-core; }
