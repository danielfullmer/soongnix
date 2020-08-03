{ cc_binary_host, cc_defaults, sh_binary_host }:
let

computestats-defaults = cc_defaults {
    name = "computestats-defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

computestats = cc_binary_host {
    name = "computestats";
    defaults = ["computestats-defaults"];
    srcs = ["computestats.c"];
};

computestatsf = cc_binary_host {
    name = "computestatsf";
    defaults = ["computestats-defaults"];
    srcs = ["computestatsf.c"];
};

app-launcher = sh_binary_host {
    name = "app-launcher";
    src = "app-launcher";
    required = [
        "computestats"
        "computestatsf"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit app-launcher computestats computestats-defaults computestatsf; }
