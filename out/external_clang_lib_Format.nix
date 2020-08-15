{ cc_library_static }:
let

libclangFormat = cc_library_static {
    name = "libclangFormat";
    defaults = ["clang-defaults"];
    srcs = [
        "AffectedRangeManager.cpp"
        "BreakableToken.cpp"
        "ContinuationIndenter.cpp"
        "Format.cpp"
        "FormatToken.cpp"
        "FormatTokenLexer.cpp"
        "SortJavaScriptImports.cpp"
        "TokenAnalyzer.cpp"
        "TokenAnnotator.cpp"
        "UnwrappedLineFormatter.cpp"
        "UnwrappedLineParser.cpp"
        "WhitespaceManager.cpp"
    ];
};

in { inherit libclangFormat; }
