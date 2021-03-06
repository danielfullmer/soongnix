{ cc_library_static }:
let

libpdfiumfxcodec = cc_library_static {
    name = "libpdfiumfxcodec";
    defaults = ["pdfium-core"];

    cflags = [
        "-Wno-pointer-to-int-cast"
        "-DUSE_SYSTEM_ZLIB"
        "-DUSE_SYSTEM_LIBJPEG"
    ];

    static_libs = [
        "libpdfiumfxcrt"
        "libpdfiumlcms2"
        "libpdfiumfx_libopenjpeg"
    ];

    shared_libs = [
        "libz"
        "libjpeg"
    ];

    srcs = [
        "core/fxcodec/codec/ccodec_scanlinedecoder.cpp"
        "core/fxcodec/codec/fx_codec.cpp"
        "core/fxcodec/codec/fx_codec_fax.cpp"
        "core/fxcodec/codec/fx_codec_flate.cpp"
        "core/fxcodec/codec/fx_codec_icc.cpp"
        "core/fxcodec/codec/fx_codec_jbig.cpp"
        "core/fxcodec/codec/fx_codec_jpeg.cpp"
        "core/fxcodec/codec/fx_codec_jpx_opj.cpp"
        "core/fxcodec/jbig2/JBig2_ArithDecoder.cpp"
        "core/fxcodec/jbig2/JBig2_ArithIntDecoder.cpp"
        "core/fxcodec/jbig2/JBig2_BitStream.cpp"
        "core/fxcodec/jbig2/JBig2_Context.cpp"
        "core/fxcodec/jbig2/JBig2_GrdProc.cpp"
        "core/fxcodec/jbig2/JBig2_GrrdProc.cpp"
        "core/fxcodec/jbig2/JBig2_HtrdProc.cpp"
        "core/fxcodec/jbig2/JBig2_HuffmanDecoder.cpp"
        "core/fxcodec/jbig2/JBig2_HuffmanTable.cpp"
        "core/fxcodec/jbig2/JBig2_HuffmanTable_Standard.cpp"
        "core/fxcodec/jbig2/JBig2_Image.cpp"
        "core/fxcodec/jbig2/JBig2_PatternDict.cpp"
        "core/fxcodec/jbig2/JBig2_PddProc.cpp"
        "core/fxcodec/jbig2/JBig2_SddProc.cpp"
        "core/fxcodec/jbig2/JBig2_Segment.cpp"
        "core/fxcodec/jbig2/JBig2_SymbolDict.cpp"
        "core/fxcodec/jbig2/JBig2_TrdProc.cpp"
    ];
};

in { inherit libpdfiumfxcodec; }
