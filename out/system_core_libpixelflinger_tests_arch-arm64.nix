{ cc_defaults }:
let

pixelflinger-tests-arm64 = cc_defaults {
    name = "pixelflinger-tests-arm64";
    defaults = ["pixelflinger-tests"];

    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
        };
    };
};

in { inherit pixelflinger-tests-arm64; }
