{ cc_library_headers, cc_library_shared }:
let

#  Copyright 2019 The Android Open Source Project

libiio_headers = cc_library_headers {
    name = "libiio_headers";
    export_include_dirs = ["include"];
};

libiio = cc_library_shared {
    name = "libiio";
    srcs = [
        "src/backend.c"
        "src/buffer.c"
        "src/channel.c"
        "src/context.c"
        "src/device.c"
        "src/local.c"
        "src/scan.c"
        "src/sort.c"
        "src/utilities.c"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
};

in { inherit libiio libiio_headers; }
