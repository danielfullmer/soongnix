{ cc_library_static, cc_test }:
let

libstagefright_amrwbdec = cc_library_static {
    name = "libstagefright_amrwbdec";
    vendor_available = true;

    srcs = [
        "src/agc2_amr_wb.cpp"
        "src/band_pass_6k_7k.cpp"
        "src/dec_acelp_2p_in_64.cpp"
        "src/dec_acelp_4p_in_64.cpp"
        "src/dec_alg_codebook.cpp"
        "src/dec_gain2_amr_wb.cpp"
        "src/deemphasis_32.cpp"
        "src/dtx_decoder_amr_wb.cpp"
        "src/get_amr_wb_bits.cpp"
        "src/highpass_400hz_at_12k8.cpp"
        "src/highpass_50hz_at_12k8.cpp"
        "src/homing_amr_wb_dec.cpp"
        "src/interpolate_isp.cpp"
        "src/isf_extrapolation.cpp"
        "src/isp_az.cpp"
        "src/isp_isf.cpp"
        "src/lagconceal.cpp"
        "src/low_pass_filt_7k.cpp"
        "src/median5.cpp"
        "src/mime_io.cpp"
        "src/noise_gen_amrwb.cpp"
        "src/normalize_amr_wb.cpp"
        "src/oversamp_12k8_to_16k.cpp"
        "src/phase_dispersion.cpp"
        "src/pit_shrp.cpp"
        "src/pred_lt4.cpp"
        "src/preemph_amrwb_dec.cpp"
        "src/pvamrwb_math_op.cpp"
        "src/pvamrwbdecoder.cpp"
        "src/q_gain2_tab.cpp"
        "src/qisf_ns.cpp"
        "src/qisf_ns_tab.cpp"
        "src/qpisf_2s.cpp"
        "src/qpisf_2s_tab.cpp"
        "src/scale_signal.cpp"
        "src/synthesis_amr_wb.cpp"
        "src/voice_factor.cpp"
        "src/wb_syn_filt.cpp"
        "src/weight_amrwb_lpc.cpp"
    ];

    header_libs = ["libstagefright_headers"];

    export_include_dirs = [
        "src"
        "include"
    ];

    cflags = [
        "-DOSCL_UNUSED_ARG(x)=(void)(x)"
        "-DOSCL_IMPORT_REF="

        "-Werror"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
    };
};

# ###############################################################################
libstagefright_amrwbdec_test = cc_test {
    name = "libstagefright_amrwbdec_test";
    gtest = false;

    srcs = ["test/amrwbdec_test.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "libstagefright_amrwbdec"
        "libsndfile"
    ];

    local_include_dirs = ["src"];

    shared_libs = ["libaudioutils"];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
    };
};

in { inherit libstagefright_amrwbdec libstagefright_amrwbdec_test; }
