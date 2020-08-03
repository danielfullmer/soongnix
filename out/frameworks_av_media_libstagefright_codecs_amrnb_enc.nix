{ cc_library_shared, cc_library_static, cc_test }:
let

libstagefright_amrnbenc = cc_library_static {
    name = "libstagefright_amrnbenc";
    vendor_available = true;

    srcs = [
        "src/amrencode.cpp"
        "src/autocorr.cpp"
        "src/c1035pf.cpp"
        "src/c2_11pf.cpp"
        "src/c2_9pf.cpp"
        "src/c3_14pf.cpp"
        "src/c4_17pf.cpp"
        "src/c8_31pf.cpp"
        "src/calc_cor.cpp"
        "src/calc_en.cpp"
        "src/cbsearch.cpp"
        "src/cl_ltp.cpp"
        "src/cod_amr.cpp"
        "src/convolve.cpp"
        "src/cor_h.cpp"
        "src/cor_h_x.cpp"
        "src/cor_h_x2.cpp"
        "src/corrwght_tab.cpp"
        "src/dtx_enc.cpp"
        "src/enc_lag3.cpp"
        "src/enc_lag6.cpp"
        "src/enc_output_format_tab.cpp"
        "src/ets_to_if2.cpp"
        "src/ets_to_wmf.cpp"
        "src/g_adapt.cpp"
        "src/g_code.cpp"
        "src/g_pitch.cpp"
        "src/gain_q.cpp"
        "src/hp_max.cpp"
        "src/inter_36.cpp"
        "src/inter_36_tab.cpp"
        "src/l_comp.cpp"
        "src/l_extract.cpp"
        "src/l_negate.cpp"
        "src/lag_wind.cpp"
        "src/lag_wind_tab.cpp"
        "src/levinson.cpp"
        "src/lpc.cpp"
        "src/ol_ltp.cpp"
        "src/p_ol_wgh.cpp"
        "src/pitch_fr.cpp"
        "src/pitch_ol.cpp"
        "src/pre_big.cpp"
        "src/pre_proc.cpp"
        "src/prm2bits.cpp"
        "src/q_gain_c.cpp"
        "src/q_gain_p.cpp"
        "src/qgain475.cpp"
        "src/qgain795.cpp"
        "src/qua_gain.cpp"
        "src/s10_8pf.cpp"
        "src/set_sign.cpp"
        "src/sid_sync.cpp"
        "src/sp_enc.cpp"
        "src/spreproc.cpp"
        "src/spstproc.cpp"
        "src/ton_stab.cpp"
    ];

    header_libs = ["libstagefright_headers"];
    export_include_dirs = ["src"];

    cflags = [
        "-DOSCL_UNUSED_ARG(x)=(void)(x)"
        "-Werror"
    ];

    version_script = "exports.lds";

    # addressing b/25409744
    # sanitize: {
    #     misc_undefined: [
    #         "signed-integer-overflow",
    #     ],
    # },

    shared_libs = ["libstagefright_amrnb_common"];
};

# ###############################################################################

libstagefright_soft_amrnbenc = cc_library_shared {
    name = "libstagefright_soft_amrnbenc";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftAMRNBEncoder.cpp"];

    local_include_dirs = ["src"];

    # addressing b/25409744
    # sanitize: {
    #     misc_undefined: [
    #         "signed-integer-overflow",
    #     ],
    # },

    static_libs = ["libstagefright_amrnbenc"];

    shared_libs = [
        "libstagefright_amrnb_common"
    ];
};

# ###############################################################################

libstagefright_amrnbenc_test = cc_test {
    name = "libstagefright_amrnbenc_test";
    gtest = false;

    srcs = ["test/amrnb_enc_test.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = ["src"];

    static_libs = ["libstagefright_amrnbenc"];

    shared_libs = ["libstagefright_amrnb_common"];

    # addressing b/25409744
    # sanitize: {
    #     misc_undefined: [
    #         "signed-integer-overflow",
    #     ],
    # },
};

in { inherit libstagefright_amrnbenc libstagefright_amrnbenc_test libstagefright_soft_amrnbenc; }
