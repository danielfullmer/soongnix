{ cc_library_static, cc_test }:
let

#  Bluetooth Audio library for target
#  ========================================================
libbt-audio-hal-interface = cc_library_static {
    name = "libbt-audio-hal-interface";
    defaults = ["fluoride_defaults"];
    include_dirs = [
        "system/bt"
        "system/bt/bta/include"
        "system/bt/bta/sys"
        "system/bt/btif/include"
        "system/bt/stack/include"
    ];
    srcs = [
        "a2dp_encoding.cc"
        "client_interface.cc"
        "hearing_aid_software_encoding.cc"
    ];
    shared_libs = [
        "android.hardware.bluetooth.audio@2.0"
        "libfmq"
        "libhidlbase"
        "libhidltransport"
    ];
    static_libs = [
        "libosi"
        "libbt-common"
    ];
    cflags = [
        "-DBUILDCFG"
    ];
};

#  Bluetooth Audio client interface library unit tests for target and host
#  ========================================================
bluetooth-test-audio-hal-interface = cc_test {
    name = "bluetooth-test-audio-hal-interface";
    defaults = ["fluoride_defaults"];
    include_dirs = [
        "system/bt"
    ];
    srcs = [
        "client_interface_unittest.cc"
    ];
    shared_libs = [
        "android.hardware.bluetooth.audio@2.0"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "libbt-audio-hal-interface"
        "libbt-common"
    ];
    cflags = [
        "-DBUILDCFG"
    ];
};

in { inherit bluetooth-test-audio-hal-interface libbt-audio-hal-interface; }
