{ cc_library_headers, cc_library_shared, xsd_config }:
let

libstagefright_xmlparser_headers = cc_library_headers {
    name = "libstagefright_xmlparser_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
};

libstagefright_xmlparser = cc_library_shared {
    name = "libstagefright_xmlparser";
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    srcs = [
        "MediaCodecsXmlParser.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    shared_libs = [
        "libbase"
        "libexpat"
        "liblog"
        "libstagefright_omx_utils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    clang = true;

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };

};

media_codecs = xsd_config {
    name = "media_codecs";
    srcs = ["media_codecs.xsd"];
    package_name = "media.codecs";
};

in { inherit libstagefright_xmlparser libstagefright_xmlparser_headers media_codecs; }
