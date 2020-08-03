{ java_library }:
let

ksoap2 = java_library {
    name = "ksoap2";
    srcs = ["**/*.java"];
};

in { inherit ksoap2; }
