{ sysprop_library }:
let

LibGuiProperties = sysprop_library {
    name = "LibGuiProperties";
    srcs = ["LibGuiProperties.sysprop"];
    api_packages = ["android.sysprop"];
    property_owner = "Platform";
    vendor_available = true;
    cpp = {
        min_sdk_version = "29";
    };
};

in { inherit LibGuiProperties; }
