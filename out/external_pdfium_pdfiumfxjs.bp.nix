{ cc_library_static }:
let

libpdfiumfxjs = cc_library_static {
    name = "libpdfiumfxjs";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumfxcrt"
    ];

    srcs = [
        "fxjs/cjs_event_context_stub.cpp"
        "fxjs/cjs_runtimestub.cpp"
    ];
};

in { inherit libpdfiumfxjs; }
