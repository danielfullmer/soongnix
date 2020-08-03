{ python_library }:
let

scapy = python_library {
    name = "scapy";
    srcs = [
        "scapy/**/*.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
    };
};

in { inherit scapy; }
