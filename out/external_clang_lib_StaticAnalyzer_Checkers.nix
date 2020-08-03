{ cc_library_host_static }:
let

libclangStaticAnalyzerCheckers = cc_library_host_static {
    name = "libclangStaticAnalyzerCheckers";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];

    export_include_dirs = ["."];
};

subdirs = ["MPI-Checker"];

in { inherit libclangStaticAnalyzerCheckers; }
