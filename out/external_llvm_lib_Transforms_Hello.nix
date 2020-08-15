{ cc_library_host_shared }:
let

LLVMHello = cc_library_host_shared {
    name = "LLVMHello";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["Hello.cpp"];
    allow_undefined_symbols = true;
    target = {
        windows = {
            enabled = false;
        };
    };
};

in { inherit LLVMHello; }
