{ cc_library_static }:
let

libpdfium-page = cc_library_static {
    name = "libpdfium-page";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-fxcodec"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
        "libpdfium-font"
        "libpdfium-parser"
    ];

    srcs = [
        "cpdf_allstates.cpp"
        "cpdf_annotcontext.cpp"
        "cpdf_clippath.cpp"
        "cpdf_color.cpp"
        "cpdf_colorspace.cpp"
        "cpdf_colorstate.cpp"
        "cpdf_contentmarkitem.cpp"
        "cpdf_contentmarks.cpp"
        "cpdf_contentparser.cpp"
        "cpdf_devicecs.cpp"
        "cpdf_devicecs_unittest.cpp"
        "cpdf_dib.cpp"
        "cpdf_docpagedata.cpp"
        "cpdf_expintfunc.cpp"
        "cpdf_form.cpp"
        "cpdf_formobject.cpp"
        "cpdf_function.cpp"
        "cpdf_generalstate.cpp"
        "cpdf_graphicstates.cpp"
        "cpdf_iccprofile.cpp"
        "cpdf_image.cpp"
        "cpdf_imageobject.cpp"
        "cpdf_meshstream.cpp"
        "cpdf_occontext.cpp"
        "cpdf_page.cpp"
        "cpdf_pagemodule.cpp"
        "cpdf_pageobject.cpp"
        "cpdf_pageobjectholder.cpp"
        "cpdf_pageobjectholder_unittest.cpp"
        "cpdf_path.cpp"
        "cpdf_pathobject.cpp"
        "cpdf_pattern.cpp"
        "cpdf_patterncs.cpp"
        "cpdf_psengine.cpp"
        "cpdf_psengine_unittest.cpp"
        "cpdf_psfunc.cpp"
        "cpdf_sampledfunc.cpp"
        "cpdf_shadingobject.cpp"
        "cpdf_shadingpattern.cpp"
        "cpdf_stitchfunc.cpp"
        "cpdf_streamcontentparser.cpp"
        "cpdf_streamcontentparser_unittest.cpp"
        "cpdf_streamparser.cpp"
        "cpdf_streamparser_unittest.cpp"
        "cpdf_textobject.cpp"
        "cpdf_textstate.cpp"
        "cpdf_tilingpattern.cpp"
        "cpdf_transferfunc.cpp"
        "cpdf_transferfuncdib.cpp"
        "cpdf_transparency.cpp"
    ];
};

in { inherit libpdfium-page; }
