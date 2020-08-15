{ cc_library_static }:
let

libLLVMInstrumentation = cc_library_static {
    name = "libLLVMInstrumentation";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "AddressSanitizer.cpp"
        "BoundsChecking.cpp"
        "DataFlowSanitizer.cpp"
        "EfficiencySanitizer.cpp"
        "GCOVProfiling.cpp"
        "IndirectCallPromotion.cpp"
        "InstrProfiling.cpp"
        "Instrumentation.cpp"
        "MemorySanitizer.cpp"
        "PGOInstrumentation.cpp"
        "SanitizerCoverage.cpp"
        "ThreadSanitizer.cpp"
    ];
};

in { inherit libLLVMInstrumentation; }
