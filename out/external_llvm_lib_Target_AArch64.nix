{ cc_defaults, cc_library_static, llvm_tblgen }:
let

libLLVMAArch64CodeGen = cc_library_static {
    name = "libLLVMAArch64CodeGen";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = ["*.cpp"];

    #  Global ISEL is an experimental feature.  If LLVM_BUILD_GLOBAL_ISEL is not
    #  set, these files fail compilation based on a macro check.
    exclude_srcs = [
        "AArch64CallLowering.cpp"
        "AArch64RegisterBankInfo.cpp"
    ];
};

llvm-aarch64-defaults = cc_defaults {
    name = "llvm-aarch64-defaults";
    generated_headers = ["llvm-gen-aarch64"];
    static_libs = ["llvm-aarch64-headers"];
};

llvm-aarch64-headers = cc_library_static {
    name = "llvm-aarch64-headers";
    vendor_available = true;
    host_supported = true;
    target = {
        windows = {
            enabled = true;
        };
    };
    export_include_dirs = ["."];
};

llvm-gen-aarch64 = llvm_tblgen {
    name = "llvm-gen-aarch64";
    in = "AArch64.td";
    outs = [
        "AArch64GenRegisterInfo.inc"
        "AArch64GenInstrInfo.inc"
        "AArch64GenAsmWriter.inc"
        "AArch64GenAsmWriter1.inc"
        "AArch64GenDAGISel.inc"
        "AArch64GenCallingConv.inc"
        "AArch64GenAsmMatcher.inc"
        "AArch64GenSubtargetInfo.inc"
        "AArch64GenMCCodeEmitter.inc"
        "AArch64GenFastISel.inc"
        "AArch64GenDisassemblerTables.inc"
        "AArch64GenMCPseudoLowering.inc"
        "AArch64GenSystemOperands.inc"
    ];
};

subdirs = ["*"];

in { inherit libLLVMAArch64CodeGen llvm-aarch64-defaults llvm-aarch64-headers llvm-gen-aarch64; }
