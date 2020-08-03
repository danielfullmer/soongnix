{ cc_binary, cc_library }:
let

libtinyalsa = cc_library {
    name = "libtinyalsa";
    host_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "mixer.c"
        "pcm.c"
    ];
    cflags = [
        "-Werror"
        "-Wno-macro-redefined"
    ];
    export_include_dirs = ["include"];
    local_include_dirs = ["include"];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

tinyplay = cc_binary {
    name = "tinyplay";
    host_supported = true;
    srcs = ["tinyplay.c"];
    shared_libs = ["libtinyalsa"];
    cflags = ["-Werror"];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

tinycap = cc_binary {
    name = "tinycap";
    srcs = ["tinycap.c"];
    shared_libs = ["libtinyalsa"];
    cflags = ["-Werror"];
};

tinymix = cc_binary {
    name = "tinymix";
    srcs = ["tinymix.c"];
    shared_libs = ["libtinyalsa"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

tinyhostless = cc_binary {
    name = "tinyhostless";
    srcs = ["tinyhostless.c"];
    shared_libs = ["libtinyalsa"];
    cflags = ["-Werror"];
};

tinypcminfo = cc_binary {
    name = "tinypcminfo";
    srcs = ["tinypcminfo.c"];
    shared_libs = ["libtinyalsa"];
    cflags = ["-Werror"];
};

in { inherit libtinyalsa tinycap tinyhostless tinymix tinypcminfo tinyplay; }
