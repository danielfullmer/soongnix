{ cc_fuzz }:
let

fdtostring_fuzzer = cc_fuzz {
    name = "fdtostring_fuzzer";
    srcs = [
        "fdtostring_fuzzer.cpp"
    ];
    static_libs = [
        "libaudioutils"
        "libcutils"
        "liblog"
        "libutils"
    ];
};

in { inherit fdtostring_fuzzer; }
