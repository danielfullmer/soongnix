{ cc_test }:
let

test-pixelflinger-arm64-disassembler-test = cc_test {
    name = "test-pixelflinger-arm64-disassembler-test";
    defaults = ["pixelflinger-tests-arm64"];

    srcs = ["arm64_diassembler_test.cpp"];
};

in { inherit test-pixelflinger-arm64-disassembler-test; }
