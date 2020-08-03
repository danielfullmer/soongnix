{ cc_defaults, cc_library_headers }:
let

pdfium-common = cc_defaults {
    name = "pdfium-common";
    cflags = [
        "-O3"
        "-fstrict-aliasing"
        "-fprefetch-loop-arrays"
        "-fexceptions"

        "-Wextra"
        "-Wall"
        "-Wno-non-virtual-dtor"
        "-Wno-null-pointer-arithmetic"
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-Wno-missing-field-initializers"
        "-Wno-implicit-fallthrough"
        #  cpdf_renderstatus.cpp:1768, cpdf_variabletext.cpp:320,
        #  and cpwl_edit_impl.cpp:1825 have -Wimplicit-fallthrough.
        "-Werror"

        "-DOPJ_STATIC"
        "-DPNG_PREFIX"
        "-DPNG_USE_READ_MACROS"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    header_libs = [
        "pdfium-headers"
        "pdfium-third-party-headers"
    ];
};

pdfium-core = cc_defaults {
    name = "pdfium-core";
    cflags = [
        "-DV8_DEPRECATION_WARNINGS"
    ];

    defaults = [
        "pdfium-common"
    ];
};

pdfium-headers = cc_library_headers {
    name = "pdfium-headers";
    export_include_dirs = ["."];
};

pdfium-third-party-headers = cc_library_headers {
    name = "pdfium-third-party-headers";
    export_include_dirs = ["third_party"];
};

build = [
    "pdfiumfdrm.bp"
    "pdfiumfpdfapi.bp"
    "pdfiumfpdfdoc.bp"
    "pdfiumfpdftext.bp"
    "pdfiumfxcodec.bp"
    "pdfiumfxcrt.bp"
    "pdfiumfxge.bp"
    "pdfiumpwl.bp"
    "pdfiumformfiller.bp"

    "pdfiumfxjs.bp"
    "pdfium.bp"
];

subdirs = ["third_party"];

in { inherit pdfium-common pdfium-core pdfium-headers pdfium-third-party-headers; }
