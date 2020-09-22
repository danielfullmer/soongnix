{ cc_fuzz }:
let

ac3framescanner_fuzzer = cc_fuzz {
    name = "ac3framescanner_fuzzer";
    srcs = [
        "ac3framescanner_fuzzer.cpp"
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

in { inherit ac3framescanner_fuzzer; }
