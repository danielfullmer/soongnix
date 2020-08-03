{ bootstrap_go_package, cc_binary, cc_defaults, sanitizer_status_library_shared }:
let

sanitizer-status_defaults = cc_defaults {
    name = "sanitizer-status_defaults";

    c_std = "c11";
    cflags = [
        "-Wall"
        "-Werror"
        "-O0"
    ];
};

libsanitizer-status = sanitizer_status_library_shared {
    name = "libsanitizer-status";
    defaults = ["sanitizer-status_defaults"];

    srcs = ["sanitizer-status.c"];
};

sanitizer-status = cc_binary {
    name = "sanitizer-status";
    defaults = ["sanitizer-status_defaults"];

    srcs = ["main.c"];
    shared_libs = ["libsanitizer-status"];
};

soong-sanitizer_status = bootstrap_go_package {
    name = "soong-sanitizer_status";
    pkgPath = "android/soong/security/santizers_status";
    deps = [
        "blueprint"
        "soong-android"
        "soong-cc"
    ];
    srcs = ["sanitizer-status.go"];
    pluginFor = ["soong_build"];
};

in { inherit libsanitizer-status sanitizer-status sanitizer-status_defaults soong-sanitizer_status; }
