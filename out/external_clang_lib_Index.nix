{ cc_library_static }:
let

libclangIndex = cc_library_static {
    name = "libclangIndex";
    defaults = ["clang-defaults"];
    srcs = [
        "CodegenNameGenerator.cpp"
        "CommentToXML.cpp"
        "IndexBody.cpp"
        "IndexDecl.cpp"
        "IndexSymbol.cpp"
        "IndexTypeSourceInfo.cpp"
        "IndexingAction.cpp"
        "IndexingContext.cpp"
        "USRGeneration.cpp"
    ];
};

in { inherit libclangIndex; }
