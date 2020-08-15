{ cc_library_static }:
let

libLLVMInstCombine = cc_library_static {
    name = "libLLVMInstCombine";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "InstCombineAddSub.cpp"
        "InstCombineAndOrXor.cpp"
        "InstCombineCalls.cpp"
        "InstCombineCasts.cpp"
        "InstCombineCompares.cpp"
        "InstCombineLoadStoreAlloca.cpp"
        "InstCombineMulDivRem.cpp"
        "InstCombinePHI.cpp"
        "InstCombineSelect.cpp"
        "InstCombineShifts.cpp"
        "InstCombineSimplifyDemanded.cpp"
        "InstCombineVectorOps.cpp"
        "InstructionCombining.cpp"
    ];
};

in { inherit libLLVMInstCombine; }
