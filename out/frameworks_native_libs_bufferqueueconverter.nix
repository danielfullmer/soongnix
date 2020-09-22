{ cc_library_headers, cc_library_shared }:
let

libbufferqueueconverter_headers = cc_library_headers {
    name = "libbufferqueueconverter_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
};

libbufferqueueconverter = cc_library_shared {
    name = "libbufferqueueconverter";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;

    srcs = [
        "BufferQueueConverter.cpp"
    ];

    shared_libs = [
        "libgui"
        "libui"
        "libutils"
        "libbinder"
        "libbase"
        "liblog"
    ];
    export_include_dirs = ["include"];
};

in { inherit libbufferqueueconverter libbufferqueueconverter_headers; }
