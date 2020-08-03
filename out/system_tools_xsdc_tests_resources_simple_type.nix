{ xsd_config }:
let

xsdc_simple_type_tests = xsd_config {
    name = "xsdc_simple_type_tests";
    srcs = ["simple_type.xsd"];
    package_name = "simple.type";
};

in { inherit xsdc_simple_type_tests; }
