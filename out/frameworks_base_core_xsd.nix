{ xsd_config }:
let

permission = xsd_config {
    name = "permission";
    srcs = ["permission.xsd"];
    api_dir = "schema";
    package_name = "com.android.xml.permission.configfile";
};

in { inherit permission; }
