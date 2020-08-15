{ cc_library_static }:
let

libLLVMTableGen = cc_library_static {
    name = "libLLVMTableGen";
    defaults = ["llvm-defaults-no-generated-headers"];
    cflags = [
        "-W"
        "-Wall"
        "-Wno-unused-lambda-capture"
        "-Wno-unused-parameter"
    ];
    srcs = [
        "Error.cpp"
        "Main.cpp"
        "Record.cpp"
        "SetTheory.cpp"
        "StringMatcher.cpp"
        "TGLexer.cpp"
        "TGParser.cpp"
        "TableGenBackend.cpp"
    ];
    target = {
        #  llvm-defaults turns off host builds by default, turn it back on for
        #  modules that are used to build llvm-tblgen
        host = {
            enabled = true;
        };
    };
};

in { inherit libLLVMTableGen; }
