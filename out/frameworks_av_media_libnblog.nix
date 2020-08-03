{ cc_library_shared }:
let

libnblog = cc_library_shared {

    name = "libnblog";

    srcs = [
        "Entry.cpp"
        "Merger.cpp"
        "PerformanceAnalysis.cpp"
        "Reader.cpp"
        "ReportPerformance.cpp"
        "Timeline.cpp"
        "Writer.cpp"
    ];

    shared_libs = [
        "libaudioutils"
        "libbinder"
        "libcutils"
        "liblog"
        "libmediametrics"
        "libutils"
    ];

    static_libs = [
        "libjsoncpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    include_dirs = ["system/media/audio_utils/include"];

    export_include_dirs = ["include"];

};

in { inherit libnblog; }
