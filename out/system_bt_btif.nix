{ cc_library_static, cc_test }:
let

#  Common variables
#  ========================================================
btifCommonIncludes = [
    "system/bt"
    "system/bt/bta/include"
    "system/bt/bta/sys"
    "system/bt/bta/dm"
    "system/bt/btcore/include"
    "system/bt/device/include"
    "system/bt/internal_include"
    "system/bt/stack/include"
    "system/bt/stack/l2cap"
    "system/bt/stack/a2dp"
    "system/bt/stack/btm"
    "system/bt/stack/avdt"
    "system/bt/udrv/include"
    "system/bt/btif/avrcp"
    "system/bt/btif/include"
    "system/bt/btif/co"
    "system/bt/hci/include"
    "system/bt/vnd/include"
    "system/bt/embdrv/sbc/encoder/include"
    "system/bt/embdrv/sbc/decoder/include"
    "system/bt/utils/include"
    "system/bt/include"
    "system/libhwbinder/include"
    "system/security/keystore/include"
    "hardware/interfaces/keymaster/4.0/support/include"
];

#  libbtif static library for target
#  ========================================================
libbtif = cc_library_static {
    name = "libbtif";
    defaults = ["fluoride_defaults"];
    include_dirs = btifCommonIncludes;
    srcs = [
        #  AVRCP Target Service
        "avrcp/avrcp_service.cc"
        #  Callouts
        "co/bta_dm_co.cc"
        "co/bta_av_co.cc"
        "co/bta_hh_co.cc"
        "co/bta_pan_co.cc"
        "co/bta_gatts_co.cc"
        #  HAL layer
        "src/bluetooth.cc"
        #  BTIF implementation
        "src/btif_a2dp.cc"
        "src/btif_a2dp_audio_interface.cc"
        "src/btif_a2dp_control.cc"
        "src/btif_a2dp_sink.cc"
        "src/btif_a2dp_source.cc"
        "src/btif_av.cc"
        "src/btif_avrcp_audio_track.cc"
        "src/btif_ble_advertiser.cc"
        "src/btif_ble_scanner.cc"
        "src/btif_bqr.cc"
        "src/btif_config.cc"
        "src/btif_config_transcode.cc"
        "src/btif_core.cc"
        "src/btif_debug.cc"
        "src/btif_debug_btsnoop.cc"
        "src/btif_debug_conn.cc"
        "src/btif_dm.cc"
        "src/btif_gatt.cc"
        "src/btif_gatt_client.cc"
        "src/btif_gatt_server.cc"
        "src/btif_gatt_test.cc"
        "src/btif_gatt_util.cc"
        "src/btif_hearing_aid.cc"
        "src/btif_hf.cc"
        "src/btif_hf_client.cc"
        "src/btif_hh.cc"
        "src/btif_hd.cc"
        "src/btif_keystore.cc"
        "src/btif_mce.cc"
        "src/btif_pan.cc"
        "src/btif_profile_queue.cc"
        "src/btif_rc.cc"
        "src/btif_sdp.cc"
        "src/btif_sdp_server.cc"
        "src/btif_sock.cc"
        "src/btif_sock_rfc.cc"
        "src/btif_sock_l2cap.cc"
        "src/btif_sock_sco.cc"
        "src/btif_sock_sdp.cc"
        "src/btif_sock_thread.cc"
        "src/btif_sock_util.cc"
        "src/btif_storage.cc"
        "src/btif_uid.cc"
        "src/btif_util.cc"
        "src/stack_manager.cc"
    ];
    shared_libs = [
        "libaudioclient"
        "libcutils"
        "libfmq"
        "liblog"
        "libz"
        "libtinyxml2"
        "android.hardware.bluetooth.a2dp@1.0"
        "android.hardware.bluetooth.audio@2.0"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutils"
        "libcrypto"
        "android.hardware.keymaster@4.0"
        "android.hardware.keymaster@3.0"
        "libkeymaster4support"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
    ];
    whole_static_libs = [
        "avrcp-target-service"
        "libaudio-a2dp-hw-utils"
        "lib-bt-packets"
        "libbt-audio-hal-interface"
    ];
    cflags = [
        "-DBUILDCFG"
        "-Wno-implicit-fallthrough"
    ];

};

#  btif unit tests for target
#  ========================================================
net_test_btif = cc_test {
    name = "net_test_btif";
    defaults = ["fluoride_defaults"];
    test_suites = ["device-tests"];
    include_dirs = btifCommonIncludes;
    srcs = [
        "test/btif_storage_test.cc"
        "test/btif_keystore_test.cc"
    ];
    header_libs = ["libbluetooth_headers"];
    shared_libs = [
        "libaudioclient"
        "android.hardware.bluetooth.a2dp@1.0"
        "android.hardware.bluetooth.audio@2.0"
        "libfmq"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libprotobuf-cpp-lite"
        "libcutils"
        "libprocessgroup"
        "libutils"
        "libcrypto"
        "android.hardware.keymaster@4.0"
        "android.hardware.keymaster@3.0"
        "libkeymaster4support"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
        "libbinder"
    ];
    static_libs = [
        "libbt-bta"
        "libbtcore"
        "libbt-common"
        "libbt-stack"
        "libbt-sbc-decoder"
        "libbt-sbc-encoder"
        "libbt-utils"
        "libFraunhoferAAC"
        "libg722codec"
        "libbtdevice"
        "libbt-hci"
        "libudrv-uipc"
        "libbluetooth-types"
        "libosi"
        "libbt-protos-lite"
    ];
    whole_static_libs = [
        "libbtif"
        "libbluetooth-for-tests"
    ];
    cflags = ["-DBUILDCFG"];
    sanitize = {
        integer_overflow = true;
    };
};

#  btif profile queue unit tests for target
#  ========================================================
net_test_btif_profile_queue = cc_test {
    name = "net_test_btif_profile_queue";
    defaults = ["fluoride_defaults"];
    test_suites = ["device-tests"];
    include_dirs = btifCommonIncludes;
    srcs = [
        "src/btif_profile_queue.cc"
        "test/btif_profile_queue_test.cc"
    ];
    header_libs = ["libbluetooth_headers"];
    shared_libs = [
        "liblog"
        "libcutils"
    ];
    static_libs = [
        "libbluetooth-types"
        "libosi"
    ];
    cflags = ["-DBUILDCFG"];
};

#  btif rc unit tests for target
#  ========================================================
net_test_btif_rc = cc_test {
    name = "net_test_btif_rc";
    defaults = ["fluoride_defaults"];
    test_suites = ["device-tests"];
    host_supported = true;
    include_dirs = btifCommonIncludes;
    srcs = [
        "test/btif_rc_test.cc"
    ];
    header_libs = ["libbluetooth_headers"];
    shared_libs = [
        "libcrypto"
        "libcutils"
        "liblog"
        "libprotobuf-cpp-lite"
    ];
    static_libs = [
        "libbluetooth-types"
        "libbt-common"
        "libbt-protos-lite"
        "libosi"
        "libosi-AllocationTestHarness"
    ];
    cflags = ["-DBUILDCFG"];
    sanitize = {
        address = true;
        cfi = true;
        misc_undefined = ["bounds"];
    };
};

in { inherit libbtif net_test_btif net_test_btif_profile_queue net_test_btif_rc; }
