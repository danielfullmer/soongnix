{ cc_library_static }:
let

libLLVMTransformUtils = cc_library_static {
    name = "libLLVMTransformUtils";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "ASanStackFrameLayout.cpp"
        "AddDiscriminators.cpp"
        "BasicBlockUtils.cpp"
        "BreakCriticalEdges.cpp"
        "BuildLibCalls.cpp"
        "BypassSlowDivision.cpp"
        "CloneFunction.cpp"
        "CloneModule.cpp"
        "CmpInstAnalysis.cpp"
        "CodeExtractor.cpp"
        "CtorUtils.cpp"
        "DemoteRegToStack.cpp"
        "Evaluator.cpp"
        "FlattenCFG.cpp"
        "FunctionImportUtils.cpp"
        "GlobalStatus.cpp"
        "InlineFunction.cpp"
        "InstructionNamer.cpp"
        "IntegerDivision.cpp"
        "LCSSA.cpp"
        "Local.cpp"
        "LoopSimplify.cpp"
        "LoopUnroll.cpp"
        "LoopUnrollRuntime.cpp"
        "LoopUtils.cpp"
        "LoopVersioning.cpp"
        "LowerInvoke.cpp"
        "LowerSwitch.cpp"
        "Mem2Reg.cpp"
        "MemorySSA.cpp"
        "MetaRenamer.cpp"
        "ModuleUtils.cpp"
        "NameAnonFunctions.cpp"
        "PromoteMemoryToRegister.cpp"
        "SSAUpdater.cpp"
        "SanitizerStats.cpp"
        "SimplifyCFG.cpp"
        "SimplifyIndVar.cpp"
        "SimplifyInstructions.cpp"
        "SimplifyLibCalls.cpp"
        "SplitModule.cpp"
        "SymbolRewriter.cpp"
        "UnifyFunctionExitNodes.cpp"
        "Utils.cpp"
        "ValueMapper.cpp"
    ];
};

in { inherit libLLVMTransformUtils; }
