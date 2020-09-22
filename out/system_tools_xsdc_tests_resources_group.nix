{ xsd_config }:
let

xsdc_group_tests = xsd_config {
    name = "xsdc_group_tests";
    srcs = ["group.xsd"];
    package_name = "group";
};

in { inherit xsdc_group_tests; }
