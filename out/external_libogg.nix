{ cc_library_static }:
let

libogg = cc_library_static {
    name = "libogg";

    srcs = [
        "src/bitwise.c"
        "src/framing.c"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    export_include_dirs = ["include"];

    sdk_version = "14";
    #  TODO(ivanlozano) b/124978545
    #  sanitize: {
    #      integer_overflow: true,
    #      misc_undefined: ["bounds"],
    #  },
};

in { inherit libogg; }
