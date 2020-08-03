{ cc_library_shared, cc_library_static, cc_test }:
let

libstagefright_amrnbdec = cc_library_static {
    name = "libstagefright_amrnbdec";
    vendor_available = true;

    srcs = [
        "src/a_refl.cpp"
        "src/agc.cpp"
        "src/amrdecode.cpp"
        "src/b_cn_cod.cpp"
        "src/bgnscd.cpp"
        "src/c_g_aver.cpp"
        "src/d1035pf.cpp"
        "src/d2_11pf.cpp"
        "src/d2_9pf.cpp"
        "src/d3_14pf.cpp"
        "src/d4_17pf.cpp"
        "src/d8_31pf.cpp"
        "src/d_gain_c.cpp"
        "src/d_gain_p.cpp"
        "src/d_plsf.cpp"
        "src/d_plsf_3.cpp"
        "src/d_plsf_5.cpp"
        "src/dec_amr.cpp"
        "src/dec_gain.cpp"
        "src/dec_input_format_tab.cpp"
        "src/dec_lag3.cpp"
        "src/dec_lag6.cpp"
        "src/dtx_dec.cpp"
        "src/ec_gains.cpp"
        "src/ex_ctrl.cpp"
        "src/if2_to_ets.cpp"
        "src/int_lsf.cpp"
        "src/lsp_avg.cpp"
        "src/ph_disp.cpp"
        "src/post_pro.cpp"
        "src/preemph.cpp"
        "src/pstfilt.cpp"
        "src/qgain475_tab.cpp"
        "src/sp_dec.cpp"
        "src/wmf_to_ets.cpp"
    ];

    export_include_dirs = ["src"];

    cflags = [
        "-DOSCL_UNUSED_ARG(x)=(void)(x)"
        "-DOSCL_IMPORT_REF="

        "-Werror"
    ];

    version_script = "exports.lds";

    # sanitize: {
    #     misc_undefined: [
    #         "signed-integer-overflow",
    #     ],
    # },

    shared_libs = [
        "libstagefright_amrnb_common"
        "liblog"
    ];
};

# ###############################################################################

libstagefright_soft_amrdec = cc_library_shared {
    name = "libstagefright_soft_amrdec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftAMR.cpp"];

    local_include_dirs = ["src"];

    cflags = [
        "-DOSCL_IMPORT_REF="
    ];

    version_script = "exports.lds";

    # sanitize: {
    #     misc_undefined: [
    #         "signed-integer-overflow",
    #     ],
    # },
    # LOCAL_SANITIZE := signed-integer-overflow

    static_libs = [
        "libstagefright_amrnbdec"
        "libstagefright_amrwbdec"
    ];

    shared_libs = [
        "libstagefright_amrnb_common"
    ];
};

# ###############################################################################
libstagefright_amrnbdec_test = cc_test {
    name = "libstagefright_amrnbdec_test";
    gtest = false;

    srcs = ["test/amrnbdec_test.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = ["src"];

    static_libs = [
        "libstagefright_amrnbdec"
        "libsndfile"
    ];

    shared_libs = [
        "libstagefright_amrnb_common"
        "libaudioutils"
        "liblog"
    ];

    # sanitize: {
    #     misc_undefined: [
    #         "signed-integer-overflow",
    #     ],
    # },
};

in { inherit libstagefright_amrnbdec libstagefright_amrnbdec_test libstagefright_soft_amrdec; }
