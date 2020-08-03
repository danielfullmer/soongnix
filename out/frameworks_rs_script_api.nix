{ cc_binary_host }:
let

#  Build API doc generator ====================

rs-api-doc-generator = cc_binary_host {
    name = "rs-api-doc-generator";
    srcs = [
        "Generator.cpp"
        "Specification.cpp"
        "GenerateDocumentation.cpp"
        "GenerateHeaderFiles.cpp"
        "GenerateTestFiles.cpp"
        "Scanner.cpp"
        "Utilities.cpp"
        "GenerateStubsWhiteList.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    sanitize = {
        never = true;
    };
};

in { inherit rs-api-doc-generator; }
