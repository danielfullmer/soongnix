{ cc_test_host, java_test_host }:
let

xsdc-java-tests = java_test_host {
    name = "xsdc-java-tests";
    srcs = [
        "src/com/android/xsdc/tests/TestCompilationResult.java"
        "src/com/android/xsdc/tests/TestHelper.java"
        "src/com/android/xsdc/tests/XmlParserTest.java"
    ];
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
        "xsdc_attr_group_simple_tests"
        "xsdc_group_tests"
        "xsdc_nested_type_tests"
        "xsdc_predefined_types_tests"
        "xsdc_purchase_simple_tests"
        "xsdc_reference_tests"
        "xsdc_simple_complex_content_tests"
        "xsdc_simple_type_tests"
    ];
    generated_headers = [
        "xsdc_attr_group_simple_tests"
        "xsdc_group_tests"
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
    data = [
        "resources/attr_group_simple.xml"
        "resources/group.xml"
        "resources/nested_type.xml"
        "resources/predefined_types.xml"
        "resources/purchase_simple.xml"
        "resources/reference.xml"
        "resources/simple_complex_content.xml"
        "resources/simple_type.xml"
    ];
};

in { inherit xsdc-cpp-tests xsdc-java-tests; }
