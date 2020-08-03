{ cc_library_shared, cc_library_static }:
let

#  Bluetooth main HW module / shared library for target
#  ========================================================
libbluetooth = cc_library_shared {
    name = "libbluetooth";
    defaults = ["fluoride_defaults"];
    header_libs = ["libbluetooth_headers"];
    export_header_lib_headers = ["libbluetooth_headers"];
    srcs = [
        #  platform specific
        "bte_conf.cc"
        "bte_init.cc"
        "bte_init_cpp_logging.cc"
        "bte_logmsg.cc"
        "bte_main.cc"
        "stack_config.cc"
    ];
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
        "android.hardware.bluetooth.a2dp@1.0"
        "android.hardware.bluetooth.audio@2.0"
        "libaudioclient"
        "libcutils"
        "libdl"
        "libfmq"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libprocessgroup"
        "libprotobuf-cpp-lite"
        "libutils"
        "libtinyxml2"
        "libz"
        "libcrypto"
        "android.hardware.keymaster@4.0"
        "android.hardware.keymaster@3.0"
        "libkeymaster4support"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
    ];
    static_libs = [
        "libbt-sbc-decoder"
        "libbt-sbc-encoder"
        "libFraunhoferAAC"
        "libg722codec"
        "libudrv-uipc"
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
        "bte_conf.cc"
        "bte_init.cc"
        "bte_init_cpp_logging.cc"
        "bte_logmsg.cc"
        "bte_main.cc"
        "stack_config.cc"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/bta/include"
        "system/bt/btcore/include"
        "system/bt/btif/include"
        "system/bt/hci/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
        "system/bt/utils/include"
    ];
    cflags = [
        "-DBUILDCFG"
    ];
};

in { inherit libbluetooth libbluetooth-for-tests; }
