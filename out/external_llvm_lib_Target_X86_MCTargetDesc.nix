{ cc_library_static }:
let

libLLVMX86Desc = cc_library_static {
    name = "libLLVMX86Desc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = [
        "X86AsmBackend.cpp"
        "X86ELFObjectWriter.cpp"
        "X86MCAsmInfo.cpp"
        "X86MCCodeEmitter.cpp"
        "X86MCTargetDesc.cpp"
        "X86MachObjectWriter.cpp"
        "X86WinCOFFObjectWriter.cpp"
        "X86WinCOFFStreamer.cpp"
    ];
};

in { inherit libLLVMX86Desc; }
