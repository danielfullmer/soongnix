{ xsd_config }:
let

xsdc_simple_complex_content_tests = xsd_config {
    name = "xsdc_simple_complex_content_tests";
    srcs = ["simple_complex_content.xsd"];
    package_name = "simple.complex.content";
};

in { inherit xsdc_simple_complex_content_tests; }
