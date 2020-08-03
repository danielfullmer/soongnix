{ xsd_config }:
let

xsdc_reference_tests = xsd_config {
    name = "xsdc_reference_tests";
    srcs = ["reference.xsd"];
    package_name = "reference";
};

in { inherit xsdc_reference_tests; }
