{ cc_library_static }:
let

libLLVMAArch64Desc = cc_library_static {
    name = "libLLVMAArch64Desc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = [
        "AArch64AsmBackend.cpp"
        "AArch64ELFObjectWriter.cpp"
        "AArch64ELFStreamer.cpp"
        "AArch64MCAsmInfo.cpp"
        "AArch64MCCodeEmitter.cpp"
        "AArch64MCExpr.cpp"
        "AArch64MCTargetDesc.cpp"
        "AArch64MachObjectWriter.cpp"
        "AArch64TargetStreamer.cpp"
    ];
};

in { inherit libLLVMAArch64Desc; }
