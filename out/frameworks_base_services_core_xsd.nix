{ xsd_config }:
let

default-permissions = xsd_config {
    name = "default-permissions";
    srcs = ["default-permissions.xsd"];
    api_dir = "schema";
    package_name = "com.android.server.pm.permission.configfile";
};

in { inherit default-permissions; }
