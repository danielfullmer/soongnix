{ cc_defaults, cc_library_headers }:
let

libnetd_client_headers = cc_library_headers {
    name = "libnetd_client_headers";
    export_include_dirs = ["include"];
};

netd_defaults = cc_defaults {
    name = "netd_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        #  Override -Wno-error=implicit-fallthrough from soong
        "-Werror=implicit-fallthrough"
        "-Wnullable-to-nonnull-conversion"
        "-Wsign-compare"
        "-Wthread-safety"
        "-Wunused-parameter"
        "-Wuninitialized"
    ];
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
        "google-*"
        "misc-*"
        "performance-*"
        "-cert-err34-c" #  TODO: re-enable after removing atoi() and sscanf() calls
        "-google-readability-*" #  Too pedantic
        "-google-runtime-int" #  Too many unavoidable warnings due to strtol()
        "-google-runtime-references" #  Grandfathered usage of pass by non-const reference
        "-misc-non-private-member-variables-in-classes" #  Also complains about structs
    ];
    tidy_flags = [
        ("-warnings-as-errors=" +
            "'android-*'" +
            ",'clang-analyzer-security*'" +
            ",'cert-*'" +
            ",'google-*'" +
            ",'performance-*'" +
            ",'misc-*'")
    ];
};

in { inherit libnetd_client_headers netd_defaults; }
