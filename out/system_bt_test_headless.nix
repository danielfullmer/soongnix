{ cc_test }:
let

bt_headless = cc_test {
    name = "bt_headless";
    test_suites = ["device-tests"];
    defaults = ["fluoride_defaults"];
    srcs = [
        "get_options.cc"
        "headless.cc"
        "main.cc"
        "pairing/pairing.cc"
        "sdp/sdp.cc"
        "sdp/sdp_db.cc"
        "nop/nop.cc"
        "read/read.cc"
        "read/name.cc"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/stack/include"
    ];
    whole_static_libs = [
        "libbtcore"
    ];
    static_libs = [
        "libFraunhoferAAC"
        "libbluetooth_gd"
        "libbt-bta"
        "libbt-common"
        "libbt-hci"
        "libbt-protos-lite"
        "libbt-sbc-decoder"
        "libbt-sbc-encoder"
        "libbt-stack"
        "libbt-utils"
        "libbtdevice"
        "libbte"
        "libbtif"
        "libg722codec"
        "libosi"
        "libprotobuf-cpp-lite"
        "libudrv-uipc"
        "libz"
    ];
    shared_libs = [
        "android.hardware.bluetooth.a2dp@1.0"
        "android.hardware.bluetooth.audio@2.0"
        "android.hardware.bluetooth@1.0"
        "android.hardware.bluetooth@1.1"
        "libaaudio"
        "libbase"
        "libcrypto"
        "libcutils" #  property_get_bool
        "libfmq"
        "libhidlbase"
        "libjsoncpp"
        "liblog" #  __android_log_print
        "libprocessgroup"
        "libtinyxml2"
        "libutils"
    ];
    ldflags = ["-rdynamic"];
};

in { inherit bt_headless; }