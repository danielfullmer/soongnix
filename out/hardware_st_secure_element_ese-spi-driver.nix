{ cc_library_shared }:
let

ese_spi_st = cc_library_shared {

    name = "ese_spi_st";
    defaults = ["hidl_defaults"];
    proprietary = true;

    srcs = [
        "SpiLayerDriver.cc"
        "SpiLayerInterface.cc"
        "SpiLayerComm.cc"
        "StEseApi.cc"
        "T1protocol.cc"
        "utils-lib/Atp.cc"
        "utils-lib/Iso13239CRC.cc"
        "utils-lib/Tpdu.cc"
        "utils-lib/Utils.cc"
        "utils-lib/ese_config.cc"
        "utils-lib/config.cc"
        "utils-lib/android_logmsg.cc"
        "utils-lib/DataMgmt.cc"
    ];

    export_include_dirs = ["utils-lib"];
    cflags = [
        "-DANDROID"
        "-DBUILDCFG=1"
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "liblog"
        "libbase"
    ];
};

in { inherit ese_spi_st; }
