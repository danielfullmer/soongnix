{ cc_defaults, cc_library_headers, cc_library_shared }:
let

pdfium-common = cc_defaults {
    name = "pdfium-common";
    cflags = [
        "-O3"
        "-fstrict-aliasing"
        "-fprefetch-loop-arrays"
        "-fexceptions"

        "-Wno-implicit-fallthrough"
        "-Wno-missing-field-initializers"
        "-Wno-non-virtual-dtor"
        "-Wno-unused-parameter"

        #  The new pass manager causes non-deterministic build result.
        #  http://b/135660678
        "-fno-experimental-new-pass-manager"

        #  pdfium_common_config
        "-DOPJ_STATIC"
        "-DPNG_PREFIX"
        "-DPNG_USE_READ_MACROS"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    include_dirs = [
        "external/freetype/include"
    ];

    header_libs = [
        "pdfium-headers"
        "pdfium-third-party-headers"
    ];
};

pdfium-core = cc_defaults {
    name = "pdfium-core";

    defaults = [
        "pdfium-common"
    ];

    exclude_srcs = [
        "core/fdrm/fx_crypt_unittest.cpp"
        "core/fpdfapi/edit/cpdf_pagecontentgenerator_unittest.cpp"
        "core/fpdfapi/font/cpdf_cidfont_unittest.cpp"
        "core/fpdfapi/font/cpdf_cmapparser_unittest.cpp"
        "core/fpdfapi/font/cpdf_tounicodemap_unittest.cpp"
        "core/fpdfapi/page/cpdf_devicecs_unittest.cpp"
        "core/fpdfapi/page/cpdf_pageobjectholder_unittest.cpp"
        "core/fpdfapi/page/cpdf_psengine_unittest.cpp"
        "core/fpdfapi/page/cpdf_streamcontentparser_unittest.cpp"
        "core/fpdfapi/page/cpdf_streamparser_unittest.cpp"
        "core/fpdfapi/parser/cpdf_array_unittest.cpp"
        "core/fpdfapi/parser/cpdf_cross_ref_avail_unittest.cpp"
        "core/fpdfapi/parser/cpdf_document_unittest.cpp"
        "core/fpdfapi/parser/cpdf_hint_tables_unittest.cpp"
        "core/fpdfapi/parser/cpdf_indirect_object_holder_unittest.cpp"
        "core/fpdfapi/parser/cpdf_object_avail_unittest.cpp"
        "core/fpdfapi/parser/cpdf_object_unittest.cpp"
        "core/fpdfapi/parser/cpdf_object_walker_unittest.cpp"
        "core/fpdfapi/parser/cpdf_page_object_avail_unittest.cpp"
        "core/fpdfapi/parser/cpdf_parser_unittest.cpp"
        "core/fpdfapi/parser/cpdf_read_validator_unittest.cpp"
        "core/fpdfapi/parser/cpdf_seekablemultistream_unittest.cpp"
        "core/fpdfapi/parser/cpdf_simple_parser_unittest.cpp"
        "core/fpdfapi/parser/cpdf_stream_acc_unittest.cpp"
        "core/fpdfapi/parser/cpdf_syntax_parser_unittest.cpp"
        "core/fpdfapi/parser/fpdf_parser_decode_unittest.cpp"
        "core/fpdfapi/parser/fpdf_parser_utility_unittest.cpp"
        "core/fpdfapi/render/cpdf_docrenderdata_unittest.cpp"
        "core/fpdfdoc/cpdf_annot_unittest.cpp"
        "core/fpdfdoc/cpdf_defaultappearance_unittest.cpp"
        "core/fpdfdoc/cpdf_dest_unittest.cpp"
        "core/fpdfdoc/cpdf_filespec_unittest.cpp"
        "core/fpdfdoc/cpdf_formfield_unittest.cpp"
        "core/fpdfdoc/cpdf_metadata_unittest.cpp"
        "core/fpdfdoc/cpdf_nametree_unittest.cpp"
        "core/fpdftext/cpdf_linkextract_unittest.cpp"
        "core/fxcodec/progressivedecoder_unittest.cpp"
        "core/fxcodec/basic/a85_unittest.cpp"
        "core/fxcodec/basic/rle_unittest.cpp"
        "core/fxcodec/gif/cfx_gifcontext_unittest.cpp"
        "core/fxcodec/gif/cfx_lzwdecompressor_unittest.cpp"
        "core/fxcodec/jbig2/JBig2_BitStream_unittest.cpp"
        "core/fxcodec/jbig2/JBig2_Image_unittest.cpp"
        "core/fxcodec/jpx/jpx_unittest.cpp"
        "core/fxcrt/autorestorer_unittest.cpp"
        "core/fxcrt/byteorder_unittest.cpp"
        "core/fxcrt/bytestring_unittest.cpp"
        "core/fxcrt/cfx_bitstream_unittest.cpp"
        "core/fxcrt/cfx_memorystream_unittest.cpp"
        "core/fxcrt/cfx_seekablestreamproxy_unittest.cpp"
        "core/fxcrt/cfx_timer_unittest.cpp"
        "core/fxcrt/cfx_widetextbuf_unittest.cpp"
        "core/fxcrt/fx_bidi_unittest.cpp"
        "core/fxcrt/fx_coordinates_unittest.cpp"
        "core/fxcrt/fx_extension_unittest.cpp"
        "core/fxcrt/fx_memory_unittest.cpp"
        "core/fxcrt/fx_memory_wrappers_unittest.cpp"
        "core/fxcrt/fx_number_unittest.cpp"
        "core/fxcrt/fx_random_unittest.cpp"
        "core/fxcrt/fx_string_unittest.cpp"
        "core/fxcrt/fx_system_unittest.cpp"
        "core/fxcrt/maybe_owned_unittest.cpp"
        "core/fxcrt/observed_ptr_unittest.cpp"
        "core/fxcrt/pdfium_span_unittest.cpp"
        "core/fxcrt/retain_ptr_unittest.cpp"
        "core/fxcrt/retained_tree_node_unittest.cpp"
        "core/fxcrt/shared_copy_on_write_unittest.cpp"
        "core/fxcrt/string_pool_template_unittest.cpp"
        "core/fxcrt/tree_node_unittest.cpp"
        "core/fxcrt/unowned_ptr_unittest.cpp"
        "core/fxcrt/weak_ptr_unittest.cpp"
        "core/fxcrt/widestring_unittest.cpp"
        "core/fxcrt/css/cfx_cssdeclaration_unittest.cpp"
        "core/fxcrt/css/cfx_cssstylesheet_unittest.cpp"
        "core/fxcrt/css/cfx_cssvaluelistparser_unittest.cpp"
        "core/fxcrt/xml/cfx_xmlchardata_unittest.cpp"
        "core/fxcrt/xml/cfx_xmldocument_unittest.cpp"
        "core/fxcrt/xml/cfx_xmlelement_unittest.cpp"
        "core/fxcrt/xml/cfx_xmlinstruction_unittest.cpp"
        "core/fxcrt/xml/cfx_xmlnode_unittest.cpp"
        "core/fxcrt/xml/cfx_xmlparser_unittest.cpp"
        "core/fxcrt/xml/cfx_xmltext_unittest.cpp"
        "core/fxge/cfx_fontmapper_unittest.cpp"
        "core/fxge/fx_font_unittest.cpp"
        "core/fxge/dib/cfx_cmyk_to_srgb_unittest.cpp"
        "core/fxge/dib/cfx_dibitmap_unittest.cpp"
        "core/fxge/dib/cstretchengine_unittest.cpp"
        "fpdfsdk/fpdf_annot_unittest.cpp"
        "fpdfsdk/fpdf_catalog_unittest.cpp"
        "fpdfsdk/fpdf_doc_unittest.cpp"
        "fpdfsdk/fpdf_edit_unittest.cpp"
        "fpdfsdk/fpdf_editimg_unittest.cpp"
        "fpdfsdk/fpdf_view_unittest.cpp"
        "fxbarcode/cbc_pdf417i_unittest.cpp"
        "fxbarcode/cfx_barcode_unittest.cpp"
        "fxbarcode/datamatrix/BC_DataMatrixWriter_unittest.cpp"
        "fxbarcode/oned/BC_OnedCodaBarWriter_unittest.cpp"
        "fxbarcode/oned/BC_OnedCode128Writer_unittest.cpp"
        "fxbarcode/oned/BC_OnedCode39Writer_unittest.cpp"
        "fxbarcode/oned/BC_OnedEAN13Writer_unittest.cpp"
        "fxbarcode/oned/BC_OnedEAN8Writer_unittest.cpp"
        "fxbarcode/oned/BC_OnedUPCAWriter_unittest.cpp"
        "fxbarcode/pdf417/BC_PDF417HighLevelEncoder_unittest.cpp"
        "fxbarcode/pdf417/BC_PDF417Writer_unittest.cpp"
        "fxbarcode/qrcode/BC_QRCodeWriter_unittest.cpp"
        "fxjs/cfx_globaldata_unittest.cpp"
        "fxjs/cfx_v8_unittest.cpp"
        "fxjs/cfxjs_engine_unittest.cpp"
        "fxjs/cjs_publicmethods_unittest.cpp"
        "fxjs/cjs_util_unittest.cpp"
        "fxjs/fx_date_helpers_unittest.cpp"
        "xfa/fde/cfde_texteditengine_unittest.cpp"
        "xfa/fgas/crt/cfgas_decimal_unittest.cpp"
        "xfa/fgas/crt/cfgas_stringformatter_unittest.cpp"
        "xfa/fgas/layout/cfx_rtfbreak_unittest.cpp"
        "xfa/fgas/layout/cfx_txtbreak_unittest.cpp"
        "xfa/fxfa/cxfa_ffbarcode_unittest.cpp"
        "xfa/fxfa/cxfa_textparser_unittest.cpp"
        "xfa/fxfa/fxfa_basic_unittest.cpp"
        "xfa/fxfa/fm2js/cxfa_fmexpression_unittest.cpp"
        "xfa/fxfa/fm2js/cxfa_fmlexer_unittest.cpp"
        "xfa/fxfa/fm2js/cxfa_fmparser_unittest.cpp"
        "xfa/fxfa/fm2js/cxfa_fmsimpleexpression_unittest.cpp"
        "xfa/fxfa/parser/cxfa_document_parser_unittest.cpp"
        "xfa/fxfa/parser/cxfa_localevalue_unittest.cpp"
        "xfa/fxfa/parser/cxfa_measurement_unittest.cpp"
        "xfa/fxfa/parser/cxfa_node_unittest.cpp"
        "xfa/fxfa/parser/cxfa_nodeiteratortemplate_unittest.cpp"
        "xfa/fxfa/parser/cxfa_xmllocale_unittest.cpp"
        "xfa/fxfa/parser/xfa_basic_data_unittest.cpp"
        "xfa/fxfa/parser/xfa_utils_unittest.cpp"
        "core/fpdfapi/edit/cpdf_creator_embeddertest.cpp"
        "core/fpdfapi/parser/cpdf_parser_embeddertest.cpp"
        "core/fpdfapi/parser/cpdf_security_handler_embeddertest.cpp"
        "core/fpdfapi/parser/fpdf_parser_decode_embeddertest.cpp"
        "core/fpdfapi/render/fpdf_progressive_render_embeddertest.cpp"
        "core/fpdfapi/render/fpdf_render_pattern_embeddertest.cpp"
        "core/fxcodec/jbig2/jbig2_embeddertest.cpp"
        "core/fxge/fx_ge_text_embeddertest.cpp"
        "core/fxge/skia/fx_skia_device_embeddertest.cpp"
        "core/fxge/win32/fx_win32_device_embeddertest.cpp"
        "fpdfsdk/cpdfsdk_annotiterator_embeddertest.cpp"
        "fpdfsdk/cpdfsdk_baannothandler_embeddertest.cpp"
        "fpdfsdk/fpdf_annot_embeddertest.cpp"
        "fpdfsdk/fpdf_attachment_embeddertest.cpp"
        "fpdfsdk/fpdf_dataavail_embeddertest.cpp"
        "fpdfsdk/fpdf_doc_embeddertest.cpp"
        "fpdfsdk/fpdf_edit_embeddertest.cpp"
        "fpdfsdk/fpdf_editpage_embeddertest.cpp"
        "fpdfsdk/fpdf_editpath_embeddertest.cpp"
        "fpdfsdk/fpdf_ext_embeddertest.cpp"
        "fpdfsdk/fpdf_flatten_embeddertest.cpp"
        "fpdfsdk/fpdf_formfill_embeddertest.cpp"
        "fpdfsdk/fpdf_javascript_embeddertest.cpp"
        "fpdfsdk/fpdf_ppo_embeddertest.cpp"
        "fpdfsdk/fpdf_save_embeddertest.cpp"
        "fpdfsdk/fpdf_searchex_embeddertest.cpp"
        "fpdfsdk/fpdf_structtree_embeddertest.cpp"
        "fpdfsdk/fpdf_sysfontinfo_embeddertest.cpp"
        "fpdfsdk/fpdf_text_embeddertest.cpp"
        "fpdfsdk/fpdf_thumbnail_embeddertest.cpp"
        "fpdfsdk/fpdf_transformpage_embeddertest.cpp"
        "fpdfsdk/fpdf_view_embeddertest.cpp"
        "fpdfsdk/fpdfxfa/cpdfxfa_docenvironment_embeddertest.cpp"
        "fpdfsdk/pwl/cpwl_combo_box_embeddertest.cpp"
        "fpdfsdk/pwl/cpwl_edit_embeddertest.cpp"
        "fxjs/cfxjs_engine_embeddertest.cpp"
        "fxjs/cjs_publicmethods_embeddertest.cpp"
        "fxjs/xfa/cfxjse_app_embeddertest.cpp"
        "fxjs/xfa/cfxjse_formcalc_context_embeddertest.cpp"
        "fxjs/xfa/cfxjse_value_embeddertest.cpp"
        "fxjs/xfa/cjx_hostpseudomodel_embeddertest.cpp"
        "fxjs/xfa/cjx_list_embeddertest.cpp"
        "xfa/fwl/cfwl_edit_embeddertest.cpp"
        "xfa/fxfa/layout/cxfa_layoutitem_embeddertest.cpp"
        "xfa/fxfa/parser/cxfa_document_parser_embeddertest.cpp"
    ];
};

pdfium-headers = cc_library_headers {
    name = "pdfium-headers";
    export_include_dirs = ["."];
};

pdfium-third-party-headers = cc_library_headers {
    name = "pdfium-third-party-headers";
    export_include_dirs = ["third_party"];
};

libpdfium = cc_library_shared {
    name = "libpdfium";
    defaults = ["pdfium-core"];

    header_libs = [
        "libpdfium-constants"
    ];

    whole_static_libs = [
        "libpdfium-fpdfsdk"
    ];

    #  Transitivity is not supported for static libraries (yet).
    #  Lists the whole transitivity closure here.
    static_libs = [
        "libpdfium-agg"
        "libpdfium-cmaps"
        "libpdfium-edit"
        "libpdfium-fdrm"
        "libpdfium-font"
        "libpdfium-formfiller"
        "libpdfium-fpdfdoc"
        "libpdfium-fpdftext"
        "libpdfium-fxcodec"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
        "libpdfium-fxjs"
        "libpdfium-libopenjpeg2"
        "libpdfium-page"
        "libpdfium-parser"
        "libpdfium-pwl"
        "libpdfium-render"
        "libpdfium-skia_shared"
        "libpdfium-third_party-base"
        "libpdfium-lcms2"
    ];

    #  TODO: figure out why turning on exceptions requires manually linking libdl
    shared_libs = [
        "libandroidicu"
        "libdl"
        "libft2"
        "libjpeg"
        "libz"
    ];

    export_include_dirs = ["public"];

};

subdirs = ["third_party"];

in { inherit libpdfium pdfium-common pdfium-core pdfium-headers pdfium-third-party-headers; }
