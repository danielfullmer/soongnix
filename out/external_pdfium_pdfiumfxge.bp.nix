{ cc_library_static }:
let

libpdfiumfxge = cc_library_static {
    name = "libpdfiumfxge";
    defaults = ["pdfium-core"];

    cflags = [
        "-DDEFINE_PS_TABLES"
        "-DEFINE_PS_TABLES_DATA"
    ];

    static_libs = [
        "libpdfiumfxcrt"
        "libpdfiumfx_agg"
    ];

    srcs = [
        "core/fxge/android/cfpf_skiabufferfont.cpp"
        "core/fxge/android/cfpf_skiadevicemodule.cpp"
        "core/fxge/android/cfpf_skiafilefont.cpp"
        "core/fxge/android/cfpf_skiafont.cpp"
        "core/fxge/android/cfpf_skiafontdescriptor.cpp"
        "core/fxge/android/cfpf_skiafontmgr.cpp"
        "core/fxge/android/cfpf_skiapathfont.cpp"
        "core/fxge/android/cfx_androidfontinfo.cpp"
        "core/fxge/android/fx_android_imp.cpp"
        "core/fxge/cfx_cliprgn.cpp"
        "core/fxge/cfx_color.cpp"
        "core/fxge/cfx_facecache.cpp"
        "core/fxge/cfx_folderfontinfo.cpp"
        "core/fxge/cfx_font.cpp"
        "core/fxge/cfx_fontcache.cpp"
        "core/fxge/cfx_fontmapper.cpp"
        "core/fxge/cfx_fontmgr.cpp"
        "core/fxge/cfx_gemodule.cpp"
        "core/fxge/cfx_graphstate.cpp"
        "core/fxge/cfx_graphstatedata.cpp"
        "core/fxge/cfx_pathdata.cpp"
        "core/fxge/cfx_renderdevice.cpp"
        "core/fxge/cfx_substfont.cpp"
        "core/fxge/cfx_unicodeencoding.cpp"
        "core/fxge/cttfontdesc.cpp"
        "core/fxge/dib/cfx_bitmapcomposer.cpp"
        "core/fxge/dib/cfx_bitmapstorer.cpp"
        "core/fxge/dib/cfx_dibextractor.cpp"
        "core/fxge/dib/cfx_dibitmap.cpp"
        "core/fxge/dib/cfx_dibsource.cpp"
        "core/fxge/dib/cfx_filtereddib.cpp"
        "core/fxge/dib/cfx_imagerenderer.cpp"
        "core/fxge/dib/cfx_imagestretcher.cpp"
        "core/fxge/dib/cfx_imagetransformer.cpp"
        "core/fxge/dib/cfx_scanlinecompositor.cpp"
        "core/fxge/dib/cstretchengine.cpp"
        "core/fxge/dib/fx_dib_main.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitDingbats.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitFixed.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitFixedBold.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitFixedBoldItalic.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitFixedItalic.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSans.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSansBold.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSansBoldItalic.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSansItalic.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSansMM.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSerif.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSerifBold.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSerifBoldItalic.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSerifItalic.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSerifMM.cpp"
        "core/fxge/fontdata/chromefontdata/FoxitSymbol.cpp"
        "core/fxge/freetype/fx_freetype.cpp"
        "core/fxge/fx_ge_fontmap.cpp"
        "core/fxge/fx_ge_linux.cpp"
        "core/fxge/fx_ge_text.cpp"
        "core/fxge/ifx_renderdevicedriver.cpp"

        "core/fxge/agg/fx_agg_driver.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfiumfxge; }
