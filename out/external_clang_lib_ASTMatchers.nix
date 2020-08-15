{ cc_library_static }:
let

libclangASTMatchers = cc_library_static {
    name = "libclangASTMatchers";
    defaults = ["clang-defaults"];
    srcs = [
        "ASTMatchFinder.cpp"
        "ASTMatchersInternal.cpp"
    ];
};

in { inherit libclangASTMatchers; }
