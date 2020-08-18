{ cc_library, java_library }:
let

#  Copyright 2013 The Android Open Source Project

librilutils = cc_library {
    name = "librilutils";

    srcs = [
        "librilutils.c"
        "record_stream.c"
        "proto/sap-api.proto"
    ];

    header_libs = ["ril_headers"];
    export_header_lib_headers = ["ril_headers"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-DPB_FIELD_32BIT"
    ];

    proto = {
        type = "nanopb-c-enable_malloc-32bit";
        export_proto_headers = true;
    };

    vendor = true;
};

#  Create java protobuf code
sap-api-java-static = java_library {
    name = "sap-api-java-static";
    srcs = ["proto/sap-api.proto"];
    proto = {
        type = "micro";
    };
};

in { inherit librilutils sap-api-java-static; }
