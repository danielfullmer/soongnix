{ cc_library_static }:
let

libclangLibclang = cc_library_static {
    name = "libclangLibclang";
    defaults = ["clang-defaults"];
    srcs = [
        "ARCMigrate.cpp"
        "BuildSystem.cpp"
        "CIndex.cpp"
        "CIndexCXX.cpp"
        "CIndexCodeCompletion.cpp"
        "CIndexDiagnostic.cpp"
        "CIndexHigh.cpp"
        "CIndexInclusionStack.cpp"
        "CIndexUSRs.cpp"
        "CIndexer.cpp"
        "CXComment.cpp"
        "CXCompilationDatabase.cpp"
        "CXCursor.cpp"
        "CXIndexDataConsumer.cpp"
        "CXLoadedDiagnostic.cpp"
        "CXSourceLocation.cpp"
        "CXStoredDiagnostic.cpp"
        "CXString.cpp"
        "CXType.cpp"
        "Indexing.cpp"
    ];
};

in { inherit libclangLibclang; }
