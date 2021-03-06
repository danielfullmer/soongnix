{ cc_library_static }:
let

libcap-ng = cc_library_static {

    srcs = [
        "libcap-ng-0.7/src/cap-ng.c"
        "libcap-ng-0.7/src/lookup_table.c"
    ];

    export_include_dirs = ["libcap-ng-0.7/src"];
    name = "libcap-ng";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-enum-conversion"
        "-Wno-unused-parameter"
    ];
};

in { inherit libcap-ng; }
