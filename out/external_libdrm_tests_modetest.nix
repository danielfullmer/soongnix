{ cc_test }:
let

build = ["Android.sources.bp"];

modetest = cc_test {
    name = "modetest";
    defaults = [
        "libdrm_defaults"
        "modetest_sources"
    ];

    shared_libs = ["libdrm"];
    static_libs = ["libdrm_util"];
};

in { inherit modetest; }
