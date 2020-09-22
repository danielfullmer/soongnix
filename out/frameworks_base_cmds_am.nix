{ cc_library_host_static, java_binary }:
let

#  Copyright 2008 The Android Open Source Project
#

libinstrumentation = cc_library_host_static {
    name = "libinstrumentation";
    srcs = ["proto/instrumentation_data.proto"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    proto = {
        type = "full";
        export_proto_headers = true;
    };
};

am = java_binary {
    name = "am";
    wrapper = "am";
    srcs = [
        "src/com/android/commands/am/Am.java"
        "src/com/android/commands/am/Instrument.java"
        "proto/instrumentation_data.proto"
    ];
    proto = {
        plugin = "javastream";
    };
    static_libs = ["libprotobuf-java-lite"];
};

in { inherit am libinstrumentation; }
