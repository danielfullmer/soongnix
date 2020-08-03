{ cc_test_host, java_test_host }:
let

xsdc-java-tests = java_test_host {
    name = "xsdc-java-tests";
    srcs = ["src/**/*.java"];
    static_libs = [
        "junit"
        "xsdc"
    ];
    java_resource_dirs = ["resources"];
};

xsdc-cpp-tests = cc_test_host {
    name = "xsdc-cpp-tests";
    srcs = [
        "main.cpp"
    ];
    generated_sources = [
        "xsdc_nested_type_tests"
        "xsdc_predefined_types_tests"
        "xsdc_purchase_simple_tests"
        "xsdc_reference_tests"
        "xsdc_simple_complex_content_tests"
        "xsdc_simple_type_tests"
    ];
    generated_headers = [
        "xsdc_nested_type_tests"
        "xsdc_predefined_types_tests"
        "xsdc_purchase_simple_tests"
        "xsdc_reference_tests"
        "xsdc_simple_complex_content_tests"
        "xsdc_simple_type_tests"
    ];
    shared_libs = [
        "libbase"
        "libxml2"
    ];
    data = ["resources/*.xml"];
};

in { inherit xsdc-cpp-tests xsdc-java-tests; }
