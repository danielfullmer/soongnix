{ xsd_config }:
let

xsdc_purchase_simple_tests = xsd_config {
    name = "xsdc_purchase_simple_tests";
    srcs = ["purchase_simple.xsd"];
    package_name = "purchase.simple";
};

in { inherit xsdc_purchase_simple_tests; }
