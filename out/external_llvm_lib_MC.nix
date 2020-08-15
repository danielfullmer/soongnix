{ cc_library_static }:
let

libLLVMMC = cc_library_static {
    name = "libLLVMMC";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "ConstantPools.cpp"
        "ELFObjectWriter.cpp"
        "MCAsmBackend.cpp"
        "MCAsmInfo.cpp"
        "MCAsmInfoCOFF.cpp"
        "MCAsmInfoDarwin.cpp"
        "MCAsmInfoELF.cpp"
        "MCAsmStreamer.cpp"
        "MCAssembler.cpp"
        "MCCodeEmitter.cpp"
        "MCCodeView.cpp"
        "MCContext.cpp"
        "MCDwarf.cpp"
        "MCELFObjectTargetWriter.cpp"
        "MCELFStreamer.cpp"
        "MCExpr.cpp"
        "MCFragment.cpp"
        "MCInst.cpp"
        "MCInstPrinter.cpp"
        "MCInstrAnalysis.cpp"
        "MCInstrDesc.cpp"
        "MCLabel.cpp"
        "MCLinkerOptimizationHint.cpp"
        "MCMachOStreamer.cpp"
        "MCMachObjectTargetWriter.cpp"
        "MCNullStreamer.cpp"
        "MCObjectFileInfo.cpp"
        "MCObjectStreamer.cpp"
        "MCObjectWriter.cpp"
        "MCRegisterInfo.cpp"
        "MCSchedule.cpp"
        "MCSection.cpp"
        "MCSectionCOFF.cpp"
        "MCSectionELF.cpp"
        "MCSectionMachO.cpp"
        "MCStreamer.cpp"
        "MCSubtargetInfo.cpp"
        "MCSymbol.cpp"
        "MCSymbolELF.cpp"
        "MCTargetOptions.cpp"
        "MCValue.cpp"
        "MCWin64EH.cpp"
        "MCWinEH.cpp"
        "MachObjectWriter.cpp"
        "StringTableBuilder.cpp"
        "SubtargetFeature.cpp"
        "WinCOFFObjectWriter.cpp"
        "WinCOFFStreamer.cpp"
    ];
};

subdirs = ["*"];

in { inherit libLLVMMC; }
