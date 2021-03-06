{ cc_binary }:
let

rmi4update = cc_binary {
    name = "rmi4update";
    srcs = [
        "main.cpp"
        "rmi4update.cpp"
        "updateutil.cpp"
        "firmware_image.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    static_libs = ["rmidevice"];
};

in { inherit rmi4update; }
