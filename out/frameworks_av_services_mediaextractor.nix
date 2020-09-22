{ cc_binary, cc_library_shared, prebuilt_etc }:
let

#  service library
libmediaextractorservice = cc_library_shared {
    name = "libmediaextractorservice";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    srcs = ["MediaExtractorService.cpp"];

    shared_libs = [
        "libdatasource"
        "libmedia"
        "libstagefright"
        "libstagefright_foundation"
        "libbinder"
        "libutils"
        "liblog"
    ];
    header_libs = [
        "libmediametrics_headers"
    ];
};

#  service executable
mediaextractor = cc_binary {
    name = "mediaextractor";

    srcs = ["main_extractorservice.cpp"];
    shared_libs = [
        "libmedia"
        "libmediaextractorservice"
        "libmediautils"
        "libbinder"
        "libutils"
        "liblog"
        "libavservices_minijail"
    ];
    header_libs = [
        "bionic_libc_platform_headers"
    ];
    target = {
        android = {
            product_variables = {
                malloc_not_svelte = {
                    #  Scudo increases memory footprint, so only enable on
                    #  non-svelte devices.
                    shared_libs = ["libc_scudo"];
                };
            };
        };
    };
    init_rc = ["mediaextractor.rc"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    required = ["mediaextractor.policy"];
};

"mediaextractor.policy" = prebuilt_etc {
    name = "mediaextractor.policy";
    sub_dir = "seccomp_policy";
    arch = {
        arm = {
            src = "seccomp_policy/mediaextractor-arm.policy";
        };
        arm64 = {
            src = "seccomp_policy/mediaextractor-arm64.policy";
        };
        x86 = {
            src = "seccomp_policy/mediaextractor-x86.policy";
        };
        x86_64 = {
            src = "seccomp_policy/mediaextractor-x86_64.policy";
        };
    };
    required = [
        "crash_dump.policy"
        "code_coverage.policy"
    ];
};

in { inherit "mediaextractor.policy" libmediaextractorservice mediaextractor; }
