{ cc_binary }:
let

crypto = cc_binary {
    name = "crypto";

    cflags = [
        "-O0"
        "-march=armv8-a+crypto"
        "-Wall"
        "-Werror"
    ];
    srcs = ["crypto.cpp"];

    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

in { inherit crypto; }
