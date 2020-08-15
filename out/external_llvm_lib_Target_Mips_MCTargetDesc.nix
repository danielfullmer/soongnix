{ cc_library_static }:
let

libLLVMMipsDesc = cc_library_static {
    name = "libLLVMMipsDesc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-mips-defaults"
    ];
    srcs = [
        "MipsABIFlagsSection.cpp"
        "MipsABIInfo.cpp"
        "MipsAsmBackend.cpp"
        "MipsELFObjectWriter.cpp"
        "MipsELFStreamer.cpp"
        "MipsMCAsmInfo.cpp"
        "MipsMCCodeEmitter.cpp"
        "MipsMCExpr.cpp"
        "MipsMCTargetDesc.cpp"
        "MipsNaClELFStreamer.cpp"
        "MipsOptionRecord.cpp"
        "MipsTargetStreamer.cpp"
    ];
};

in { inherit libLLVMMipsDesc; }
