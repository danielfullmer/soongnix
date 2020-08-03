{ cc_library_host_static }:
let

#  Copyright 2008 The Android Open Source Project
#

libinstrumentation = cc_library_host_static {
    name = "libinstrumentation";
    srcs = ["**/*.proto"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    proto = {
        type = "full";
        export_proto_headers = true;
    };
};

in { inherit libinstrumentation; }
