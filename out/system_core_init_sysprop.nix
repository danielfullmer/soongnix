{ sysprop_library }:
let

"com.android.sysprop.init" = sysprop_library {
    name = "com.android.sysprop.init";
    srcs = ["InitProperties.sysprop"];
    property_owner = "Platform";
    api_packages = ["android.sysprop"];
    recovery_available = true;
};

in { inherit "com.android.sysprop.init"; }
