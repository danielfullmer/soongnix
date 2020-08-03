{ cc_test }:
let

proptest = cc_test {
    name = "proptest";
    defaults = ["libdrm_defaults"];
    srcs = ["proptest.c"];

    shared_libs = ["libdrm"];
    static_libs = ["libdrm_util"];
};

in { inherit proptest; }
