{ cc_library }:
let

libnl = cc_library {
    name = "libnl";
    host_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    target = {
        darwin = {
            enabled = false;
        };
    };

    srcs = [
        "lib/cache.c"
        "lib/data.c"
        "lib/nl.c"
        "lib/cache_mngr.c"
        "lib/addr.c"
        "lib/socket.c"
        "lib/fib_lookup/lookup.c"
        "lib/fib_lookup/request.c"
        "lib/msg.c"
        "lib/object.c"
        "lib/attr.c"
        "lib/utils.c"
        "lib/cache_mngt.c"
        "lib/handlers.c"
        "lib/genl/ctrl.c"
        "lib/genl/mngt.c"
        "lib/genl/family.c"
        "lib/genl/genl.c"
        "lib/route/rtnl.c"
        "lib/route/route_utils.c"
        "lib/netfilter/nfnl.c"
        "lib/error.c"
        "lib/version.c"
        "lib/hash.c"
        "lib/hashtable.c"
    ];

    local_include_dirs = [
        "include"
        "include/linux-private"
    ];
    export_include_dirs = ["include"];
    cflags = [
        "-D_BSD_SOURCE"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-Wno-missing-field-initializers"
        "-Wno-tautological-compare"
        "-Wno-pointer-arith"
        "-UNDEBUG"
        "-D_GNU_SOURCE"
        "-DSYSCONFDIR=\"\\\"/etc/libnl\\\"\""
    ];

    sanitize = {
        integer_overflow = true;
    };
};

in { inherit libnl; }
