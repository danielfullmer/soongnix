{ cc_binary, cc_defaults }:
let

iputils_defaults = cc_defaults {
    name = "iputils_defaults";
    cflags = [
        "-D_GNU_SOURCE"
        "-Wall"
        "-Werror"
        "-Wno-constant-conversion"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
};

ping = cc_binary {
    name = "ping";
    defaults = ["iputils_defaults"];
    srcs = [
        "ping.c"
        "ping_common.c"
    ];
};

ping6 = cc_binary {
    name = "ping6";
    defaults = ["iputils_defaults"];
    shared_libs = ["libcrypto"];
    srcs = [
        "ping6.c"
        "ping_common.c"
    ];
};

tracepath = cc_binary {
    name = "tracepath";
    defaults = ["iputils_defaults"];
    srcs = ["tracepath.c"];
};

tracepath6 = cc_binary {
    name = "tracepath6";
    defaults = ["iputils_defaults"];
    srcs = ["tracepath6.c"];
};

traceroute6 = cc_binary {
    name = "traceroute6";
    defaults = ["iputils_defaults"];
    srcs = ["traceroute6.c"];
};

arping = cc_binary {
    name = "arping";
    defaults = ["iputils_defaults"];
    srcs = ["arping.c"];
};

in { inherit arping iputils_defaults ping ping6 tracepath tracepath6 traceroute6; }
