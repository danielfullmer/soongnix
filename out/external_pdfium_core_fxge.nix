{ cc_library_static }:
let

libpdfium-fxge = cc_library_static {
    name = "libpdfium-fxge";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    static_libs = [
        "libpdfium-agg"
        "libpdfium-fxcrt"
    ];

    exclude_srcs = [
        #  pdf_enable_xfa
        "cfx_unicodeencodingex.cpp"
        #  is_win
        "dib/cfx_dibextractor.cpp"
        #  is_linux
        "fx_ge_linux.cpp"
    ];

    srcs = [
        "cfx_cliprgn.cpp"
        "cfx_color.cpp"
        "cfx_face.cpp"
        "cfx_folderfontinfo.cpp"
        "cfx_font.cpp"
        "cfx_fontcache.cpp"
        "cfx_fontmapper.cpp"
        "cfx_fontmapper_unittest.cpp"
        "cfx_fontmgr.cpp"
        "cfx_gemodule.cpp"
        "cfx_glyphbitmap.cpp"
        "cfx_glyphcache.cpp"
        "cfx_graphstate.cpp"
        "cfx_graphstatedata.cpp"
        "cfx_pathdata.cpp"
        "cfx_renderdevice.cpp"
        "cfx_substfont.cpp"
        "cfx_unicodeencoding.cpp"
        "cfx_unicodeencodingex.cpp"
        "fx_font.cpp"
        "fx_font_unittest.cpp"
        "fx_ge_fontmap.cpp"
        "fx_ge_linux.cpp"
        "fx_ge_text_embeddertest.cpp"
        "renderdevicedriver_iface.cpp"
        "scoped_font_transform.cpp"
        "text_char_pos.cpp"
        "text_glyph_pos.cpp"
        "dib/cfx_bitmapcomposer.cpp"
        "dib/cfx_bitmapstorer.cpp"
        "dib/cfx_cmyk_to_srgb.cpp"
        "dib/cfx_cmyk_to_srgb_unittest.cpp"
        "dib/cfx_dibbase.cpp"
        "dib/cfx_dibextractor.cpp"
        "dib/cfx_dibitmap.cpp"
        "dib/cfx_dibitmap_unittest.cpp"
        "dib/cfx_imagerenderer.cpp"
        "dib/cfx_imagestretcher.cpp"
        "dib/cfx_imagetransformer.cpp"
        "dib/cfx_scanlinecompositor.cpp"
        "dib/cstretchengine.cpp"
        "dib/cstretchengine_unittest.cpp"
        "dib/fx_dib_main.cpp"
        "freetype/fx_freetype.cpp"
        "fontdata/chromefontdata/FoxitDingbats.cpp"
        "fontdata/chromefontdata/FoxitFixed.cpp"
        "fontdata/chromefontdata/FoxitFixedBold.cpp"
        "fontdata/chromefontdata/FoxitFixedBoldItalic.cpp"
        "fontdata/chromefontdata/FoxitFixedItalic.cpp"
        "fontdata/chromefontdata/FoxitSans.cpp"
        "fontdata/chromefontdata/FoxitSansBold.cpp"
        "fontdata/chromefontdata/FoxitSansBoldItalic.cpp"
        "fontdata/chromefontdata/FoxitSansItalic.cpp"
        "fontdata/chromefontdata/FoxitSansMM.cpp"
        "fontdata/chromefontdata/FoxitSerif.cpp"
        "fontdata/chromefontdata/FoxitSerifBold.cpp"
        "fontdata/chromefontdata/FoxitSerifBoldItalic.cpp"
        "fontdata/chromefontdata/FoxitSerifItalic.cpp"
        "fontdata/chromefontdata/FoxitSerifMM.cpp"
        "fontdata/chromefontdata/FoxitSymbol.cpp"
        #  !pdf_use_skia
        "agg/fx_agg_driver.cpp"
        #  is_android
        "android/cfpf_skiadevicemodule.cpp"
        "android/cfpf_skiafont.cpp"
        "android/cfpf_skiafontmgr.cpp"
        "android/cfpf_skiapathfont.cpp"
        "android/cfx_androidfontinfo.cpp"
        "android/fx_android_imp.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfium-fxge; }
