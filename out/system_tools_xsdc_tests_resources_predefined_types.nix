{ xsd_config }:
let

xsdc_predefined_types_tests = xsd_config {
    name = "xsdc_predefined_types_tests";
    srcs = ["predefined_types.xsd"];
    package_name = "predefined.types";
};

in { inherit xsdc_predefined_types_tests; }
