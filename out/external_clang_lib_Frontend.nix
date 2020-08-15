{ cc_library_static }:
let

libclangFrontend = cc_library_static {
    name = "libclangFrontend";
    defaults = ["clang-defaults"];
    srcs = [
        "ASTConsumers.cpp"
        "ASTMerge.cpp"
        "ASTUnit.cpp"
        "CacheTokens.cpp"
        "ChainedDiagnosticConsumer.cpp"
        "ChainedIncludesSource.cpp"
        "CodeGenOptions.cpp"
        "CompilerInstance.cpp"
        "CompilerInvocation.cpp"
        "CreateInvocationFromCommandLine.cpp"
        "DependencyFile.cpp"
        "DependencyGraph.cpp"
        "DiagnosticRenderer.cpp"
        "FrontendAction.cpp"
        "FrontendActions.cpp"
        "FrontendOptions.cpp"
        "HeaderIncludeGen.cpp"
        "InitHeaderSearch.cpp"
        "InitPreprocessor.cpp"
        "LangStandards.cpp"
        "LayoutOverrideSource.cpp"
        "LogDiagnosticPrinter.cpp"
        "ModuleDependencyCollector.cpp"
        "MultiplexConsumer.cpp"
        "PCHContainerOperations.cpp"
        "PrintPreprocessedOutput.cpp"
        "SerializedDiagnosticPrinter.cpp"
        "SerializedDiagnosticReader.cpp"
        "TestModuleFileExtension.cpp"
        "TextDiagnostic.cpp"
        "TextDiagnosticBuffer.cpp"
        "TextDiagnosticPrinter.cpp"
        "VerifyDiagnosticConsumer.cpp"
    ];
};

subdirs = ["Rewrite"];

in { inherit libclangFrontend; }
