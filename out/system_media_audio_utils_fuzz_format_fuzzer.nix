{ cc_fuzz }:
let

format_fuzzer = cc_fuzz {
    name = "format_fuzzer";
    srcs = [
        "format_fuzzer.cpp"
    ];
    static_libs = [
        "libaudioutils"
        "liblog"
    ];
};

in { inherit format_fuzzer; }
