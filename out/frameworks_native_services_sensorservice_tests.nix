{ cc_binary }:
let

test-sensorservice = cc_binary {
    name = "test-sensorservice";
    srcs = ["sensorservicetest.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libutils"
        "libsensor"
        "libandroid"
    ];
};

in { inherit test-sensorservice; }
