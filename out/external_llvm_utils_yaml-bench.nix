{ cc_binary_host }:
let

#  yaml-bench executable for the host
#  =====================================================

yaml-bench = cc_binary_host {
    name = "yaml-bench";
    defaults = ["llvm-defaults"];
    srcs = ["YAMLBench.cpp"];
    static_libs = ["libLLVMSupport"];
};

in { inherit yaml-bench; }
