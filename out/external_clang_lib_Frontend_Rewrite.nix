{ cc_library_static }:
let

libclangRewriteFrontend = cc_library_static {
    name = "libclangRewriteFrontend";
    defaults = ["clang-defaults"];
    srcs = [
        "FixItRewriter.cpp"
        "FrontendActions.cpp"
        "HTMLPrint.cpp"
        "InclusionRewriter.cpp"
        "RewriteMacros.cpp"
        "RewriteModernObjC.cpp"
        "RewriteObjC.cpp"
        "RewriteTest.cpp"
    ];
};

in { inherit libclangRewriteFrontend; }
