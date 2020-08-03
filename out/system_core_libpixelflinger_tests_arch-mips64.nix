{ cc_defaults }:
let

pixelflinger-tests-mips64 = cc_defaults {
    name = "pixelflinger-tests-mips64";
    defaults = ["pixelflinger-tests"];

    enabled = false;
    arch = {
        mips64 = {
            enabled = true;
        };
    };
};

in { inherit pixelflinger-tests-mips64; }
