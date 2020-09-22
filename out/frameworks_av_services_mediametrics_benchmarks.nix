{ cc_test }:
let

mediametrics_benchmarks = cc_test {
    name = "mediametrics_benchmarks";
    srcs = ["mediametrics_benchmarks.cpp"];
    shared_libs = [
        "libbinder"
        "libmediametrics"
    ];
    static_libs = ["libgoogle-benchmark"];
};

in { inherit mediametrics_benchmarks; }
