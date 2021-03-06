{ cc_library_headers, cc_library_static, cc_test }:
let

#  Bluetooth types
libbt-rootcanal-types-header = cc_library_headers {
    name = "libbt-rootcanal-types-header";
    export_include_dirs = ["./"];
    vendor_available = true;
    host_supported = true;
};

libbt-rootcanal-types = cc_library_static {
    name = "libbt-rootcanal-types";
    vendor_available = true;
    defaults = ["fluoride_types_defaults"];
    cflags = [
        /* we export all classes, so change default visibility, instead of having EXPORT_SYMBOL on each class*/
        "-fvisibility=default"
    ];
    host_supported = true;
    srcs = [
        "class_of_device.cc"
        "address.cc"
        "bluetooth/uuid.cc"
    ];
    header_libs = ["libbt-rootcanal-types-header"];
    export_header_lib_headers = ["libbt-rootcanal-types-header"];
};

#  ========================================================
rootcanal-test_types = cc_test {
    name = "rootcanal-test_types";
    test_suites = ["device-tests"];
    defaults = ["fluoride_defaults"];
    host_supported = true;
    srcs = [
        "test/class_of_device_unittest.cc"
        "test/address_unittest.cc"
        "test/bluetooth/uuid_unittest.cc"
    ];
    static_libs = [
        "libbt-rootcanal-types"
    ];
};

in { inherit libbt-rootcanal-types libbt-rootcanal-types-header rootcanal-test_types; }
