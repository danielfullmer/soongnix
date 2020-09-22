{ cc_library_shared, cc_library_static, filegroup }:
let

#  Bluetooth main HW module / shared library for target
#  ========================================================
LibBluetoothSources = filegroup {
    name = "LibBluetoothSources";
    srcs = [
        "bte_conf.cc"
        "bte_init.cc"
        "bte_init_cpp_logging.cc"
        "bte_logmsg.cc"
        "bte_main.cc"
        "stack_config.cc"
    ];
};

libbte = cc_library_static {
    name = "libbte";
    defaults = ["fluoride_defaults"];
    srcs = [
        ":LibBluetoothSources"
        ":LibBluetoothShimSources"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/gd"
        "system/bt/bta/include"
        "system/bt/bta/sys"
        "system/bt/bta/dm"
        "system/bt/btcore/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
        "system/bt/stack/l2cap"
        "system/bt/stack/a2dp"
        "system/bt/stack/btm"
        "system/bt/stack/avdt"
        "system/bt/udrv/include"
        "system/bt/btif/include"
        "system/bt/btif/co"
        "system/bt/hci/include"
        "system/bt/vnd/include"
        "system/bt/embdrv/sbc/encoder/include"
        "system/bt/embdrv/sbc/decoder/include"
        "system/bt/utils/include"
        "system/security/keystore/include"
        "hardware/interfaces/keymaster/4.0/support/include"
    ];
    generated_headers = [
        "BluetoothGeneratedPackets_h"
    ];
    host_supported = true;
};

libbluetooth = cc_library_shared {
    name = "libbluetooth";
    defaults = ["fluoride_defaults"];
    header_libs = ["libbluetooth_headers"];
    export_header_lib_headers = ["libbluetooth_headers"];
    include_dirs = [
        "system/bt"
        "system/bt/bta/include"
        "system/bt/bta/sys"
        "system/bt/bta/dm"
        "system/bt/btcore/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
        "system/bt/stack/l2cap"
        "system/bt/stack/a2dp"
        "system/bt/stack/btm"
        "system/bt/stack/avdt"
        "system/bt/udrv/include"
        "system/bt/btif/include"
        "system/bt/btif/co"
        "system/bt/hci/include"
        "system/bt/vnd/include"
        "system/bt/embdrv/sbc/encoder/include"
        "system/bt/embdrv/sbc/decoder/include"
        "system/bt/utils/include"
        "system/security/keystore/include"
        "hardware/interfaces/keymaster/4.0/support/include"
    ];
    logtags = ["../EventLogTags.logtags"];
    shared_libs = [
        "android.hardware.bluetooth@1.0"
        "android.hardware.bluetooth@1.1"
        "android.hardware.bluetooth.a2dp@1.0"
        "android.hardware.bluetooth.audio@2.0"
        "libaaudio"
        "libcutils"
        "libdl"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libprocessgroup"
        "libprotobuf-cpp-lite"
        "libutils"
        "libtinyxml2"
        "libz"
        "libcrypto"
    ];
    static_libs = [
        "libbte"
        "libbt-sbc-decoder"
        "libbt-sbc-encoder"
        "libFraunhoferAAC"
        "libg722codec"
        "libudrv-uipc"
        "libbluetooth_gd" #  Gabeldorsche
    ];
    whole_static_libs = [
        "libbt-bta"
        "libbt-common"
        "libbtdevice"
        "libbtif"
        "libbt-hci"
        "libbt-stack"
        "libbt-utils"
        "libbtcore"
        "libosi"
        "libbt-protos-lite"
    ];
    #  Shared library link options.
    #  References to global symbols and functions should bind to the library
    #  itself. This is to avoid issues with some of the unit/system tests
    #  that might link statically with some of the code in the library, and
    #  also dlopen(3) the shared library.
    ldflags = ["-Wl,-Bsymbolic,-Bsymbolic-functions"];
    required = [
        "bt_did.conf"
        "bt_stack.conf"
        "libldacBT_enc"
        "libldacBT_abr"
    ];
    cflags = [
        "-DBUILDCFG"
    ];
    sanitize = {
        scs = true;
    };
};

libbluetooth-for-tests = cc_library_static {
    name = "libbluetooth-for-tests";
    defaults = ["fluoride_defaults"];

    srcs = [
        ":LibBluetoothSources"
        ":LibBluetoothShimSources"
    ];
    host_supported = true;
    include_dirs = [
        "system/bt"
        "system/bt/gd"
        "system/bt/bta/include"
        "system/bt/btcore/include"
        "system/bt/btif/include"
        "system/bt/hci/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
        "system/bt/utils/include"
    ];
    generated_headers = [
        "BluetoothGeneratedPackets_h"
    ];
    cflags = [
        "-DBUILDCFG"
    ];
    whole_static_libs = [
        "libbluetooth_gd" #  Gabeldorsche
    ];
};

in { inherit LibBluetoothSources libbluetooth libbluetooth-for-tests libbte; }
