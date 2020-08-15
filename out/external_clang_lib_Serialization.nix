{ cc_library_static }:
let

libclangSerialization = cc_library_static {
    name = "libclangSerialization";
    defaults = ["clang-defaults"];
    srcs = [
        "ASTCommon.cpp"
        "ASTReader.cpp"
        "ASTReaderDecl.cpp"
        "ASTReaderStmt.cpp"
        "ASTWriter.cpp"
        "ASTWriterDecl.cpp"
        "ASTWriterStmt.cpp"
        "GeneratePCH.cpp"
        "GlobalModuleIndex.cpp"
        "Module.cpp"
        "ModuleFileExtension.cpp"
        "ModuleManager.cpp"
    ];
};

in { inherit libclangSerialization; }
