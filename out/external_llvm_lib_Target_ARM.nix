{ cc_defaults, cc_library_static, llvm_tblgen }:
let

libLLVMARMCodeGen = cc_library_static {
    name = "libLLVMARMCodeGen";
    defaults = [
        "llvm-lib-defaults"
        "llvm-arm-defaults"
    ];
    srcs = ["*.cpp"];

    #  b/31559947, b/31938382 clang-tidy segmentation fault.
    tidy_checks = [
        "-clang-analyzer-*"
        "-readability-*"
    ];
};

llvm-arm-defaults = cc_defaults {
    name = "llvm-arm-defaults";
    generated_headers = ["llvm-gen-arm"];
    static_libs = ["llvm-arm-headers"];
};

llvm-arm-headers = cc_library_static {
    name = "llvm-arm-headers";
    vendor_available = true;
    host_supported = true;
    target = {
        windows = {
            enabled = true;
        };
    };
    export_include_dirs = ["."];
};

llvm-gen-arm = llvm_tblgen {
    name = "llvm-gen-arm";
    in_ = "ARM.td";
    outs = [
        "ARMGenRegisterInfo.inc"
        "ARMGenInstrInfo.inc"
        "ARMGenCodeEmitter.inc"
        "ARMGenMCCodeEmitter.inc"
        "ARMGenMCPseudoLowering.inc"
        "ARMGenAsmWriter.inc"
        "ARMGenAsmMatcher.inc"
        "ARMGenDAGISel.inc"
        "ARMGenFastISel.inc"
        "ARMGenCallingConv.inc"
        "ARMGenSubtargetInfo.inc"
        "ARMGenDisassemblerTables.inc"
    ];
};

subdirs = ["*"];

in { inherit libLLVMARMCodeGen llvm-arm-defaults llvm-arm-headers llvm-gen-arm; }
