{ cc_fuzz }:
let

avc_dec_fuzzer = cc_fuzz {
    name = "avc_dec_fuzzer";
    host_supported = true;
    srcs = [
        "avc_dec_fuzzer.cpp"
    ];
    static_libs = [
        "libavcdec"
        "liblog"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit avc_dec_fuzzer; }
