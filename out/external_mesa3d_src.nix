{ cc_library_headers }:
let

libmesa_glsl_utils_includes = cc_library_headers {
    name = "libmesa_glsl_utils_includes";
    export_include_dirs = [
        "compiler/nir"
        "mapi"
        "gallium/include"
        "gallium/auxiliary"
    ];
    host_supported = true;
    vendor = true;
    visibility = [":__subpackages__"];
};

mesa_mapi_headers = cc_library_headers {
    name = "mesa_mapi_headers";
    export_include_dirs = ["mapi"];
    host_supported = true;
    vendor = true;
    visibility = [":__subpackages__"];
};

libmesa_sse41_includes = cc_library_headers {
    name = "libmesa_sse41_includes";
    export_include_dirs = [
        "mapi"
        "gallium/include"
        "gallium/auxiliary"
    ];
    vendor = true;
    visibility = [":__subpackages__"];
};

in { inherit libmesa_glsl_utils_includes libmesa_sse41_includes mesa_mapi_headers; }
