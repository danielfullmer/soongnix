{ java_library }:
let

#  Build the client static library for the Google Services Framework
oauth = java_library {
    name = "oauth";
    srcs = ["net/**/*.java"];
    sdk_version = "8";
};

in { inherit oauth; }
