{ cc_defaults }:
let

pdfium-third-party = cc_defaults {
    name = "pdfium-third-party";
    defaults = [
        "pdfium-common"
    ];
};

build = [
    "pdfiumfx_agg.bp"
    "pdfiumbigint.bp"
    "pdfiumlcms2.bp"
    "pdfiumpdfiumbase.bp"
    "pdfiumfx_libopenjpeg.bp"
];

in { inherit pdfium-third-party; }
