{ cc_library_static }:
let

libpdfium-fxcodec = cc_library_static {
    name = "libpdfium-fxcodec";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    static_libs = [
        "libpdfium-lcms2"
        "libpdfium-libopenjpeg2"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
    ];

    shared_libs = [
        "libz"
        "libjpeg"
    ];

    exclude_srcs = [
        #  pdf_enable_xfa
        "progressivedecoder.cpp"
        #  pdf_enable_xfa_bmp
        "bmp/bmpmodule.cpp"
        "bmp/bmpmodule.h"
        "bmp/cfx_bmpcontext.cpp"
        "bmp/cfx_bmpcontext.h"
        "bmp/cfx_bmpdecompressor.cpp"
        "bmp/cfx_bmpdecompressor.h"
        "bmp/fx_bmp.h"
        #  pdf_enable_xfa_gif
        "gif/cfx_gif.cpp"
        "gif/cfx_gif.h"
        "gif/cfx_gifcontext.cpp"
        "gif/cfx_gifcontext.h"
        "gif/cfx_gifcontext_unittest.cpp"
        "gif/cfx_lzwdecompressor.cpp"
        "gif/cfx_lzwdecompressor.h"
        "gif/cfx_lzwdecompressor_unittest.cpp"
        "gif/gifmodule.cpp"
        "gif/gifmodule.h"
        #  pdf_enable_xfa_png
        "png/DEPS"
        "png/pngmodule.cpp"
        "png/pngmodule.h"
        #  pdf_enable_xfa_tiff
        "tiff/DEPS"
        "tiff/tiffmodule.cpp"
        "tiff/tiffmodule.h"
    ];

    srcs = [
        "cfx_codec_memory.cpp"
        "fx_codec.cpp"
        "progressivedecoder.cpp"
        "progressivedecoder_unittest.cpp"
        "scanlinedecoder.cpp"
        "basic/a85_unittest.cpp"
        "basic/basicmodule.cpp"
        "basic/rle_unittest.cpp"
        "bmp/bmpmodule.cpp"
        "bmp/cfx_bmpcontext.cpp"
        "bmp/cfx_bmpdecompressor.cpp"
        "fax/faxmodule.cpp"
        "flate/flatemodule.cpp"
        "gif/cfx_gif.cpp"
        "gif/cfx_gifcontext.cpp"
        "gif/cfx_gifcontext_unittest.cpp"
        "gif/cfx_lzwdecompressor.cpp"
        "gif/cfx_lzwdecompressor_unittest.cpp"
        "gif/gifmodule.cpp"
        "icc/iccmodule.cpp"
        "jbig2/JBig2_ArithDecoder.cpp"
        "jbig2/JBig2_ArithIntDecoder.cpp"
        "jbig2/JBig2_BitStream.cpp"
        "jbig2/JBig2_BitStream_unittest.cpp"
        "jbig2/JBig2_Context.cpp"
        "jbig2/JBig2_DocumentContext.cpp"
        "jbig2/JBig2_GrdProc.cpp"
        "jbig2/JBig2_GrrdProc.cpp"
        "jbig2/JBig2_HtrdProc.cpp"
        "jbig2/JBig2_HuffmanDecoder.cpp"
        "jbig2/JBig2_HuffmanTable.cpp"
        "jbig2/JBig2_Image.cpp"
        "jbig2/JBig2_Image_unittest.cpp"
        "jbig2/JBig2_PatternDict.cpp"
        "jbig2/JBig2_PddProc.cpp"
        "jbig2/JBig2_SddProc.cpp"
        "jbig2/JBig2_Segment.cpp"
        "jbig2/JBig2_SymbolDict.cpp"
        "jbig2/JBig2_TrdProc.cpp"
        "jbig2/jbig2_embeddertest.cpp"
        "jbig2/jbig2module.cpp"
        "jpeg/jpegmodule.cpp"
        "jpx/cjpx_decoder.cpp"
        "jpx/jpx_decode_utils.cpp"
        "jpx/jpx_unittest.cpp"
        "jpx/jpxmodule.cpp"
        "png/pngmodule.cpp"
        "tiff/tiffmodule.cpp"
    ];
};

in { inherit libpdfium-fxcodec; }
