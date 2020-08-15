{ cc_library_static }:
let

libclangLex = cc_library_static {
    name = "libclangLex";
    defaults = ["clang-defaults"];
    srcs = [
        "HeaderMap.cpp"
        "HeaderSearch.cpp"
        "Lexer.cpp"
        "LiteralSupport.cpp"
        "MacroArgs.cpp"
        "MacroInfo.cpp"
        "ModuleMap.cpp"
        "PPCaching.cpp"
        "PPCallbacks.cpp"
        "PPConditionalDirectiveRecord.cpp"
        "PPDirectives.cpp"
        "PPExpressions.cpp"
        "PPLexerChange.cpp"
        "PPMacroExpansion.cpp"
        "PTHLexer.cpp"
        "Pragma.cpp"
        "PreprocessingRecord.cpp"
        "Preprocessor.cpp"
        "PreprocessorLexer.cpp"
        "ScratchBuffer.cpp"
        "TokenConcatenation.cpp"
        "TokenLexer.cpp"
    ];
};

in { inherit libclangLex; }
