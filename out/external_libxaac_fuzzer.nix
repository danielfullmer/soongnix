{ cc_fuzz }:
let

xaac_dec_fuzzer = cc_fuzz {
    name = "xaac_dec_fuzzer";
    host_supported = true;
    srcs = [
        "xaac_dec_fuzzer.cpp"
    ];
    static_libs = [
        "libxaacdec"
        "liblog"
    ];
};

in { inherit xaac_dec_fuzzer; }
