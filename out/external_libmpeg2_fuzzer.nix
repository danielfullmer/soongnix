{ cc_fuzz }:
let

mpeg2_dec_fuzzer = cc_fuzz {
    name = "mpeg2_dec_fuzzer";
    host_supported = true;
    srcs = [
        "mpeg2_dec_fuzzer.cpp"
    ];
    static_libs = [
        "libmpeg2dec"
        "liblog"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit mpeg2_dec_fuzzer; }
