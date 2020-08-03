{ cc_binary_host }:
let

FileCheck = cc_binary_host {
    name = "FileCheck";
    defaults = ["llvm-defaults"];
    srcs = ["FileCheck.cpp"];
    static_libs = ["libLLVMSupport"];
    cflags = [
        "-D__STDC_LIMIT_MACROS"
        "-D__STDC_CONSTANT_MACROS"
    ];
};

in { inherit FileCheck; }
