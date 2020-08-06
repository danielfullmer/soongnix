{ cc_defaults, cc_library_static, llvm_tblgen }:
let

libLLVMMipsCodeGen = cc_library_static {
    name = "libLLVMMipsCodeGen";
    defaults = [
        "llvm-lib-defaults"
        "llvm-mips-defaults"
    ];
    srcs = ["*.cpp"];
};

llvm-mips-defaults = cc_defaults {
    name = "llvm-mips-defaults";
    generated_headers = ["llvm-gen-mips"];
    static_libs = ["llvm-mips-headers"];
};

llvm-mips-headers = cc_library_static {
    name = "llvm-mips-headers";
    vendor_available = true;
    host_supported = true;
    target = {
        windows = {
            enabled = true;
        };
    };
    export_include_dirs = ["."];
};

llvm-gen-mips = llvm_tblgen {
    name = "llvm-gen-mips";
    in_ = "Mips.td";
    outs = [
        "MipsGenRegisterInfo.inc"
        "MipsGenInstrInfo.inc"
        "MipsGenCodeEmitter.inc"
        "MipsGenMCCodeEmitter.inc"
        "MipsGenMCPseudoLowering.inc"
        "MipsGenAsmWriter.inc"
        "MipsGenAsmMatcher.inc"
        "MipsGenDAGISel.inc"
        "MipsGenFastISel.inc"
        "MipsGenCallingConv.inc"
        "MipsGenSubtargetInfo.inc"
        "MipsGenDisassemblerTables.inc"
    ];
};

subdirs = ["*"];

in { inherit libLLVMMipsCodeGen llvm-gen-mips llvm-mips-defaults llvm-mips-headers; }
