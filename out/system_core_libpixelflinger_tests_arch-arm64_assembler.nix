{ cc_test }:
let

test-pixelflinger-arm64-assembler-test = cc_test {
    name = "test-pixelflinger-arm64-assembler-test";
    defaults = ["pixelflinger-tests-arm64"];

    srcs = [
        "arm64_assembler_test.cpp"
        "asm_test_jacket.S"
    ];
};

in { inherit test-pixelflinger-arm64-assembler-test; }
