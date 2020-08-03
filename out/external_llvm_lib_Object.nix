{ cc_library_static }:
let

libLLVMObject = cc_library_static {
    name = "libLLVMObject";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
    cflags = [
        "-Wno-unused-private-field"
    ];
};

in { inherit libLLVMObject; }
