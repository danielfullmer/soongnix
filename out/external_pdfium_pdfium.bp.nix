{ cc_library_shared }:
let

libpdfium = cc_library_shared {
    name = "libpdfium";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumfdrm"
        "libpdfiumformfiller"
        "libpdfiumfpdfapi"
        "libpdfiumfpdfdoc"
        "libpdfiumfpdftext"
        "libpdfiumfxcodec"
        "libpdfiumfxcrt"
        "libpdfiumfxge"
        "libpdfiumfxjs"
        "libpdfiumpwl"
        "libpdfiumfx_agg"
        "libpdfiumbigint"
        "libpdfiumpdfiumbase"
        "libpdfiumlcms2"
        "libpdfiumfx_libopenjpeg"
    ];

    #  TODO: figure out why turning on exceptions requires manually linking libdl
    shared_libs = [
        "libdl"
        "libft2"
        "libz"
        "libjpeg"
    ];

    srcs = [
        "fpdfsdk/cba_annotiterator.cpp"
        "fpdfsdk/cfx_systemhandler.cpp"
        "fpdfsdk/cpdfsdk_annot.cpp"
        "fpdfsdk/cpdfsdk_annothandlermgr.cpp"
        "fpdfsdk/cpdfsdk_annotiteration.cpp"
        "fpdfsdk/cpdfsdk_baannot.cpp"
        "fpdfsdk/cpdfsdk_baannothandler.cpp"
        "fpdfsdk/cpdfsdk_datetime.cpp"
        "fpdfsdk/cpdfsdk_formfillenvironment.cpp"
        "fpdfsdk/cpdfsdk_interform.cpp"
        "fpdfsdk/cpdfsdk_pageview.cpp"
        "fpdfsdk/cpdfsdk_widget.cpp"
        "fpdfsdk/cpdfsdk_widgethandler.cpp"
        "fpdfsdk/fpdf_dataavail.cpp"
        "fpdfsdk/fpdf_ext.cpp"
        "fpdfsdk/fpdf_flatten.cpp"
        "fpdfsdk/fpdf_progressive.cpp"
        "fpdfsdk/fpdf_searchex.cpp"
        "fpdfsdk/fpdf_structtree.cpp"
        "fpdfsdk/fpdf_sysfontinfo.cpp"
        "fpdfsdk/fpdf_transformpage.cpp"
        "fpdfsdk/fpdfannot.cpp"
        "fpdfsdk/fpdfattachment.cpp"
        "fpdfsdk/fpdfcatalog.cpp"
        "fpdfsdk/fpdfdoc.cpp"
        "fpdfsdk/fpdfeditimg.cpp"
        "fpdfsdk/fpdfeditpage.cpp"
        "fpdfsdk/fpdfeditpath.cpp"
        "fpdfsdk/fpdfedittext.cpp"
        "fpdfsdk/fpdfformfill.cpp"
        "fpdfsdk/fpdfppo.cpp"
        "fpdfsdk/fpdfsave.cpp"
        "fpdfsdk/fpdftext.cpp"
        "fpdfsdk/fpdfview.cpp"
        "fpdfsdk/fsdk_actionhandler.cpp"
        "fpdfsdk/fsdk_filewriteadapter.cpp"
        "fpdfsdk/fsdk_pauseadapter.cpp"
        "fpdfsdk/pdfsdk_fieldaction.cpp"
    ];

    export_include_dirs = ["public"];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfium; }
