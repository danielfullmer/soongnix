{ filegroup }:
let

android_filesystem_config_header = filegroup {
    name = "android_filesystem_config_header";
    srcs = ["include/private/android_filesystem_config.h"];
};

in { inherit android_filesystem_config_header; }
