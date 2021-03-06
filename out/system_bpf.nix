{ cc_defaults }:
let

bpf_defaults = cc_defaults {
    name = "bpf_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wnullable-to-nonnull-conversion"
        "-Wthread-safety"
        "-Wunused-parameter"
    ];
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
        "-cert-err34-c"
        "clang-analyzer-security*"
        #  Disabling due to many unavoidable warnings from POSIX API usage.
        "-google-runtime-int"
    ];
};

in { inherit bpf_defaults; }
