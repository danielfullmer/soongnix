{ cc_library_static }:
let

libclangRewrite = cc_library_static {
    name = "libclangRewrite";
    defaults = ["clang-defaults"];
    srcs = [
        "DeltaTree.cpp"
        "HTMLRewrite.cpp"
        "RewriteRope.cpp"
        "Rewriter.cpp"
        "TokenRewriter.cpp"
    ];
};

in { inherit libclangRewrite; }
