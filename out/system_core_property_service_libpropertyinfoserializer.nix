{ cc_defaults, cc_library_static, cc_test }:
let

propertyinfoserializer_defaults = cc_defaults {
    name = "propertyinfoserializer_defaults";
    host_supported = true;
    vendor_available = true;
    cpp_std = "experimental";
    cppflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    static_libs = [
        "libpropertyinfoparser"
        "libbase"
    ];
};

libpropertyinfoserializer = cc_library_static {
    name = "libpropertyinfoserializer";
    defaults = ["propertyinfoserializer_defaults"];
    recovery_available = true;
    srcs = [
        "property_info_file.cpp"
        "property_info_serializer.cpp"
        "trie_builder.cpp"
        "trie_serializer.cpp"
    ];

    export_include_dirs = ["include"];
};

propertyinfoserializer_tests = cc_test {
    name = "propertyinfoserializer_tests";
    defaults = ["propertyinfoserializer_defaults"];
    srcs = [
        "trie_builder_test.cpp"
        "property_info_serializer_test.cpp"
    ];
    static_libs = ["libpropertyinfoserializer"];
    test_suites = ["device-tests"];
};

in { inherit libpropertyinfoserializer propertyinfoserializer_defaults propertyinfoserializer_tests; }
