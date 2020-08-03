{ cc_library_static }:
let

libclangStaticAnalyzerMPIChecker = cc_library_static {
    name = "libclangStaticAnalyzerMPIChecker";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangStaticAnalyzerMPIChecker; }
