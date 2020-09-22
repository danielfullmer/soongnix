{ cc_fuzz }:
let

hevc_dec_fuzzer = cc_fuzz {
    name = "hevc_dec_fuzzer";
    host_supported = true;
    srcs = [
        "hevc_dec_fuzzer.cpp"
    ];
    static_libs = [
        "libhevcdec"
        "liblog"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit hevc_dec_fuzzer; }
