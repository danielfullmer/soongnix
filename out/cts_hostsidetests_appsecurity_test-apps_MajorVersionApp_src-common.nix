{ filegroup }:
let

CtsMajorVersionCommon = filegroup {
    name = "CtsMajorVersionCommon";
    srcs = ["**/*.java"];
};

in { inherit CtsMajorVersionCommon; }
