{ filegroup }:
let

bionic-gensyscalls = filegroup {
    name = "bionic-gensyscalls";
    srcs = ["gensyscalls.py"];
};

in { inherit bionic-gensyscalls; }
