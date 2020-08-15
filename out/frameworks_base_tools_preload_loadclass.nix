{ java_test }:
let

loadclass = java_test {
    name = "loadclass";
    srcs = ["LoadClass.java"];
};

in { inherit loadclass; }
