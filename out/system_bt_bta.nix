{ cc_defaults, cc_library_static, cc_test }:
let

fluoride_bta_defaults = cc_defaults {
    name = "fluoride_bta_defaults";
    defaults = ["fluoride_defaults"];
    local_include_dirs = [
        "include"
        "sys"
        "dm"
        "hd"
        "hh"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/bta/include"
        "system/bt/btcore/include"
        "system/bt/btif/avrcp"
        "system/bt/btif/include"
        "system/bt/hci/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
        "system/bt/stack/btm"
        "system/bt/udrv/include"
        "system/bt/vnd/include"
        "system/bt/utils/include"
    ];
    shared_libs = [
        "libcutils"
    ];
    header_libs = ["libbluetooth_headers"];
    cflags = ["-DBUILDCFG"];
};

#  BTA static library for target
#  ========================================================
libbt-bta = cc_library_static {
    name = "libbt-bta";
    defaults = ["fluoride_bta_defaults"];
    cflags = ["-Wno-implicit-fallthrough"];
    srcs = [
        "ag/bta_ag_act.cc"
        "ag/bta_ag_api.cc"
        "ag/bta_ag_at.cc"
        "ag/bta_ag_cfg.cc"
        "ag/bta_ag_cmd.cc"
        "ag/bta_ag_main.cc"
        "ag/bta_ag_rfc.cc"
        "ag/bta_ag_sco.cc"
        "ag/bta_ag_sdp.cc"
        "ar/bta_ar.cc"
        "av/bta_av_aact.cc"
        "av/bta_av_act.cc"
        "av/bta_av_api.cc"
        "av/bta_av_cfg.cc"
        "av/bta_av_ci.cc"
        "av/bta_av_main.cc"
        "av/bta_av_ssm.cc"
        "dm/bta_dm_act.cc"
        "dm/bta_dm_api.cc"
        "dm/bta_dm_cfg.cc"
        "dm/bta_dm_ci.cc"
        "dm/bta_dm_main.cc"
        "dm/bta_dm_pm.cc"
        "gatt/bta_gattc_act.cc"
        "gatt/bta_gattc_api.cc"
        "gatt/bta_gattc_cache.cc"
        "gatt/bta_gattc_main.cc"
        "gatt/bta_gattc_queue.cc"
        "gatt/bta_gattc_utils.cc"
        "gatt/bta_gatts_act.cc"
        "gatt/bta_gatts_api.cc"
        "gatt/bta_gatts_main.cc"
        "gatt/bta_gatts_utils.cc"
        "gatt/database.cc"
        "gatt/database_builder.cc"
        "hearing_aid/hearing_aid.cc"
        "hearing_aid/hearing_aid_audio_source.cc"
        "hf_client/bta_hf_client_act.cc"
        "hf_client/bta_hf_client_api.cc"
        "hf_client/bta_hf_client_at.cc"
        "hf_client/bta_hf_client_main.cc"
        "hf_client/bta_hf_client_rfc.cc"
        "hf_client/bta_hf_client_sco.cc"
        "hf_client/bta_hf_client_sdp.cc"
        "hh/bta_hh_act.cc"
        "hh/bta_hh_api.cc"
        "hh/bta_hh_cfg.cc"
        "hh/bta_hh_le.cc"
        "hh/bta_hh_main.cc"
        "hh/bta_hh_utils.cc"
        "hd/bta_hd_act.cc"
        "hd/bta_hd_api.cc"
        "hd/bta_hd_main.cc"
        "jv/bta_jv_act.cc"
        "jv/bta_jv_api.cc"
        "jv/bta_jv_cfg.cc"
        "mce/bta_mce_act.cc"
        "mce/bta_mce_api.cc"
        "mce/bta_mce_cfg.cc"
        "mce/bta_mce_main.cc"
        "pan/bta_pan_act.cc"
        "pan/bta_pan_api.cc"
        "pan/bta_pan_ci.cc"
        "pan/bta_pan_main.cc"
        "sdp/bta_sdp.cc"
        "sdp/bta_sdp_act.cc"
        "sdp/bta_sdp_api.cc"
        "sdp/bta_sdp_cfg.cc"
        "sys/bta_sys_conn.cc"
        "sys/bta_sys_main.cc"
        "sys/utl.cc"
    ];
    static_libs = [
        "avrcp-target-service"
        "lib-bt-packets"
    ];
    whole_static_libs = [
        "libaudio-hearing-aid-hw-utils"
    ];
};

#  bta unit tests for target
#  ========================================================
net_test_bta = cc_test {
    name = "net_test_bta";
    defaults = ["fluoride_bta_defaults"];
    srcs = [
        "test/bta_hf_client_test.cc"
        "test/gatt/database_builder_test.cc"
        "test/gatt/database_builder_sample_device_test.cc"
        "test/gatt/database_test.cc"
    ];
    shared_libs = [
        "libcrypto"
        "liblog"
        "libprotobuf-cpp-lite"
    ];
    static_libs = [
        "libbtcore"
        "libbt-bta"
        "libbt-audio-hal-interface"
        "libbluetooth-types"
        "libbt-protos-lite"
        "libosi"
        "libbt-common"
    ];
};

in { inherit fluoride_bta_defaults libbt-bta net_test_bta; }
