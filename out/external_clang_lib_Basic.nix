{ cc_library_static }:
let

libclangBasic = cc_library_static {
    name = "libclangBasic";
    defaults = ["clang-defaults"];
    srcs = [
        "Attributes.cpp"
        "Builtins.cpp"
        "CharInfo.cpp"
        "Cuda.cpp"
        "Diagnostic.cpp"
        "DiagnosticIDs.cpp"
        "DiagnosticOptions.cpp"
        "FileManager.cpp"
        "FileSystemStatCache.cpp"
        "IdentifierTable.cpp"
        "LangOptions.cpp"
        "Module.cpp"
        "ObjCRuntime.cpp"
        "OpenMPKinds.cpp"
        "OperatorPrecedence.cpp"
        "SanitizerBlacklist.cpp"
        "Sanitizers.cpp"
        "SourceLocation.cpp"
        "SourceManager.cpp"
        "TargetInfo.cpp"
        "Targets.cpp"
        "TokenKinds.cpp"
        "Version.cpp"
        "VersionTuple.cpp"
        "VirtualFileSystem.cpp"
        "Warnings.cpp"
    ];
};

in { inherit libclangBasic; }
