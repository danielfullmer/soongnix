{ cc_binary, cc_library_shared }:
let

libsurfacereplayer = cc_library_shared {
    name = "libsurfacereplayer";
    srcs = [
        "BufferQueueScheduler.cpp"
        "Event.cpp"
        "Replayer.cpp"
    ];
    cppflags = [
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-format"
        "-Wno-c++98-compat-pedantic"
        "-Wno-float-conversion"
        "-Wno-disabled-macro-expansion"
        "-Wno-float-equal"
        "-Wno-sign-conversion"
        "-Wno-padded"
    ];
    static_libs = [
        "libtrace_proto"
    ];
    shared_libs = [
        "libEGL"
        "libGLESv2"
        "libbinder"
        "liblog"
        "libcutils"
        "libgui"
        "libui"
        "libutils"
        "libprotobuf-cpp-lite"
        "libbase"
        "libnativewindow"
    ];
    export_include_dirs = [
        "."
    ];
};

surfacereplayer = cc_binary {
    name = "surfacereplayer";
    srcs = [
        "Main.cpp"
    ];
    shared_libs = [
        "libprotobuf-cpp-lite"
        "libsurfacereplayer"
        "libutils"
        "libgui"
    ];
    static_libs = [
        "libtrace_proto"
    ];
    cppflags = [
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-c++98-compat-pedantic"
        "-Wno-float-conversion"
        "-Wno-disabled-macro-expansion"
        "-Wno-float-equal"
    ];
};

in { inherit libsurfacereplayer surfacereplayer; }
