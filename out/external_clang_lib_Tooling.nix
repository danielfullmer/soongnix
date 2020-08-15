{ cc_library_static }:
let

libclangTooling = cc_library_static {
    name = "libclangTooling";
    defaults = ["clang-defaults"];
    srcs = [
        "ArgumentsAdjusters.cpp"
        "CommonOptionsParser.cpp"
        "CompilationDatabase.cpp"
        "FileMatchTrie.cpp"
        "FixIt.cpp"
        "JSONCompilationDatabase.cpp"
        "Refactoring.cpp"
        "RefactoringCallbacks.cpp"
        "Tooling.cpp"
    ];
};

subdirs = ["Core"];

in { inherit libclangTooling; }
