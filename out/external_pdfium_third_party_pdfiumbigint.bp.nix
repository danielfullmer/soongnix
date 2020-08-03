{ cc_library_static }:
let

libpdfiumbigint = cc_library_static {
    name = "libpdfiumbigint";
    defaults = ["pdfium-third-party"];

    srcs = [
        "bigint/BigInteger.cc"
        "bigint/BigIntegerUtils.cc"
        "bigint/BigUnsigned.cc"
        "bigint/BigUnsignedInABase.cc"
    ];
};

in { inherit libpdfiumbigint; }
