{ cc_library_headers }:
let

media_plugin_headers = cc_library_headers {
    name = "media_plugin_headers";
    vendor_available = true;
    export_include_dirs = [
        "media_plugin"
        "media_plugin/media/openmax"
    ];
    header_libs = [
        "libstagefright_headers"
        "libcutils_headers"
        "libutils_headers"
        "libstagefright_foundation_headers"
    ];
    export_header_lib_headers = [
        "libstagefright_headers"
        "libcutils_headers"
        "libutils_headers"
        "libstagefright_foundation_headers"
    ];
};

in { inherit media_plugin_headers; }
