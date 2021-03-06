{ cc_library_host_static }:
let

libclangFrontendTool = cc_library_host_static {
    name = "libclangFrontendTool";
    defaults = ["clang-defaults"];
    srcs = ["ExecuteCompilerInvocation.cpp"];

    cflags = [
        "-DCLANG_ENABLE_STATIC_ANALYZER"
        "-DCLANG_ENABLE_REWRITER"
    ];
};

in { inherit libclangFrontendTool; }
