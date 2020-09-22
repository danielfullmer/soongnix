{ xsd_config }:
let

xsdc_attr_group_simple_tests = xsd_config {
    name = "xsdc_attr_group_simple_tests";
    srcs = ["attr_group_simple.xsd"];
    package_name = "attr.group.simple";
};

in { inherit xsdc_attr_group_simple_tests; }
