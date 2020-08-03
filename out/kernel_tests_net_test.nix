{ python_test }:
let

kernel_net_tests = python_test {
    name = "kernel_net_tests";
    main = "all_tests.py";
    srcs = [
        "*.py"
    ];
    libs = [
        "scapy"
    ];
    defaults = [
        "kernel_tests_defaults"
    ];
};

in { inherit kernel_net_tests; }
