{ cc_test }:
let

test-pixelflinger-mips64-col32cb16blend = cc_test {
    name = "test-pixelflinger-mips64-col32cb16blend";
    defaults = ["pixelflinger-tests-mips64"];

    srcs = ["col32cb16blend_test.c"];
};

in { inherit test-pixelflinger-mips64-col32cb16blend; }
