{ cc_library_shared }:
let

libtimestats_proto = cc_library_shared {
    name = "libtimestats_proto";
    export_include_dirs = ["include"];

    srcs = [
        "TimeStatsHelper.cpp"
        "timestats.proto"
    ];

    shared_libs = [
        "libbase"
        "libprotobuf-cpp-lite"
    ];

    proto = {
        export_proto_headers = true;
    };

    cppflags = [
        "-Werror"
        "-Wno-c++98-compat-pedantic"
        "-Wno-disabled-macro-expansion"
        "-Wno-float-conversion"
        "-Wno-float-equal"
        "-Wno-format"
        "-Wno-old-style-cast"
        "-Wno-padded"
        "-Wno-sign-conversion"
        "-Wno-undef"
        "-Wno-unused-parameter"
    ];
};

in { inherit libtimestats_proto; }
