{ cc_fuzz }:
let

dtsframescanner_fuzzer = cc_fuzz {
    name = "dtsframescanner_fuzzer";
    srcs = [
        "dtsframescanner_fuzzer.cpp"
    ];
    static_libs = [
        "libaudioutils"
        "liblog"
    ];
    shared_libs = [
        "libaudiospdif"
    ];
    corpus = ["corpus/*"];
};

in { inherit dtsframescanner_fuzzer; }
