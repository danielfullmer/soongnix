{ cc_test }:
let

test-pixelflinger-mips-t32cb16blend = cc_test {
    name = "test-pixelflinger-mips-t32cb16blend";
    defaults = ["pixelflinger-tests-mips"];

    srcs = ["t32cb16blend_test.c"];
};

in { inherit test-pixelflinger-mips-t32cb16blend; }
