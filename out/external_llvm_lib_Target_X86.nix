{ cc_defaults, cc_library_static, llvm_tblgen }:
let

libLLVMX86CodeGen = cc_library_static {
    name = "libLLVMX86CodeGen";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = [
        "X86AsmPrinter.cpp"
        "X86CallFrameOptimization.cpp"
        "X86ExpandPseudo.cpp"
        "X86FastISel.cpp"
        "X86FixupBWInsts.cpp"
        "X86FixupLEAs.cpp"
        "X86FixupSetCC.cpp"
        "X86FloatingPoint.cpp"
        "X86FrameLowering.cpp"
        "X86ISelDAGToDAG.cpp"
        "X86ISelLowering.cpp"
        "X86InstrInfo.cpp"
        "X86MCInstLower.cpp"
        "X86MachineFunctionInfo.cpp"
        "X86OptimizeLEAs.cpp"
        "X86PadShortFunction.cpp"
        "X86RegisterInfo.cpp"
        "X86SelectionDAGInfo.cpp"
        "X86ShuffleDecodeConstantPool.cpp"
        "X86Subtarget.cpp"
        "X86TargetMachine.cpp"
        "X86TargetObjectFile.cpp"
        "X86TargetTransformInfo.cpp"
        "X86VZeroUpper.cpp"
        "X86WinAllocaExpander.cpp"
        "X86WinEHState.cpp"
    ];

    #  b/31559947, b/31938382 clang-tidy segmentation fault.
    tidy_checks = [
        "-clang-analyzer-*"
        "-readability-*"
        "-google-readability-*"
    ];
};

llvm-x86-defaults = cc_defaults {
    name = "llvm-x86-defaults";
    generated_headers = ["llvm-gen-x86"];
    static_libs = ["llvm-x86-headers"];
};

llvm-x86-headers = cc_library_static {
    name = "llvm-x86-headers";
    vendor_available = true;
    host_supported = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    target = {
        windows = {
            enabled = true;
        };
    };
    export_include_dirs = ["."];
};

llvm-gen-x86 = llvm_tblgen {
    name = "llvm-gen-x86";
    in_ = "X86.td";
    outs = [
        "X86GenAsmMatcher.inc"
        "X86GenAsmWriter.inc"
        "X86GenAsmWriter1.inc"
        "X86GenDisassemblerTables.inc"
        "X86GenRegisterInfo.inc"
        "X86GenInstrInfo.inc"
        "X86GenDAGISel.inc"
        "X86GenFastISel.inc"
        "X86GenSubtargetInfo.inc"
        "X86GenCallingConv.inc"
    ];
};

subdirs = ["*"];

in { inherit libLLVMX86CodeGen llvm-gen-x86 llvm-x86-defaults llvm-x86-headers; }
