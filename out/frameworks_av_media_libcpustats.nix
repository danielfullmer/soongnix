{ cc_library_static }:
let

libcpustats = cc_library_static {
    name = "libcpustats";

    srcs = [
        "CentralTendencyStatistics.cpp"
        "ThreadCpuUsage.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    host_supported = true;

    target = {
        darwin = {
            enabled = false;
        };
    };

};

in { inherit libcpustats; }
