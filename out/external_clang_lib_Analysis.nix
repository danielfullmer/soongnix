{ cc_library_static }:
let

libclangAnalysis = cc_library_static {
    name = "libclangAnalysis";
    defaults = ["clang-defaults"];
    srcs = [
        "AnalysisDeclContext.cpp"
        "BodyFarm.cpp"
        "CFG.cpp"
        "CFGReachabilityAnalysis.cpp"
        "CFGStmtMap.cpp"
        "CallGraph.cpp"
        "CocoaConventions.cpp"
        "CodeInjector.cpp"
        "Consumed.cpp"
        "Dominators.cpp"
        "FormatString.cpp"
        "LiveVariables.cpp"
        "ObjCNoReturn.cpp"
        "PostOrderCFGView.cpp"
        "PrintfFormatString.cpp"
        "ProgramPoint.cpp"
        "PseudoConstantAnalysis.cpp"
        "ReachableCode.cpp"
        "ScanfFormatString.cpp"
        "ThreadSafety.cpp"
        "ThreadSafetyCommon.cpp"
        "ThreadSafetyLogical.cpp"
        "ThreadSafetyTIL.cpp"
        "UninitializedValues.cpp"
    ];
};

in { inherit libclangAnalysis; }
