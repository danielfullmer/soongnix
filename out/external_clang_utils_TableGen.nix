{ cc_binary_host }:
let

clang-tblgen = cc_binary_host {
    name = "clang-tblgen";
    defaults = ["llvm-defaults"];
    srcs = [
        "ClangASTNodesEmitter.cpp"
        "ClangAttrEmitter.cpp"
        "ClangCommentCommandInfoEmitter.cpp"
        "ClangCommentHTMLNamedCharacterReferenceEmitter.cpp"
        "ClangCommentHTMLTagsEmitter.cpp"
        "ClangDiagnosticsEmitter.cpp"
        "ClangSACheckersEmitter.cpp"
        "NeonEmitter.cpp"
        "TableGen.cpp"
    ];

    static_libs = [
        "libLLVMTableGen"
        "libLLVMSupport"
    ];

    cflags = [
        "-Wno-implicit-fallthrough"
        #  NeonEmitter.cpp has several -Wimplicit-fallthrough.
    ];
    tidy_checks = [
        "-google-runtime-member-string-references"
    ];
    target = {
        windows = {
            host_ldlibs = [
                "-limagehlp"
                "-lpsapi"
                "-lversion"
            ];
        };
    };
};

in { inherit clang-tblgen; }
