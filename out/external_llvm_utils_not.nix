{ cc_binary_host }:
let

# ===---------------------------------------------------------------===
#  not command line tool
# ===---------------------------------------------------------------===

not = cc_binary_host {
    name = "not";
    defaults = ["llvm-defaults"];
    srcs = ["not.cpp"];
    static_libs = [
        "libLLVMCore"
        "libLLVMSupport"
    ];
};

in { inherit not; }
