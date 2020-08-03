{ xsd_config }:
let

xsdc_nested_type_tests = xsd_config {
    name = "xsdc_nested_type_tests";
    srcs = ["nested_type.xsd"];
    package_name = "nested.type";
};

in { inherit xsdc_nested_type_tests; }
