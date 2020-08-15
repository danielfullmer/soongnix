{ cc_library_host_static }:
let

libclangStaticAnalyzerCore = cc_library_host_static {
    name = "libclangStaticAnalyzerCore";
    defaults = ["clang-defaults"];
    srcs = [
        "APSIntType.cpp"
        "AnalysisManager.cpp"
        "AnalyzerOptions.cpp"
        "BasicValueFactory.cpp"
        "BlockCounter.cpp"
        "BugReporter.cpp"
        "BugReporterVisitors.cpp"
        "CallEvent.cpp"
        "Checker.cpp"
        "CheckerContext.cpp"
        "CheckerHelpers.cpp"
        "CheckerManager.cpp"
        "CheckerRegistry.cpp"
        "CommonBugCategories.cpp"
        "ConstraintManager.cpp"
        "CoreEngine.cpp"
        "DynamicTypeMap.cpp"
        "Environment.cpp"
        "ExplodedGraph.cpp"
        "ExprEngine.cpp"
        "ExprEngineC.cpp"
        "ExprEngineCXX.cpp"
        "ExprEngineCallAndReturn.cpp"
        "ExprEngineObjC.cpp"
        "FunctionSummary.cpp"
        "HTMLDiagnostics.cpp"
        "IssueHash.cpp"
        "LoopWidening.cpp"
        "MemRegion.cpp"
        "PathDiagnostic.cpp"
        "PlistDiagnostics.cpp"
        "ProgramState.cpp"
        "RangeConstraintManager.cpp"
        "RegionStore.cpp"
        "SValBuilder.cpp"
        "SVals.cpp"
        "SimpleConstraintManager.cpp"
        "SimpleSValBuilder.cpp"
        "Store.cpp"
        "SubEngine.cpp"
        "SymbolManager.cpp"
    ];

    export_include_dirs = ["."];
};

in { inherit libclangStaticAnalyzerCore; }
