{ filegroup }:
let

subdirs = ["*"];

bionic-generate-version-script = filegroup {
    name = "bionic-generate-version-script";
    srcs = ["generate-version-script.py"];
};

in { inherit bionic-generate-version-script; }
