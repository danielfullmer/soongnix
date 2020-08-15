{ cc_library_static }:
let

libLLVMVectorize = cc_library_static {
    name = "libLLVMVectorize";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "BBVectorize.cpp"
        "LoadStoreVectorizer.cpp"
        "LoopVectorize.cpp"
        "SLPVectorizer.cpp"
        "Vectorize.cpp"
    ];
    clang_cflags = [
        "-Wno-user-defined-warnings"
    ];
};

in { inherit libLLVMVectorize; }
