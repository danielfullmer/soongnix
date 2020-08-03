{ cc_binary, prebuilt_etc }:
let

mediaswcodec = cc_binary {
    name = "mediaswcodec";
    vendor_available = true;

    srcs = [
        "main_swcodecservice.cpp"
    ];

    shared_libs = [
        "libavservices_minijail"
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libmedia_codecserviceregistrant"
    ];

    target = {
        vendor = {
            exclude_shared_libs = ["libavservices_minijail"];
            shared_libs = ["libavservices_minijail_vendor"];
        };
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

    header_libs = [
        "libmedia_headers"
    ];

    init_rc = ["mediaswcodec.rc"];

    required = ["mediaswcodec.policy"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-error=deprecated-declarations"
    ];
};

"mediaswcodec.policy" = prebuilt_etc {
    name = "mediaswcodec.policy";
    sub_dir = "seccomp_policy";
    arch = {
        arm = {
            src = "seccomp_policy/mediaswcodec-arm.policy";
        };
        arm64 = {
            src = "seccomp_policy/mediaswcodec-arm64.policy";
        };
        x86 = {
            src = "seccomp_policy/mediacodec-x86.policy";
        };
        x86_64 = {
            src = "seccomp_policy/mediacodec-x86.policy";
        };
    };
    required = [
        "crash_dump.policy"
        "code_coverage.policy"
    ];
};

in { inherit "mediaswcodec.policy" mediaswcodec; }
