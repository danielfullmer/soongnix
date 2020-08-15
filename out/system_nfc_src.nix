{ cc_library_shared }:
let

libnfc-nci = cc_library_shared {
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
    name = "libnfc-nci";
    shared_libs = [
        "libcutils"
        "liblog"
        "libdl"
        "libhardware"
        "libmetricslogger"
        "libz"
        "libchrome"
        "libbase"
        "libstatslog"

        #  Treble configuration
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutils"
        "android.hardware.nfc@1.0"
        "android.hardware.nfc@1.1"
        "android.hardware.nfc@1.2"
    ];
    static_libs = [
        "libnfcutils"
    ];
    cflags = [
        "-DBUILDCFG=1"
        "-Wall"
        "-Werror"
        "-Wimplicit-fallthrough"
    ];
    local_include_dirs = [
        "include"
        "gki/ulinux"
        "gki/common"
        "nfa/include"
        "nfc/include"
    ];
    srcs = [
        "nfa/ce/nfa_ce_act.cc"
        "nfa/ce/nfa_ce_api.cc"
        "nfa/ce/nfa_ce_main.cc"
        "nfa/dm/nfa_dm_act.cc"
        "nfa/dm/nfa_dm_api.cc"
        "nfa/dm/nfa_dm_cfg.cc"
        "nfa/dm/nfa_dm_discover.cc"
        "nfa/dm/nfa_dm_main.cc"
        "nfa/dm/nfa_dm_ndef.cc"
        "nfa/ee/nfa_ee_act.cc"
        "nfa/ee/nfa_ee_api.cc"
        "nfa/ee/nfa_ee_main.cc"
        "nfa/hci/nfa_hci_act.cc"
        "nfa/hci/nfa_hci_api.cc"
        "nfa/hci/nfa_hci_ci.cc"
        "nfa/hci/nfa_hci_main.cc"
        "nfa/hci/nfa_hci_utils.cc"
        "nfa/p2p/nfa_p2p_act.cc"
        "nfa/p2p/nfa_p2p_api.cc"
        "nfa/p2p/nfa_p2p_main.cc"
        "nfa/rw/nfa_rw_act.cc"
        "nfa/rw/nfa_rw_api.cc"
        "nfa/rw/nfa_rw_main.cc"
        "nfa/sys/nfa_sys_cback.cc"
        "nfa/sys/nfa_sys_cfg.cc"
        "nfa/sys/nfa_sys_main.cc"
        "nfa/sys/nfa_sys_ptim.cc"
        "nfc/llcp/llcp_api.cc"
        "nfc/llcp/llcp_dlc.cc"
        "nfc/llcp/llcp_link.cc"
        "nfc/llcp/llcp_main.cc"
        "nfc/llcp/llcp_sdp.cc"
        "nfc/llcp/llcp_util.cc"
        "nfc/nci/nci_hmsgs.cc"
        "nfc/nci/nci_hrcv.cc"
        "nfc/ndef/ndef_utils.cc"
        "nfc/nfc/nfc_ee.cc"
        "nfc/nfc/nfc_main.cc"
        "nfc/nfc/nfc_ncif.cc"
        "nfc/nfc/nfc_task.cc"
        "nfc/nfc/nfc_test.cc"
        "nfc/nfc/nfc_utils.cc"
        "nfc/nfc/nfc_vs.cc"
        "nfc/tags/ce_main.cc"
        "nfc/tags/ce_t3t.cc"
        "nfc/tags/ce_t4t.cc"
        "nfc/tags/rw_i93.cc"
        "nfc/tags/rw_main.cc"
        "nfc/tags/rw_mfc.cc"
        "nfc/tags/rw_t1t.cc"
        "nfc/tags/rw_t1t_ndef.cc"
        "nfc/tags/rw_t2t.cc"
        "nfc/tags/rw_t2t_ndef.cc"
        "nfc/tags/rw_t3t.cc"
        "nfc/tags/rw_t4t.cc"
        "nfc/tags/tags_int.cc"
        "adaptation/CrcChecksum.cc"
        "adaptation/NfcAdaptation.cc"
        "adaptation/debug_nfcsnoop.cc"
        "adaptation/libmain.cc"
        "adaptation/nfc_config.cc"
        "gki/common/gki_buffer.cc"
        "gki/common/gki_time.cc"
        "gki/ulinux/gki_ulinux.cc"
    ];
    product_variables = {
        debuggable = {
            cflags = [
                "-DDCHECK_ALWAYS_ON"
            ];
        };
    };
};

in { inherit libnfc-nci; }
