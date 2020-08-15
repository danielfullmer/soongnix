{ cc_library_static }:
let

libLLVMSelectionDAG = cc_library_static {
    name = "libLLVMSelectionDAG";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "DAGCombiner.cpp"
        "FastISel.cpp"
        "FunctionLoweringInfo.cpp"
        "InstrEmitter.cpp"
        "LegalizeDAG.cpp"
        "LegalizeFloatTypes.cpp"
        "LegalizeIntegerTypes.cpp"
        "LegalizeTypes.cpp"
        "LegalizeTypesGeneric.cpp"
        "LegalizeVectorOps.cpp"
        "LegalizeVectorTypes.cpp"
        "ResourcePriorityQueue.cpp"
        "ScheduleDAGFast.cpp"
        "ScheduleDAGRRList.cpp"
        "ScheduleDAGSDNodes.cpp"
        "ScheduleDAGVLIW.cpp"
        "SelectionDAG.cpp"
        "SelectionDAGBuilder.cpp"
        "SelectionDAGDumper.cpp"
        "SelectionDAGISel.cpp"
        "SelectionDAGPrinter.cpp"
        "SelectionDAGTargetInfo.cpp"
        "StatepointLowering.cpp"
        "TargetLowering.cpp"
    ];
};

in { inherit libLLVMSelectionDAG; }
