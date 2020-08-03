{ cc_library_host_static }:
let

libclangStaticAnalyzerFrontend = cc_library_host_static {
    name = "libclangStaticAnalyzerFrontend";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];

    static_libs = ["libclangStaticAnalyzerCheckers"];
};

in { inherit libclangStaticAnalyzerFrontend; }
