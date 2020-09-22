{ cc_library_static }:
let

libpdfium-parser = cc_library_static {
    name = "libpdfium-parser";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-fdrm"
        "libpdfium-fxcodec"
        "libpdfium-fxcrt"
    ];

    exclude_srcs = [
        #  pdf_enable_xfa
        "cpdf_seekablemultistream.cpp"
    ];

    srcs = [
        "cfdf_document.cpp"
        "cpdf_array.cpp"
        "cpdf_array_unittest.cpp"
        "cpdf_boolean.cpp"
        "cpdf_cross_ref_avail.cpp"
        "cpdf_cross_ref_avail_unittest.cpp"
        "cpdf_cross_ref_table.cpp"
        "cpdf_crypto_handler.cpp"
        "cpdf_data_avail.cpp"
        "cpdf_dictionary.cpp"
        "cpdf_document.cpp"
        "cpdf_document_unittest.cpp"
        "cpdf_encryptor.cpp"
        "cpdf_flateencoder.cpp"
        "cpdf_hint_tables.cpp"
        "cpdf_hint_tables_unittest.cpp"
        "cpdf_indirect_object_holder.cpp"
        "cpdf_indirect_object_holder_unittest.cpp"
        "cpdf_linearized_header.cpp"
        "cpdf_name.cpp"
        "cpdf_null.cpp"
        "cpdf_number.cpp"
        "cpdf_object.cpp"
        "cpdf_object_avail.cpp"
        "cpdf_object_avail_unittest.cpp"
        "cpdf_object_stream.cpp"
        "cpdf_object_unittest.cpp"
        "cpdf_object_walker.cpp"
        "cpdf_object_walker_unittest.cpp"
        "cpdf_page_object_avail.cpp"
        "cpdf_page_object_avail_unittest.cpp"
        "cpdf_parser.cpp"
        "cpdf_parser_embeddertest.cpp"
        "cpdf_parser_unittest.cpp"
        "cpdf_read_validator.cpp"
        "cpdf_read_validator_unittest.cpp"
        "cpdf_reference.cpp"
        "cpdf_security_handler.cpp"
        "cpdf_security_handler_embeddertest.cpp"
        "cpdf_seekablemultistream.cpp"
        "cpdf_seekablemultistream_unittest.cpp"
        "cpdf_simple_parser.cpp"
        "cpdf_simple_parser_unittest.cpp"
        "cpdf_stream.cpp"
        "cpdf_stream_acc.cpp"
        "cpdf_stream_acc_unittest.cpp"
        "cpdf_string.cpp"
        "cpdf_syntax_parser.cpp"
        "cpdf_syntax_parser_unittest.cpp"
        "fpdf_parser_decode.cpp"
        "fpdf_parser_decode_embeddertest.cpp"
        "fpdf_parser_decode_unittest.cpp"
        "fpdf_parser_utility.cpp"
        "fpdf_parser_utility_unittest.cpp"
    ];
};

in { inherit libpdfium-parser; }
