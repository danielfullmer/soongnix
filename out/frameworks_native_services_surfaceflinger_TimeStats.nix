{ cc_library_shared }:
let

libtimestats = cc_library_shared {
    name = "libtimestats";
    srcs = [
        "TimeStats.cpp"
    ];
    shared_libs = [
        "android.hardware.graphics.composer@2.4"
        "libbase"
        "libcutils"
        "liblog"
        "libprotobuf-cpp-lite"
        "libprotoutil"
        "libstatslog"
        "libstatspull"
        "libstatssocket"
        "libtimestats_proto"
        "libui"
        "libutils"
    ];
    export_include_dirs = ["."];
    export_shared_lib_headers = [
        "libprotoutil"
        "libstatslog"
        "libstatspull"
        "libstatssocket"
        "libtimestats_proto"
    ];
    cppflags = [
        "-Wall"
        "-Werror"
        "-Wformat"
        "-Wthread-safety"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libtimestats; }