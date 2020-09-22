{ cc_library_static }:
let

libpdfium-fpdfsdk = cc_library_static {
    name = "libpdfium-fpdfsdk";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-fdrm"
        "libpdfium-edit"
        "libpdfium-font"
        "libpdfium-page"
        "libpdfium-parser"
        "libpdfium-render"
        "libpdfium-fpdfdoc"
        "libpdfium-fpdftext"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
        "libpdfium-fxjs"
        "libpdfium-formfiller"
        "libpdfium-pwl"
    ];

    srcs = [
        "cpdfsdk_actionhandler.cpp"
        "cpdfsdk_annot.cpp"
        "cpdfsdk_annothandlermgr.cpp"
        "cpdfsdk_annotiteration.cpp"
        "cpdfsdk_annotiterator.cpp"
        "cpdfsdk_annotiterator_embeddertest.cpp"
        "cpdfsdk_appstream.cpp"
        "cpdfsdk_baannot.cpp"
        "cpdfsdk_baannothandler.cpp"
        "cpdfsdk_baannothandler_embeddertest.cpp"
        "cpdfsdk_customaccess.cpp"
        "cpdfsdk_fieldaction.cpp"
        "cpdfsdk_filewriteadapter.cpp"
        "cpdfsdk_formfillenvironment.cpp"
        "cpdfsdk_helpers.cpp"
        "cpdfsdk_interactiveform.cpp"
        "cpdfsdk_pageview.cpp"
        "cpdfsdk_pauseadapter.cpp"
        "cpdfsdk_renderpage.cpp"
        "cpdfsdk_widget.cpp"
        "cpdfsdk_widgethandler.cpp"
        "fpdf_annot.cpp"
        "fpdf_annot_embeddertest.cpp"
        "fpdf_annot_unittest.cpp"
        "fpdf_attachment.cpp"
        "fpdf_attachment_embeddertest.cpp"
        "fpdf_catalog.cpp"
        "fpdf_catalog_unittest.cpp"
        "fpdf_dataavail.cpp"
        "fpdf_dataavail_embeddertest.cpp"
        "fpdf_doc.cpp"
        "fpdf_doc_embeddertest.cpp"
        "fpdf_doc_unittest.cpp"
        "fpdf_edit_embeddertest.cpp"
        "fpdf_edit_unittest.cpp"
        "fpdf_editimg.cpp"
        "fpdf_editimg_unittest.cpp"
        "fpdf_editpage.cpp"
        "fpdf_editpage_embeddertest.cpp"
        "fpdf_editpath.cpp"
        "fpdf_editpath_embeddertest.cpp"
        "fpdf_edittext.cpp"
        "fpdf_ext.cpp"
        "fpdf_ext_embeddertest.cpp"
        "fpdf_flatten.cpp"
        "fpdf_flatten_embeddertest.cpp"
        "fpdf_formfill.cpp"
        "fpdf_formfill_embeddertest.cpp"
        "fpdf_javascript.cpp"
        "fpdf_javascript_embeddertest.cpp"
        "fpdf_ppo.cpp"
        "fpdf_ppo_embeddertest.cpp"
        "fpdf_progressive.cpp"
        "fpdf_save.cpp"
        "fpdf_save_embeddertest.cpp"
        "fpdf_searchex.cpp"
        "fpdf_searchex_embeddertest.cpp"
        "fpdf_structtree.cpp"
        "fpdf_structtree_embeddertest.cpp"
        "fpdf_sysfontinfo.cpp"
        "fpdf_sysfontinfo_embeddertest.cpp"
        "fpdf_text.cpp"
        "fpdf_text_embeddertest.cpp"
        "fpdf_thumbnail.cpp"
        "fpdf_thumbnail_embeddertest.cpp"
        "fpdf_transformpage.cpp"
        "fpdf_transformpage_embeddertest.cpp"
        "fpdf_view.cpp"
        "fpdf_view_embeddertest.cpp"
        "fpdf_view_unittest.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfium-fpdfsdk; }
