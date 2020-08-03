{ cc_library_headers, cc_library_static, cc_test }:
let

#  Bluetooth types
libbluetooth-types-header = cc_library_headers {
    name = "libbluetooth-types-header";
    export_include_dirs = ["./"];
    vendor_available = true;
    host_supported = true;
};

libbluetooth-types = cc_library_static {
    name = "libbluetooth-types";
    vendor_available = true;
    defaults = ["fluoride_types_defaults"];
    cflags = [
        /* we export all classes, so change default visibility, instead of having EXPORT_SYMBOL on each class*/
        "-fvisibility=default"
    ];
    host_supported = true;
    srcs = [
        "class_of_device.cc"
        "raw_address.cc"
        "bluetooth/uuid.cc"
    ];
    header_libs = ["libbluetooth-types-header"];
    export_header_lib_headers = ["libbluetooth-types-header"];
};

#  ========================================================
net_test_types = cc_test {
    name = "net_test_types";
    test_suites = ["device-tests"];
    defaults = ["fluoride_defaults"];
    host_supported = true;
    srcs = [
        "test/class_of_device_unittest.cc"
        "test/raw_address_unittest.cc"
        "test/bluetooth/uuid_unittest.cc"
    ];
};

in { inherit libbluetooth-types libbluetooth-types-header net_test_types; }
