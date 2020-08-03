{ cc_test }:
let

hidl_lazy_test = cc_test {
    name = "hidl_lazy_test";
    defaults = ["hidl-gen-defaults"];
    srcs = ["main.cpp"];

    shared_libs = [
        "libbase"
        "liblog"
        "libhidlbase"
        "libhidltransport"
        "libhidlmemory"
        "libhwbinder"
        "libutils"
    ];
};

in { inherit hidl_lazy_test; }
