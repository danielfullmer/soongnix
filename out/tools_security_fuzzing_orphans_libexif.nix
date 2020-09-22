{ cc_fuzz }:
let

libexif_fuzzer = cc_fuzz {
    name = "libexif_fuzzer";
    srcs = [
        "libexif_fuzzer.cpp"
    ];
    shared_libs = [
        "libexif"
    ];
    host_supported = false;
};

in { inherit libexif_fuzzer; }
