{ cc_test }:
let

test-pixelflinger-mips64-disassembler-test = cc_test {
    name = "test-pixelflinger-mips64-disassembler-test";
    defaults = ["pixelflinger-tests-mips64"];

    srcs = ["mips64_disassembler_test.cpp"];
};

in { inherit test-pixelflinger-mips64-disassembler-test; }
