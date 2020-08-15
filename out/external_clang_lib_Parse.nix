{ cc_library_static }:
let

libclangParse = cc_library_static {
    name = "libclangParse";
    defaults = ["clang-defaults"];
    srcs = [
        "ParseAST.cpp"
        "ParseCXXInlineMethods.cpp"
        "ParseDecl.cpp"
        "ParseDeclCXX.cpp"
        "ParseExpr.cpp"
        "ParseExprCXX.cpp"
        "ParseInit.cpp"
        "ParseObjc.cpp"
        "ParseOpenMP.cpp"
        "ParsePragma.cpp"
        "ParseStmt.cpp"
        "ParseStmtAsm.cpp"
        "ParseTemplate.cpp"
        "ParseTentative.cpp"
        "Parser.cpp"
    ];
};

in { inherit libclangParse; }
