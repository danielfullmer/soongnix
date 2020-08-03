{ cc_test }:
let

test-pixelflinger-mips64-assembler-test = cc_test {
    name = "test-pixelflinger-mips64-assembler-test";
    defaults = ["pixelflinger-tests-mips64"];

    srcs = [
        "mips64_assembler_test.cpp"
        "asm_mips_test_jacket.S"
    ];
};

in { inherit test-pixelflinger-mips64-assembler-test; }
