{ cc_library_static }:
let

libLLVMTransformObjCARC = cc_library_static {
    name = "libLLVMTransformObjCARC";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "DependencyAnalysis.cpp"
        "ObjCARC.cpp"
        "ObjCARCAPElim.cpp"
        "ObjCARCContract.cpp"
        "ObjCARCExpand.cpp"
        "ObjCARCOpts.cpp"
        "ProvenanceAnalysis.cpp"
        "ProvenanceAnalysisEvaluator.cpp"
        "PtrState.cpp"
    ];
};

in { inherit libLLVMTransformObjCARC; }
