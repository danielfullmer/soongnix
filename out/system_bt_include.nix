{ cc_library_headers }:
let

avrcp_headers = cc_library_headers {
    name = "avrcp_headers";
    defaults = ["libchrome_support_defaults"];
    include_dirs = ["system/bt/internal_include"];
    export_include_dirs = ["./hardware/avrcp/"];
    header_libs = ["internal_include_headers"];
    export_header_lib_headers = ["internal_include_headers"];

    #  We need this in case some file outside of the Bluetooth project includes
    #  bluetooth.h but doesn't include libchrome which avrcp.h depends on.
    export_shared_lib_headers = ["libchrome"];

    vendor_available = true;
    host_supported = true;
};

libbluetooth_headers = cc_library_headers {
    name = "libbluetooth_headers";
    defaults = ["libchrome_support_defaults"];
    header_libs = [
        "avrcp_headers"
        "libbluetooth-types-header"
    ];
    export_header_lib_headers = [
        "avrcp_headers"
        "libbluetooth-types-header"
    ];
    export_include_dirs = ["./"];
    vendor_available = true;
    host_supported = true;
};

in { inherit avrcp_headers libbluetooth_headers; }
