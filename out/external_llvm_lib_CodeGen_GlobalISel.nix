{ cc_library_static }:
let

libLLVMGlobalISel = cc_library_static {
    name = "libLLVMGlobalISel";
    defaults = [
        "llvm-lib-defaults"
    ];
    #  Only pull in this one file to ensure we aren't building with this
    #  experimental feature just yet.
    srcs = ["GlobalISel.cpp"];
};

in { inherit libLLVMGlobalISel; }
