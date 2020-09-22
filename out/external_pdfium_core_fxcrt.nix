{ cc_library_static }:
let

libpdfium-fxcrt = cc_library_static {
    name = "libpdfium-fxcrt";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    export_shared_lib_headers = [
        "libandroidicu"
    ];

    static_libs = [
        "libpdfium-third_party-base"
    ];

    shared_libs = [
        "libandroidicu"
    ];

    exclude_srcs = [
        #  is_win
        "cfx_fileaccess_windows.cpp"
        #  pdf_enable_xfa
        "cfx_memorystream.cpp"
    ];

    srcs = [
        "autorestorer_unittest.cpp"
        "byteorder_unittest.cpp"
        "bytestring.cpp"
        "bytestring_unittest.cpp"
        "cfx_binarybuf.cpp"
        "cfx_bitstream.cpp"
        "cfx_bitstream_unittest.cpp"
        "cfx_datetime.cpp"
        "cfx_fileaccess_posix.cpp"
        "cfx_fileaccess_windows.cpp"
        "cfx_memorystream.cpp"
        "cfx_memorystream_unittest.cpp"
        "cfx_readonlymemorystream.cpp"
        "cfx_seekablestreamproxy.cpp"
        "cfx_seekablestreamproxy_unittest.cpp"
        "cfx_timer.cpp"
        "cfx_timer_unittest.cpp"
        "cfx_utf8decoder.cpp"
        "cfx_utf8encoder.cpp"
        "cfx_widetextbuf.cpp"
        "cfx_widetextbuf_unittest.cpp"
        "fx_bidi.cpp"
        "fx_bidi_unittest.cpp"
        "fx_codepage.cpp"
        "fx_coordinates.cpp"
        "fx_coordinates_unittest.cpp"
        "fx_extension.cpp"
        "fx_extension_unittest.cpp"
        "fx_memory.cpp"
        "fx_memory_unittest.cpp"
        "fx_memory_wrappers_unittest.cpp"
        "fx_number.cpp"
        "fx_number_unittest.cpp"
        "fx_random.cpp"
        "fx_random_unittest.cpp"
        "fx_stream.cpp"
        "fx_string.cpp"
        "fx_string_unittest.cpp"
        "fx_system.cpp"
        "fx_system_unittest.cpp"
        "fx_unicode.cpp"
        "maybe_owned_unittest.cpp"
        "observed_ptr.cpp"
        "observed_ptr_unittest.cpp"
        "pdfium_span_unittest.cpp"
        "retain_ptr_unittest.cpp"
        "retained_tree_node_unittest.cpp"
        "shared_copy_on_write_unittest.cpp"
        "string_pool_template_unittest.cpp"
        "tree_node_unittest.cpp"
        "unowned_ptr_unittest.cpp"
        "weak_ptr_unittest.cpp"
        "widestring.cpp"
        "widestring_unittest.cpp"
        "xml/cfx_xmlchardata.cpp"
        "xml/cfx_xmlchardata_unittest.cpp"
        "xml/cfx_xmldocument.cpp"
        "xml/cfx_xmldocument_unittest.cpp"
        "xml/cfx_xmlelement.cpp"
        "xml/cfx_xmlelement_unittest.cpp"
        "xml/cfx_xmlinstruction.cpp"
        "xml/cfx_xmlinstruction_unittest.cpp"
        "xml/cfx_xmlnode.cpp"
        "xml/cfx_xmlnode_unittest.cpp"
        "xml/cfx_xmlparser.cpp"
        "xml/cfx_xmlparser_unittest.cpp"
        "xml/cfx_xmltext.cpp"
        "xml/cfx_xmltext_unittest.cpp"
    ];
};

in { inherit libpdfium-fxcrt; }
