{ cc_library_static }:
let

libLLVMipo = cc_library_static {
    name = "libLLVMipo";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "ArgumentPromotion.cpp"
        "BarrierNoopPass.cpp"
        "ConstantMerge.cpp"
        "CrossDSOCFI.cpp"
        "DeadArgumentElimination.cpp"
        "ElimAvailExtern.cpp"
        "ExtractGV.cpp"
        "ForceFunctionAttrs.cpp"
        "FunctionAttrs.cpp"
        "FunctionImport.cpp"
        "GlobalDCE.cpp"
        "GlobalOpt.cpp"
        "IPConstantPropagation.cpp"
        "IPO.cpp"
        "InferFunctionAttrs.cpp"
        "InlineAlways.cpp"
        "InlineSimple.cpp"
        "Inliner.cpp"
        "Internalize.cpp"
        "LoopExtractor.cpp"
        "LowerTypeTests.cpp"
        "MergeFunctions.cpp"
        "PartialInlining.cpp"
        "PassManagerBuilder.cpp"
        "PruneEH.cpp"
        "SampleProfile.cpp"
        "StripDeadPrototypes.cpp"
        "StripSymbols.cpp"
        "WholeProgramDevirt.cpp"
    ];
};

in { inherit libLLVMipo; }
