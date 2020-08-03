{ java_binary_host }:
let

#  Copyright 2006 The Android Open Source Project
#

#  This tool is prebuilt if we're doing an app-only build.
#  ANDROIDMK TRANSLATION ERROR: unsupported conditional
#  ifeq ($(TARGET_BUILD_APPS)$(filter true,$(TARGET_BUILD_PDK)),)

#  dx java library
#  ============================================================
dx = java_binary_host {
    name = "dx";
    wrapper = "etc/dx";
    srcs = ["src/**/*.java"];
    manifest = "etc/manifest.txt";
    java_version = "1.7";
    product_variables = {
        pdk = {
            enabled = false;
        };
        unbundled_build = {
            enabled = false;
        };
    };
};

in { inherit dx; }
