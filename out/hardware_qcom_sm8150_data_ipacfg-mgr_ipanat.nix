{ cc_library_shared }:
let



libipanat = cc_library_shared {
    name = "libipanat";

    header_libs = ["device_kernel_headers"];

    srcs = [
        "src/ipa_nat_drv.c"
        "src/ipa_nat_drvi.c"
    ];

    shared_libs = [
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
    ];
    export_include_dirs = ["inc"];
    vendor = true;
    cflags = [
        "-DDEBUG"
        "-Wall"
        "-Werror"
    ] ++ ["-DFEATURE_IPA_ANDROID"];

    clang = true;
};

in { inherit libipanat; }
