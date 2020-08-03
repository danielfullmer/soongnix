{ cc_test }:
let

build = ["Android.sources.bp"];

planetest = cc_test {
    name = "planetest";
    defaults = [
        "planetest_common_sources"
        "planetest_sources"
    ];
    shared_libs = ["libdrm"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-pointer-arith"
    ];
};

atomictest = cc_test {
    name = "atomictest";
    defaults = [
        "planetest_common_sources"
        "atomictest_sources"
    ];
    shared_libs = ["libdrm"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-pointer-arith"
    ];
};

in { inherit atomictest planetest; }
