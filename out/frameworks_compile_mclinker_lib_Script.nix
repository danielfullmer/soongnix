{ cc_library_static }:
let

libmcldScript = cc_library_static {
    name = "libmcldScript";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "AssertCmd.cpp"
        "Assignment.cpp"
        "BinaryOp.cpp"
        "EntryCmd.cpp"
        "FileToken.cpp"
        "GroupCmd.cpp"
        "InputCmd.cpp"
        "InputSectDesc.cpp"
        "InputToken.cpp"
        "NameSpec.cpp"
        "NullaryOp.cpp"
        "Operand.cpp"
        "Operator.cpp"
        "OutputArchCmd.cpp"
        "OutputCmd.cpp"
        "OutputFormatCmd.cpp"
        "OutputSectDesc.cpp"
        "RpnEvaluator.cpp"
        "RpnExpr.cpp"
        "ScriptCommand.cpp"
        "ScriptFile.cpp"
        "ScriptReader.cpp"
        "SearchDirCmd.cpp"
        "SectionsCmd.cpp"
        "ScriptScanner.ll"
        "ScriptParser.yy"
        "StrToken.cpp"
        "StringList.cpp"
        "TernaryOp.cpp"
        "UnaryOp.cpp"
        "WildcardPattern.cpp"
    ];
    include_dirs = ["frameworks/compile/mclinker/include/mcld/Script"];
    header_libs = ["FlexLexer"];
    yacc = {
        gen_location_hh = true;
        gen_position_hh = true;
    };
};

in { inherit libmcldScript; }
