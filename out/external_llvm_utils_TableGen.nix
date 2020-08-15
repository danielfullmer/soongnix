{ cc_binary_host }:
let

llvm-tblgen = cc_binary_host {
    name = "llvm-tblgen";
    defaults = ["llvm-defaults-no-generated-headers"];
    srcs = [
        "AsmMatcherEmitter.cpp"
        "AsmWriterEmitter.cpp"
        "AsmWriterInst.cpp"
        "Attributes.cpp"
        "CTagsEmitter.cpp"
        "CallingConvEmitter.cpp"
        "CodeEmitterGen.cpp"
        "CodeGenDAGPatterns.cpp"
        "CodeGenInstruction.cpp"
        "CodeGenMapTable.cpp"
        "CodeGenRegisters.cpp"
        "CodeGenSchedule.cpp"
        "CodeGenTarget.cpp"
        "DAGISelEmitter.cpp"
        "DAGISelMatcher.cpp"
        "DAGISelMatcherEmitter.cpp"
        "DAGISelMatcherGen.cpp"
        "DAGISelMatcherOpt.cpp"
        "DFAPacketizerEmitter.cpp"
        "DisassemblerEmitter.cpp"
        "FastISelEmitter.cpp"
        "FixedLenDecoderEmitter.cpp"
        "InstrInfoEmitter.cpp"
        "IntrinsicEmitter.cpp"
        "OptParserEmitter.cpp"
        "PseudoLoweringEmitter.cpp"
        "RegisterInfoEmitter.cpp"
        "SearchableTableEmitter.cpp"
        "SubtargetEmitter.cpp"
        "TableGen.cpp"
        "X86DisassemblerTables.cpp"
        "X86ModRMFilters.cpp"
        "X86RecognizableInstr.cpp"
    ];

    static_libs = [
        "libLLVMSupport"
        "libLLVMTableGen"
    ];
    clang_cflags = [
        "-Wno-user-defined-warnings"
    ];
    target = {
        windows = {
            enabled = false;
        };
        #  llvm-defaults turns off host builds by default, turn it back on for
        #  modules that are used to build llvm-tblgen
        host = {
            enabled = true;
        };
    };
};

in { inherit llvm-tblgen; }
