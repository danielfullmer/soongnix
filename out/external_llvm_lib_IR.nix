{ cc_library_static, llvm_tblgen }:
let

libLLVMCore = cc_library_static {
    name = "libLLVMCore";
    defaults = [
        "llvm-lib-defaults"
    ];
    generated_headers = ["llvm-gen-core"];
    srcs = [
        "AsmWriter.cpp"
        "Attributes.cpp"
        "AutoUpgrade.cpp"
        "BasicBlock.cpp"
        "Comdat.cpp"
        "ConstantFold.cpp"
        "ConstantRange.cpp"
        "Constants.cpp"
        "Core.cpp"
        "DIBuilder.cpp"
        "DataLayout.cpp"
        "DebugInfo.cpp"
        "DebugInfoMetadata.cpp"
        "DebugLoc.cpp"
        "DiagnosticInfo.cpp"
        "DiagnosticPrinter.cpp"
        "Dominators.cpp"
        "Function.cpp"
        "GCOV.cpp"
        "GVMaterializer.cpp"
        "Globals.cpp"
        "IRBuilder.cpp"
        "IRPrintingPasses.cpp"
        "InlineAsm.cpp"
        "Instruction.cpp"
        "Instructions.cpp"
        "IntrinsicInst.cpp"
        "LLVMContext.cpp"
        "LLVMContextImpl.cpp"
        "LegacyPassManager.cpp"
        "MDBuilder.cpp"
        "Mangler.cpp"
        "Metadata.cpp"
        "Module.cpp"
        "ModuleSummaryIndex.cpp"
        "Operator.cpp"
        "OptBisect.cpp"
        "Pass.cpp"
        "PassManager.cpp"
        "PassRegistry.cpp"
        "ProfileSummary.cpp"
        "Statepoint.cpp"
        "Type.cpp"
        "TypeFinder.cpp"
        "Use.cpp"
        "User.cpp"
        "Value.cpp"
        "ValueSymbolTable.cpp"
        "ValueTypes.cpp"
        "Verifier.cpp"
    ];
};

llvm-gen-core = llvm_tblgen {
    name = "llvm-gen-core";
    in_ = "AttributesCompatFunc.td";
    outs = ["AttributesCompatFunc.inc"];
};

in { inherit libLLVMCore llvm-gen-core; }
