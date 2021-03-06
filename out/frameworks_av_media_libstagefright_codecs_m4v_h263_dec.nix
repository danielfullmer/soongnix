{ cc_library_shared, cc_library_static }:
let

libstagefright_m4vh263dec = cc_library_static {
    name = "libstagefright_m4vh263dec";
    vendor_available = true;
    shared_libs = ["liblog"];

    srcs = [
        "src/adaptive_smooth_no_mmx.cpp"
        "src/bitstream.cpp"
        "src/block_idct.cpp"
        "src/cal_dc_scaler.cpp"
        "src/chvr_filter.cpp"
        "src/chv_filter.cpp"
        "src/combined_decode.cpp"
        "src/conceal.cpp"
        "src/datapart_decode.cpp"
        "src/dcac_prediction.cpp"
        "src/dec_pred_intra_dc.cpp"
        "src/deringing_chroma.cpp"
        "src/deringing_luma.cpp"
        "src/find_min_max.cpp"
        "src/get_pred_adv_b_add.cpp"
        "src/get_pred_outside.cpp"
        "src/idct.cpp"
        "src/idct_vca.cpp"
        "src/mb_motion_comp.cpp"
        "src/mb_utils.cpp"
        "src/packet_util.cpp"
        "src/post_filter.cpp"
        "src/post_proc_semaphore.cpp"
        "src/pp_semaphore_chroma_inter.cpp"
        "src/pp_semaphore_luma.cpp"
        "src/pvdec_api.cpp"
        "src/scaling_tab.cpp"
        "src/vlc_decode.cpp"
        "src/vlc_dequant.cpp"
        "src/vlc_tab.cpp"
        "src/vop.cpp"
        "src/zigzag_tab.cpp"
    ];

    header_libs = [
        "media_plugin_headers"
        "libstagefright_headers"
    ];

    local_include_dirs = ["src"];
    export_include_dirs = ["include"];

    cflags = [
        "-DOSCL_EXPORT_REF="
        "-DOSCL_IMPORT_REF="

        "-Werror"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

# ###############################################################################

libstagefright_soft_mpeg4dec = cc_library_shared {
    name = "libstagefright_soft_mpeg4dec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftMPEG4.cpp"];

    local_include_dirs = ["src"];

    cflags = [
        "-DOSCL_EXPORT_REF="
        "-DOSCL_IMPORT_REF="
    ];

    static_libs = ["libstagefright_m4vh263dec"];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libstagefright_m4vh263dec libstagefright_soft_mpeg4dec; }
