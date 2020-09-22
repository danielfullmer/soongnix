{ cc_library_static }:
let

libpdfium-fpdfdoc = cc_library_static {
    name = "libpdfium-fpdfdoc";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-font"
        "libpdfium-page"
        "libpdfium-parser"
        "libpdfium-render"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
    ];

    srcs = [
        "cba_fontmap.cpp"
        "cline.cpp"
        "cpdf_aaction.cpp"
        "cpdf_action.cpp"
        "cpdf_annot.cpp"
        "cpdf_annot_unittest.cpp"
        "cpdf_annotlist.cpp"
        "cpdf_apsettings.cpp"
        "cpdf_bookmark.cpp"
        "cpdf_bookmarktree.cpp"
        "cpdf_color_utils.cpp"
        "cpdf_defaultappearance.cpp"
        "cpdf_defaultappearance_unittest.cpp"
        "cpdf_dest.cpp"
        "cpdf_dest_unittest.cpp"
        "cpdf_filespec.cpp"
        "cpdf_filespec_unittest.cpp"
        "cpdf_formcontrol.cpp"
        "cpdf_formfield.cpp"
        "cpdf_formfield_unittest.cpp"
        "cpdf_icon.cpp"
        "cpdf_iconfit.cpp"
        "cpdf_interactiveform.cpp"
        "cpdf_link.cpp"
        "cpdf_linklist.cpp"
        "cpdf_metadata.cpp"
        "cpdf_metadata_unittest.cpp"
        "cpdf_nametree.cpp"
        "cpdf_nametree_unittest.cpp"
        "cpdf_numbertree.cpp"
        "cpdf_pagelabel.cpp"
        "cpdf_structelement.cpp"
        "cpdf_structtree.cpp"
        "cpdf_variabletext.cpp"
        "cpdf_viewerpreferences.cpp"
        "cpvt_fontmap.cpp"
        "cpvt_generateap.cpp"
        "cpvt_wordinfo.cpp"
        "csection.cpp"
        "ctypeset.cpp"
    ];
};

in { inherit libpdfium-fpdfdoc; }
