{ xsd_config }:
let

default-permissions = xsd_config {
    name = "default-permissions";
    srcs = ["default-permissions.xsd"];
    api_dir = "schema";
    package_name = "com.android.server.pm.permission.configfile";
};

platform-compat-config = xsd_config {
    name = "platform-compat-config";
    srcs = ["platform-compat-config.xsd"];
    api_dir = "platform-compat-schema";
    package_name = "com.android.server.compat.config";
};

display-device-config = xsd_config {
    name = "display-device-config";
    srcs = ["display-device-config/display-device-config.xsd"];
    api_dir = "display-device-config/schema";
    package_name = "com.android.server.display.config";
};

in { inherit default-permissions display-device-config platform-compat-config; }
