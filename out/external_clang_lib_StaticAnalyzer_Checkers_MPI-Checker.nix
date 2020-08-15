{ cc_library_static }:
let

libclangStaticAnalyzerMPIChecker = cc_library_static {
    name = "libclangStaticAnalyzerMPIChecker";
    defaults = ["clang-defaults"];
    srcs = [
        "MPIBugReporter.cpp"
        "MPIChecker.cpp"
        "MPIFunctionClassifier.cpp"
    ];
};

in { inherit libclangStaticAnalyzerMPIChecker; }
