{ cc_library_host_static }:
let

libclangStaticAnalyzerCore = cc_library_host_static {
    name = "libclangStaticAnalyzerCore";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];

    export_include_dirs = ["."];
};

in { inherit libclangStaticAnalyzerCore; }
