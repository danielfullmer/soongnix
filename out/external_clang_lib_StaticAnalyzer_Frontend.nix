{ cc_library_host_static }:
let

libclangStaticAnalyzerFrontend = cc_library_host_static {
    name = "libclangStaticAnalyzerFrontend";
    defaults = ["clang-defaults"];
    srcs = [
        "AnalysisConsumer.cpp"
        "CheckerRegistration.cpp"
        "FrontendActions.cpp"
        "ModelConsumer.cpp"
        "ModelInjector.cpp"
    ];

    static_libs = ["libclangStaticAnalyzerCheckers"];
};

in { inherit libclangStaticAnalyzerFrontend; }
