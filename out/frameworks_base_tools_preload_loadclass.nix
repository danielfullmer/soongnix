{ java_test }:
let

loadclass = java_test {
    name = "loadclass";
    srcs = ["**/*.java"];
};

in { inherit loadclass; }
