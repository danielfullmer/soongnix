{ java_library }:
let

xmp_toolkit = java_library {
    name = "xmp_toolkit";
    #  Include all the java files.
    srcs = ["src/**/*.java"];
    sdk_version = "8";
};

in { inherit xmp_toolkit; }
