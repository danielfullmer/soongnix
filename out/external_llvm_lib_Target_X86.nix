{ cc_defaults, cc_library_static, llvm_tblgen }:
let

libLLVMX86CodeGen = cc_library_static {
    name = "libLLVMX86CodeGen";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = ["*.cpp"];

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
