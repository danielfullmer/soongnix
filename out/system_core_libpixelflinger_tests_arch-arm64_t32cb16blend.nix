{ cc_test }:
let

test-pixelflinger-arm64-t32cb16blend = cc_test {
    name = "test-pixelflinger-arm64-t32cb16blend";
    defaults = ["pixelflinger-tests-arm64"];

    srcs = ["t32cb16blend_test.c"];
};

in { inherit test-pixelflinger-arm64-t32cb16blend; }
