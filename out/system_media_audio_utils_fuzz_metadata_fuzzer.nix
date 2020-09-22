{ cc_fuzz }:
let

metadata_fuzzer = cc_fuzz {
    name = "metadata_fuzzer";
    srcs = [
        "metadata_fuzzer.cpp"
    ];
    header_libs = [
        "libaudioutils_headers"
    ];
    static_libs = [
        "liblog"
    ];
};

in { inherit metadata_fuzzer; }
