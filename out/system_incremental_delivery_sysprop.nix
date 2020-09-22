{ sysprop_library }:
let

"com.android.sysprop.incremental" = sysprop_library {
    name = "com.android.sysprop.incremental";
    srcs = ["IncrementalProperties.sysprop"];
    property_owner = "Platform";
    api_packages = ["android.sysprop"];
    vendor_available = true;
};

in { inherit "com.android.sysprop.incremental"; }
