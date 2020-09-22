{ cc_defaults, cc_fuzz, cc_library_shared }:
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
        "libz"
        "libchrome"
        "libbase"
        "libstatslog"

        #  Treble configuration
        "libhidlbase"
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
    sanitize = {
        misc_undefined = ["bounds"];
        integer_overflow = true;
    };

};

nfc_fuzzer_defaults = cc_defaults {
    name = "nfc_fuzzer_defaults";
    host_supported = true;
    native_coverage = true;
    static_libs = [
        "libnfcutils"
        "libcutils"
        "liblog"
        "libbase"
        "libchrome"
    ];
    cflags = [
        "-DBUILDCFG=1"
        "-Wall"
        "-Werror"
        "-Wimplicit-fallthrough"
        "-g"
        "-DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION"
        "-DGKI_ENABLE_BUF_CORRUPTION_CHECK=FALSE"
    ];
    product_variables = {
        debuggable = {
            cflags = [
                "-DDCHECK_ALWAYS_ON"
            ];
        };
    };
    local_include_dirs = [
        "include"
        "gki/ulinux"
        "gki/common"
        "nfc/include"
        "nfa/include"
        "fuzzers/inc"
    ];
};

nfc_nci_fuzzer = cc_fuzz {
    name = "nfc_nci_fuzzer";
    defaults = ["nfc_fuzzer_defaults"];
    srcs = [
        "nfc/nci/nci_hmsgs.cc"
        "nfc/nci/nci_hrcv.cc"
        "nfc/nfc/nfc_ee.cc"
        "nfc/nfc/nfc_main.cc"
        "nfc/nfc/nfc_ncif.cc"
        "nfc/nfc/nfc_task.cc"
        "nfc/nfc/nfc_test.cc"
        "nfc/nfc/nfc_utils.cc"
        "nfc/nfc/nfc_vs.cc"
        "gki/common/gki_buffer.cc"
        "gki/common/gki_time.cc"
        "gki/ulinux/gki_ulinux.cc"
        "fuzzers/fuzz_cmn.cc"
        "fuzzers/fuzz_utils.cc"
        "fuzzers/nci/hal.cc"
        "fuzzers/nci/nci.cc"
        "fuzzers/nci/stubs.cc"
    ];
};

nfc_rw_fuzzer = cc_fuzz {
    name = "nfc_rw_fuzzer";
    defaults = ["nfc_fuzzer_defaults"];
    srcs = [
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
        "gki/common/gki_buffer.cc"
        "gki/common/gki_time.cc"
        "gki/ulinux/gki_ulinux.cc"
        "fuzzers/fuzz_cmn.cc"
        "fuzzers/fuzz_utils.cc"
        "fuzzers/rw/main.cc"
        "fuzzers/rw/mfc.cc"
        "fuzzers/rw/stubs.cc"
        "fuzzers/rw/t1t.cc"
        "fuzzers/rw/t2t.cc"
        "fuzzers/rw/t3t.cc"
        "fuzzers/rw/t4t.cc"
        "fuzzers/rw/t5t.cc"
    ];
};

nfc_ce_fuzzer = cc_fuzz {
    name = "nfc_ce_fuzzer";
    defaults = ["nfc_fuzzer_defaults"];
    srcs = [
        "nfc/tags/ce_main.cc"
        "nfc/tags/ce_t3t.cc"
        "nfc/tags/ce_t4t.cc"
        "nfc/tags/tags_int.cc"
        "gki/common/gki_buffer.cc"
        "gki/common/gki_time.cc"
        "gki/ulinux/gki_ulinux.cc"
        "fuzzers/fuzz_cmn.cc"
        "fuzzers/fuzz_utils.cc"
        "fuzzers/ce/main.cc"
        "fuzzers/ce/stubs.cc"
        "fuzzers/ce/t3t.cc"
        "fuzzers/ce/t4t.cc"
    ];
};

nfc_ndef_fuzzer = cc_fuzz {
    name = "nfc_ndef_fuzzer";
    defaults = ["nfc_fuzzer_defaults"];
    srcs = [
        "nfa/dm/nfa_dm_ndef.cc"
        "nfc/ndef/ndef_utils.cc"
        "gki/common/gki_buffer.cc"
        "gki/common/gki_time.cc"
        "gki/ulinux/gki_ulinux.cc"
        "fuzzers/fuzz_cmn.cc"
        "fuzzers/fuzz_utils.cc"
        "fuzzers/ndef/main.cc"
        "fuzzers/ndef/stubs.cc"
    ];
};

nfc_llcp_fuzzer = cc_fuzz {
    name = "nfc_llcp_fuzzer";
    defaults = ["nfc_fuzzer_defaults"];
    srcs = [
        "nfc/llcp/llcp_api.cc"
        "nfc/llcp/llcp_dlc.cc"
        "nfc/llcp/llcp_link.cc"
        "nfc/llcp/llcp_main.cc"
        "nfc/llcp/llcp_sdp.cc"
        "nfc/llcp/llcp_util.cc"
        "gki/common/gki_buffer.cc"
        "gki/common/gki_time.cc"
        "gki/ulinux/gki_ulinux.cc"
        "fuzzers/fuzz_cmn.cc"
        "fuzzers/fuzz_utils.cc"
        "fuzzers/llcp/llcp.cc"
        "fuzzers/llcp/stubs.cc"
    ];
};

in { inherit libnfc-nci nfc_ce_fuzzer nfc_fuzzer_defaults nfc_llcp_fuzzer nfc_nci_fuzzer nfc_ndef_fuzzer nfc_rw_fuzzer; }
