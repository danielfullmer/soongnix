{ sysprop_library }:
let

SurfaceFlingerProperties = sysprop_library {
    name = "SurfaceFlingerProperties";
    srcs = ["SurfaceFlingerProperties.sysprop"];
    api_packages = ["android.sysprop"];
    property_owner = "Platform";
};

in { inherit SurfaceFlingerProperties; }
