{ cc_prebuilt_binary }:
let

fuzz = cc_prebuilt_binary {
    name = "fuzz";
    srcs = ["fuzz"];
};

in { inherit fuzz; }
