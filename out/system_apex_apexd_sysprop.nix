{ filegroup, prebuilt_apis, sysprop_library }:
let

#  Since sysprop_library has an implicit dependency on the framework, create a
#  filegroup rule to be used when including the sysprop within the framework
#  itself.
apex-properties = filegroup {
    name = "apex-properties";
    srcs = ["ApexProperties.sysprop"];
};

"com.android.sysprop.apex" = sysprop_library {
    name = "com.android.sysprop.apex";
    srcs = ["ApexProperties.sysprop"];
    property_owner = "Platform";
    api_packages = ["android.sysprop"];
    recovery_available = true;
};

"com.android.sysprop.apex.apis" = prebuilt_apis {
    name = "com.android.sysprop.apex.apis";
    api_dirs = ["1"];
};

in { inherit "com.android.sysprop.apex" "com.android.sysprop.apex.apis" apex-properties; }
