{ sysprop_library }:
let

"com.android.sysprop.apex" = sysprop_library {
    name = "com.android.sysprop.apex";
    srcs = ["ApexProperties.sysprop"];
    property_owner = "Platform";
    api_packages = ["android.sysprop"];
    recovery_available = true;
};

in { inherit "com.android.sysprop.apex"; }
