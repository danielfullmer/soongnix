{ cc_binary }:
let

dexter = cc_binary {
    name = "dexter";
    srcs = [
        "dexter.cc"
        "dissasembler.cc"
        "experimental.cc"
        "main.cc"
    ];
    static_libs = [
        "slicer"
    ];
    shared_libs = ["libz"];
    rtti = true;
    host_supported = true;
    device_supported = true;
    cflags = [
        "-Wall"
        "-Werror"
        #  TODO Remove these flags: b/65298177
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
};

in { inherit dexter; }
