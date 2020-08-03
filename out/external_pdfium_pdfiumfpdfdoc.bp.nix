{ cc_library_static }:
let

libpdfiumfpdfdoc = cc_library_static {
    name = "libpdfiumfpdfdoc";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumfxcrt"
    ];

    srcs = [
        "core/fpdfdoc/cline.cpp"
        "core/fpdfdoc/cpdf_aaction.cpp"
        "core/fpdfdoc/cpdf_action.cpp"
        "core/fpdfdoc/cpdf_actionfields.cpp"
        "core/fpdfdoc/cpdf_annot.cpp"
        "core/fpdfdoc/cpdf_annotlist.cpp"
        "core/fpdfdoc/cpdf_apsettings.cpp"
        "core/fpdfdoc/cpdf_bookmark.cpp"
        "core/fpdfdoc/cpdf_bookmarktree.cpp"
        "core/fpdfdoc/cpdf_defaultappearance.cpp"
        "core/fpdfdoc/cpdf_dest.cpp"
        "core/fpdfdoc/cpdf_docjsactions.cpp"
        "core/fpdfdoc/cpdf_filespec.cpp"
        "core/fpdfdoc/cpdf_formcontrol.cpp"
        "core/fpdfdoc/cpdf_formfield.cpp"
        "core/fpdfdoc/cpdf_iconfit.cpp"
        "core/fpdfdoc/cpdf_interform.cpp"
        "core/fpdfdoc/cpdf_link.cpp"
        "core/fpdfdoc/cpdf_linklist.cpp"
        "core/fpdfdoc/cpdf_metadata.cpp"
        "core/fpdfdoc/cpdf_nametree.cpp"
        "core/fpdfdoc/cpdf_numbertree.cpp"
        "core/fpdfdoc/cpdf_occontext.cpp"
        "core/fpdfdoc/cpdf_pagelabel.cpp"
        "core/fpdfdoc/cpdf_structelement.cpp"
        "core/fpdfdoc/cpdf_structtree.cpp"
        "core/fpdfdoc/cpdf_variabletext.cpp"
        "core/fpdfdoc/cpdf_viewerpreferences.cpp"
        "core/fpdfdoc/cpvt_fontmap.cpp"
        "core/fpdfdoc/cpvt_generateap.cpp"
        "core/fpdfdoc/cpvt_wordinfo.cpp"
        "core/fpdfdoc/csection.cpp"
        "core/fpdfdoc/ctypeset.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfiumfpdfdoc; }
