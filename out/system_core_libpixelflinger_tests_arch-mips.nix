{ cc_defaults }:
let

pixelflinger-tests-mips = cc_defaults {
    name = "pixelflinger-tests-mips";
    defaults = ["pixelflinger-tests"];

    enabled = false;
    arch = {
        mips = {
            enabled = true;
        };
    };
};

in { inherit pixelflinger-tests-mips; }
