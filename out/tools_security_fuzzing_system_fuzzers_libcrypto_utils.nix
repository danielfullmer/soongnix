{ cc_fuzz }:
let

libcrypto_utils_fuzzer = cc_fuzz {
    host_supported = true;
    name = "libcrypto_utils_fuzzer";
    srcs = [
        "libcrypto_utils_fuzzer.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    shared_libs = [
        "libcrypto_utils"
        "libcrypto"
    ];
};

in { inherit libcrypto_utils_fuzzer; }
