{ python_defaults }:
let

kernel_tests_defaults = python_defaults {
    name = "kernel_tests_defaults";
    version = {
        py2 = {
            embedded_launcher = true;
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

in { inherit kernel_tests_defaults; }
