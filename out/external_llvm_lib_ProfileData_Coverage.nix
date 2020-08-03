{ cc_library_static }:
let

libLLVMProfileDataCoverage = cc_library_static {
    name = "libLLVMProfileDataCoverage";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMProfileDataCoverage; }
