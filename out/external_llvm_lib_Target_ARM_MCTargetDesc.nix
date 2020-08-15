{ cc_library_static }:
let

libLLVMARMDesc = cc_library_static {
    name = "libLLVMARMDesc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-arm-defaults"
    ];
    srcs = [
        "ARMAsmBackend.cpp"
        "ARMELFObjectWriter.cpp"
        "ARMELFStreamer.cpp"
        "ARMMCAsmInfo.cpp"
        "ARMMCCodeEmitter.cpp"
        "ARMMCExpr.cpp"
        "ARMMCTargetDesc.cpp"
        "ARMMachORelocationInfo.cpp"
        "ARMMachObjectWriter.cpp"
        "ARMTargetStreamer.cpp"
        "ARMUnwindOpAsm.cpp"
        "ARMWinCOFFObjectWriter.cpp"
        "ARMWinCOFFStreamer.cpp"
    ];
};

in { inherit libLLVMARMDesc; }
