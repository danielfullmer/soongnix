{ cc_library_shared }:
let

liboffloadhal = cc_library_shared {
    name = "liboffloadhal";
    srcs = [
        "src/CtUpdateAmbassador.cpp"
        "src/HAL.cpp"
        "src/IpaEventRelay.cpp"
        "src/LocalLogBuffer.cpp"
        "src/OffloadStatistics.cpp"
        "src/PrefixParser.cpp"
    ];

    shared_libs = [
        "libhidlbase"
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware_legacy"
        "libhardware"
        "android.hardware.tetheroffload.config@1.0"
        "android.hardware.tetheroffload.control@1.0"
    ];
    export_include_dirs = ["inc"];
    vendor = true;
};

in { inherit liboffloadhal; }
