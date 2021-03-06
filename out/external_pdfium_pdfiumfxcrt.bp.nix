{ cc_library_static }:
let

libpdfiumfxcrt = cc_library_static {
    name = "libpdfiumfxcrt";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumpdfiumbase"
    ];

    shared_libs = [
        "libft2"
    ];

    srcs = [
        "core/fxcrt/bytestring.cpp"
        "core/fxcrt/cfx_binarybuf.cpp"
        "core/fxcrt/cfx_bitstream.cpp"
        "core/fxcrt/cfx_datetime.cpp"
        "core/fxcrt/cfx_fileaccess_posix.cpp"
        "core/fxcrt/cfx_fileaccess_windows.cpp"
        "core/fxcrt/cfx_memorystream.cpp"
        "core/fxcrt/cfx_seekablemultistream.cpp"
        "core/fxcrt/cfx_utf8decoder.cpp"
        "core/fxcrt/cfx_widetextbuf.cpp"
        "core/fxcrt/fx_bidi.cpp"
        "core/fxcrt/fx_coordinates.cpp"
        "core/fxcrt/fx_extension.cpp"
        "core/fxcrt/fx_memory.cpp"
        "core/fxcrt/fx_random.cpp"
        "core/fxcrt/fx_stream.cpp"
        "core/fxcrt/fx_string.cpp"
        "core/fxcrt/fx_system.cpp"
        "core/fxcrt/fx_ucddata.cpp"
        "core/fxcrt/fx_unicode.cpp"
        "core/fxcrt/widestring.cpp"
        "core/fxcrt/xml/cxml_attritem.cpp"
        "core/fxcrt/xml/cxml_content.cpp"
        "core/fxcrt/xml/cxml_databufacc.cpp"
        "core/fxcrt/xml/cxml_element.cpp"
        "core/fxcrt/xml/cxml_object.cpp"
        "core/fxcrt/xml/cxml_parser.cpp"
    ];
};

in { inherit libpdfiumfxcrt; }
