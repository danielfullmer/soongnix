{ filegroup }:
let

CtsMajorVersionCommon = filegroup {
    name = "CtsMajorVersionCommon";
    srcs = ["com/android/cts/majorversion/VersionTest.java"];
};

in { inherit CtsMajorVersionCommon; }
