{ cc_library_static, cc_test }:
let

libhevcdec = cc_library_static {
    name = "libhevcdec";
    vendor_available = true;

    cflags = [
        "-D_LIB"
        "-DMULTICORE"
        "-fPIC"

        "-O3"
        "-DANDROID"
        "-Wall"
        "-Werror"
        #  common/x86/ihevc_sao_ssse3_intr.c: implicit conversion from
        #  'int' to 'char' changes value from 128 to -128
        "-Wno-error=constant-conversion"
    ];

    export_include_dirs = [
        "decoder"
        "common"
    ];

    srcs = [
        "common/ihevc_quant_tables.c"
        "common/ihevc_inter_pred_filters.c"
        "common/ihevc_weighted_pred.c"
        "common/ihevc_padding.c"
        "common/ihevc_deblk_edge_filter.c"
        "common/ihevc_deblk_tables.c"
        "common/ihevc_cabac_tables.c"
        "common/ihevc_common_tables.c"
        "common/ihevc_intra_pred_filters.c"
        "common/ihevc_chroma_intra_pred_filters.c"
        "common/ihevc_mem_fns.c"
        "common/ihevc_sao.c"
        "common/ihevc_trans_tables.c"
        "common/ihevc_recon.c"
        "common/ihevc_itrans.c"
        "common/ihevc_itrans_recon.c"
        "common/ihevc_iquant_recon.c"
        "common/ihevc_iquant_itrans_recon.c"
        "common/ihevc_itrans_recon_32x32.c"
        "common/ihevc_itrans_recon_16x16.c"
        "common/ihevc_itrans_recon_8x8.c"
        "common/ihevc_chroma_itrans_recon.c"
        "common/ihevc_chroma_iquant_recon.c"
        "common/ihevc_chroma_iquant_itrans_recon.c"
        "common/ihevc_chroma_recon.c"
        "common/ihevc_chroma_itrans_recon_16x16.c"
        "common/ihevc_chroma_itrans_recon_8x8.c"
        "common/ihevc_buf_mgr.c"
        "common/ihevc_disp_mgr.c"
        "common/ihevc_dpb_mgr.c"
        "common/ithread.c"
        "decoder/ihevcd_version.c"
        "decoder/ihevcd_api.c"
        "decoder/ihevcd_decode.c"
        "decoder/ihevcd_nal.c"
        "decoder/ihevcd_bitstream.c"
        "decoder/ihevcd_parse_headers.c"
        "decoder/ihevcd_parse_slice_header.c"
        "decoder/ihevcd_parse_slice.c"
        "decoder/ihevcd_parse_residual.c"
        "decoder/ihevcd_cabac.c"
        "decoder/ihevcd_intra_pred_mode_prediction.c"
        "decoder/ihevcd_process_slice.c"
        "decoder/ihevcd_utils.c"
        "decoder/ihevcd_job_queue.c"
        "decoder/ihevcd_ref_list.c"
        "decoder/ihevcd_get_mv.c"
        "decoder/ihevcd_mv_pred.c"
        "decoder/ihevcd_mv_merge.c"
        "decoder/ihevcd_iquant_itrans_recon_ctb.c"
        "decoder/ihevcd_itrans_recon_dc.c"
        "decoder/ihevcd_common_tables.c"
        "decoder/ihevcd_boundary_strength.c"
        "decoder/ihevcd_deblk.c"
        "decoder/ihevcd_inter_pred.c"
        "decoder/ihevcd_sao.c"
        "decoder/ihevcd_ilf_padding.c"
        "decoder/ihevcd_fmt_conv.c"
    ];

    arch = {
        arm64 = {
            cflags = [
                "-DARMV8"
                "-DDISABLE_NEONINTR"
                "-DARM"
                "-DARMGCC"

                "-DDEFAULT_ARCH=D_ARCH_ARMV8_GENERIC"
            ];
            local_include_dirs = [
                "decoder/arm"
                "common/arm"
                "decoder/arm64"
                "common/arm64"
            ];

            srcs = [
                "decoder/arm/ihevcd_function_selector.c"
                "decoder/arm/ihevcd_function_selector_noneon.c"
                "decoder/arm64/ihevcd_function_selector_av8.c"
                "common/arm/ihevc_intra_pred_filters_neon_intr.c"
                "common/arm/ihevc_weighted_pred_neon_intr.c"
                "common/arm64/ihevc_mem_fns.s"
                "common/arm64/ihevc_itrans_recon_32x32.s"
                "common/arm64/ihevc_weighted_pred_bi_default.s"
                "common/arm64/ihevc_weighted_pred_bi.s"
                "common/arm64/ihevc_weighted_pred_uni.s"
                "common/arm64/ihevc_deblk_luma_horz.s"
                "common/arm64/ihevc_deblk_luma_vert.s"
                "common/arm64/ihevc_deblk_chroma_vert.s"
                "common/arm64/ihevc_deblk_chroma_horz.s"
                "common/arm64/ihevc_sao_band_offset_luma.s"
                "common/arm64/ihevc_sao_band_offset_chroma.s"
                "common/arm64/ihevc_sao_edge_offset_class0.s"
                "common/arm64/ihevc_sao_edge_offset_class0_chroma.s"
                "common/arm64/ihevc_sao_edge_offset_class1.s"
                "common/arm64/ihevc_sao_edge_offset_class1_chroma.s"
                "common/arm64/ihevc_sao_edge_offset_class2.s"
                "common/arm64/ihevc_sao_edge_offset_class2_chroma.s"
                "common/arm64/ihevc_sao_edge_offset_class3.s"
                "common/arm64/ihevc_sao_edge_offset_class3_chroma.s"
                "common/arm64/ihevc_inter_pred_luma_horz_w16out.s"
                "common/arm64/ihevc_inter_pred_filters_luma_horz.s"
                "common/arm64/ihevc_inter_pred_filters_luma_vert.s"
                "common/arm64/ihevc_inter_pred_chroma_horz.s"
                "common/arm64/ihevc_inter_pred_chroma_horz_w16out.s"
                "common/arm64/ihevc_inter_pred_chroma_vert.s"
                "common/arm64/ihevc_inter_pred_chroma_vert_w16out.s"
                "common/arm64/ihevc_inter_pred_chroma_vert_w16inp.s"
                "common/arm64/ihevc_inter_pred_chroma_vert_w16inp_w16out.s"
                "common/arm64/ihevc_inter_pred_filters_luma_vert_w16inp.s"
                "common/arm64/ihevc_inter_pred_filters_luma_vert_w16out.s"
                "common/arm64/ihevc_inter_pred_luma_vert_w16inp_w16out.s"
                "common/arm64/ihevc_inter_pred_luma_copy_w16out.s"
                "common/arm64/ihevc_inter_pred_luma_copy.s"
                "common/arm64/ihevc_inter_pred_chroma_copy.s"
                "common/arm64/ihevc_inter_pred_chroma_copy_w16out.s"
                "common/arm64/ihevc_itrans_recon_4x4_ttype1.s"
                "common/arm64/ihevc_itrans_recon_4x4.s"
                "common/arm64/ihevc_itrans_recon_8x8.s"
                "common/arm64/ihevc_itrans_recon_16x16.s"
                "common/arm64/ihevc_intra_pred_chroma_planar.s"
                "common/arm64/ihevc_intra_pred_chroma_dc.s"
                "common/arm64/ihevc_intra_pred_chroma_horz.s"
                "common/arm64/ihevc_intra_pred_chroma_ver.s"
                "common/arm64/ihevc_intra_pred_chroma_mode2.s"
                "common/arm64/ihevc_intra_pred_chroma_mode_18_34.s"
                "common/arm64/ihevc_intra_pred_filters_chroma_mode_11_to_17.s"
                "common/arm64/ihevc_intra_pred_filters_chroma_mode_19_to_25.s"
                "common/arm64/ihevc_intra_pred_chroma_mode_3_to_9.s"
                "common/arm64/ihevc_intra_pred_chroma_mode_27_to_33.s"
                "common/arm64/ihevc_intra_pred_luma_planar.s"
                "common/arm64/ihevc_intra_pred_luma_horz.s"
                "common/arm64/ihevc_intra_pred_luma_mode2.s"
                "common/arm64/ihevc_intra_pred_luma_mode_27_to_33.s"
                "common/arm64/ihevc_intra_pred_luma_mode_18_34.s"
                "common/arm64/ihevc_intra_pred_luma_vert.s"
                "common/arm64/ihevc_intra_pred_luma_dc.s"
                "common/arm64/ihevc_intra_pred_filters_luma_mode_11_to_17.s"
                "common/arm64/ihevc_intra_pred_filters_luma_mode_19_to_25.s"
                "common/arm64/ihevc_intra_pred_luma_mode_3_to_9.s"
                "common/arm64/ihevc_padding.s"
                "decoder/arm64/ihevcd_itrans_recon_dc_luma.s"
                "decoder/arm64/ihevcd_itrans_recon_dc_chroma.s"
                "decoder/arm64/ihevcd_fmt_conv_420sp_to_420p.s"
                "decoder/arm64/ihevcd_fmt_conv_420sp_to_420sp.s"
                "decoder/arm64/ihevcd_fmt_conv_420sp_to_rgba8888.s"
            ];
        };

        arm = {
            local_include_dirs = [
                "decoder/arm"
                "common/arm"
            ];

            srcs = [
                "decoder/arm/ihevcd_function_selector.c"
                "decoder/arm/ihevcd_function_selector_noneon.c"
            ];

            cflags = [
                "-DDISABLE_NEONINTR"
                "-DARM"
                "-DARMGCC"
                "-fno-tree-vectorize"

                #  These will be overriden by armv7_a_neon
                "-DDISABLE_NEON"
                "-DDEFAULT_ARCH=D_ARCH_ARM_NONEON"
            ];

            instruction_set = "arm";

            neon = {
                srcs = [
                    "decoder/arm/ihevcd_function_selector_a9q.c"
                    "common/arm/ihevc_intra_ref_substitution_a9q.c"
                    "common/arm/ihevc_intra_pred_filters_neon_intr.c"
                    "common/arm/ihevc_weighted_pred_neon_intr.c"
                    "common/arm/ihevc_mem_fns.s"
                    "common/arm/ihevc_itrans_recon_32x32.s"
                    "common/arm/ihevc_weighted_pred_bi_default.s"
                    "common/arm/ihevc_weighted_pred_bi.s"
                    "common/arm/ihevc_weighted_pred_uni.s"
                    "common/arm/ihevc_deblk_luma_horz.s"
                    "common/arm/ihevc_deblk_luma_vert.s"
                    "common/arm/ihevc_deblk_chroma_vert.s"
                    "common/arm/ihevc_deblk_chroma_horz.s"
                    "common/arm/ihevc_sao_band_offset_luma.s"
                    "common/arm/ihevc_sao_band_offset_chroma.s"
                    "common/arm/ihevc_sao_edge_offset_class0.s"
                    "common/arm/ihevc_sao_edge_offset_class0_chroma.s"
                    "common/arm/ihevc_sao_edge_offset_class1.s"
                    "common/arm/ihevc_sao_edge_offset_class1_chroma.s"
                    "common/arm/ihevc_sao_edge_offset_class2.s"
                    "common/arm/ihevc_sao_edge_offset_class2_chroma.s"
                    "common/arm/ihevc_sao_edge_offset_class3.s"
                    "common/arm/ihevc_sao_edge_offset_class3_chroma.s"
                    "common/arm/ihevc_inter_pred_luma_horz_w16out.s"
                    "common/arm/ihevc_inter_pred_filters_luma_horz.s"
                    "common/arm/ihevc_inter_pred_filters_luma_vert.s"
                    "common/arm/ihevc_inter_pred_chroma_horz.s"
                    "common/arm/ihevc_inter_pred_chroma_horz_w16out.s"
                    "common/arm/ihevc_inter_pred_chroma_vert.s"
                    "common/arm/ihevc_inter_pred_chroma_vert_w16out.s"
                    "common/arm/ihevc_inter_pred_chroma_vert_w16inp.s"
                    "common/arm/ihevc_inter_pred_chroma_vert_w16inp_w16out.s"
                    "common/arm/ihevc_inter_pred_filters_luma_vert_w16inp.s"
                    "common/arm/ihevc_inter_pred_luma_vert_w16inp_w16out.s"
                    "common/arm/ihevc_inter_pred_luma_copy_w16out.s"
                    "common/arm/ihevc_inter_pred_luma_copy.s"
                    "common/arm/ihevc_inter_pred_chroma_copy.s"
                    "common/arm/ihevc_inter_pred_chroma_copy_w16out.s"
                    "common/arm/ihevc_itrans_recon_4x4_ttype1.s"
                    "common/arm/ihevc_itrans_recon_4x4.s"
                    "common/arm/ihevc_itrans_recon_8x8.s"
                    "common/arm/ihevc_itrans_recon_16x16.s"
                    "common/arm/ihevc_intra_pred_chroma_planar.s"
                    "common/arm/ihevc_intra_pred_chroma_dc.s"
                    "common/arm/ihevc_intra_pred_chroma_horz.s"
                    "common/arm/ihevc_intra_pred_chroma_ver.s"
                    "common/arm/ihevc_intra_pred_chroma_mode2.s"
                    "common/arm/ihevc_intra_pred_chroma_mode_18_34.s"
                    "common/arm/ihevc_intra_pred_filters_chroma_mode_11_to_17.s"
                    "common/arm/ihevc_intra_pred_filters_chroma_mode_19_to_25.s"
                    "common/arm/ihevc_intra_pred_chroma_mode_3_to_9.s"
                    "common/arm/ihevc_intra_pred_chroma_mode_27_to_33.s"
                    "common/arm/ihevc_intra_pred_luma_planar.s"
                    "common/arm/ihevc_intra_pred_luma_horz.s"
                    "common/arm/ihevc_intra_pred_luma_mode2.s"
                    "common/arm/ihevc_intra_pred_luma_mode_27_to_33.s"
                    "common/arm/ihevc_intra_pred_luma_mode_18_34.s"
                    "common/arm/ihevc_intra_pred_luma_vert.s"
                    "common/arm/ihevc_intra_pred_luma_dc.s"
                    "common/arm/ihevc_intra_pred_filters_luma_mode_11_to_17.s"
                    "common/arm/ihevc_intra_pred_filters_luma_mode_19_to_25.s"
                    "common/arm/ihevc_intra_pred_luma_mode_3_to_9.s"
                    "common/arm/ihevc_padding.s"
                    "decoder/arm/ihevcd_itrans_recon_dc_luma.s"
                    "decoder/arm/ihevcd_itrans_recon_dc_chroma.s"
                    "decoder/arm/ihevcd_fmt_conv_420sp_to_420p.s"
                    "decoder/arm/ihevcd_fmt_conv_420sp_to_420sp.s"
                    "decoder/arm/ihevcd_fmt_conv_420sp_to_rgba8888.s"
                ];
                cflags = [
                    "-UDISABLE_NEON"
                    "-UDEFAULT_ARCH"
                    "-DDEFAULT_ARCH=D_ARCH_ARM_A9Q"
                ];
            };
        };

        mips64 = {
            local_include_dirs = [
                "decoder/mips"
                "common/mips"
            ];

            srcs = [
                "decoder/mips/ihevcd_function_selector.c"
                "decoder/mips/ihevcd_function_selector_mips_generic.c"
            ];
        };

        mips = {
            local_include_dirs = [
                "decoder/mips"
                "common/mips"
            ];

            srcs = [
                "decoder/mips/ihevcd_function_selector.c"
                "decoder/mips/ihevcd_function_selector_mips_generic.c"
            ];
        };

        x86_64 = {
            cflags = [
                "-DX86"
                "-DDISABLE_AVX2"
                "-msse4.2"
                "-mno-avx"
                "-DDEFAULT_ARCH=D_ARCH_X86_SSE42"
            ];

            local_include_dirs = [
                "decoder/x86"
                "common/x86"
            ];

            srcs = [
                "decoder/x86/ihevcd_function_selector.c"
                "decoder/x86/ihevcd_function_selector_generic.c"
                "decoder/x86/ihevcd_function_selector_ssse3.c"
                "decoder/x86/ihevcd_function_selector_sse42.c"
                "common/x86/ihevc_inter_pred_filters_ssse3_intr.c"
                "common/x86/ihevc_weighted_pred_ssse3_intr.c"
                "common/x86/ihevc_intra_pred_filters_ssse3_intr.c"
                "common/x86/ihevc_chroma_intra_pred_filters_ssse3_intr.c"
                "common/x86/ihevc_itrans_recon_ssse3_intr.c"
                "common/x86/ihevc_itrans_recon_16x16_ssse3_intr.c"
                "common/x86/ihevc_itrans_recon_32x32_ssse3_intr.c"
                "common/x86/ihevc_sao_ssse3_intr.c"
                "common/x86/ihevc_deblk_ssse3_intr.c"
                "common/x86/ihevc_padding_ssse3_intr.c"
                "common/x86/ihevc_mem_fns_ssse3_intr.c"
                "decoder/x86/ihevcd_fmt_conv_ssse3_intr.c"
                "decoder/x86/ihevcd_it_rec_dc_ssse3_intr.c"
                "common/x86/ihevc_inter_pred_filters_sse42_intr.c"
                "common/x86/ihevc_weighted_pred_sse42_intr.c"
                "common/x86/ihevc_intra_pred_filters_sse42_intr.c"
                "common/x86/ihevc_chroma_intra_pred_filters_sse42_intr.c"
                "common/x86/ihevc_itrans_recon_sse42_intr.c"
                "common/x86/ihevc_16x16_itrans_recon_sse42_intr.c"
                "common/x86/ihevc_32x32_itrans_recon_sse42_intr.c"
                "decoder/x86/ihevcd_it_rec_dc_sse42_intr.c"
                "common/x86/ihevc_tables_x86_intr.c"
            ];
        };

        x86 = {
            cflags = [
                "-DX86"
                "-DDISABLE_AVX2"
                "-msse4.2"
                "-mno-avx"
                "-DDEFAULT_ARCH=D_ARCH_X86_SSE42"
            ];

            local_include_dirs = [
                "decoder/x86"
                "common/x86"
            ];

            srcs = [
                "decoder/x86/ihevcd_function_selector.c"
                "decoder/x86/ihevcd_function_selector_generic.c"
                "decoder/x86/ihevcd_function_selector_ssse3.c"
                "decoder/x86/ihevcd_function_selector_sse42.c"
                "common/x86/ihevc_inter_pred_filters_ssse3_intr.c"
                "common/x86/ihevc_weighted_pred_ssse3_intr.c"
                "common/x86/ihevc_intra_pred_filters_ssse3_intr.c"
                "common/x86/ihevc_chroma_intra_pred_filters_ssse3_intr.c"
                "common/x86/ihevc_itrans_recon_ssse3_intr.c"
                "common/x86/ihevc_itrans_recon_16x16_ssse3_intr.c"
                "common/x86/ihevc_itrans_recon_32x32_ssse3_intr.c"
                "common/x86/ihevc_sao_ssse3_intr.c"
                "common/x86/ihevc_deblk_ssse3_intr.c"
                "common/x86/ihevc_padding_ssse3_intr.c"
                "common/x86/ihevc_mem_fns_ssse3_intr.c"
                "decoder/x86/ihevcd_fmt_conv_ssse3_intr.c"
                "decoder/x86/ihevcd_it_rec_dc_ssse3_intr.c"
                "common/x86/ihevc_inter_pred_filters_sse42_intr.c"
                "common/x86/ihevc_weighted_pred_sse42_intr.c"
                "common/x86/ihevc_intra_pred_filters_sse42_intr.c"
                "common/x86/ihevc_chroma_intra_pred_filters_sse42_intr.c"
                "common/x86/ihevc_itrans_recon_sse42_intr.c"
                "common/x86/ihevc_16x16_itrans_recon_sse42_intr.c"
                "common/x86/ihevc_32x32_itrans_recon_sse42_intr.c"
                "decoder/x86/ihevcd_it_rec_dc_sse42_intr.c"
                "common/x86/ihevc_tables_x86_intr.c"
            ];
        };
    };

    sanitize = {
        integer_overflow = true;
        misc_undefined = ["bounds"];
        #  Enable CFI if this becomes a shared library.
        #  cfi: true,
        blacklist = "libhevc_blacklist.txt";
    };
};

hevcdec = cc_test {
    name = "hevcdec";
    cflags = [
        "-DPROFILE_ENABLE"
        "-DARM"
        "-fPIC"
        "-DMD5_DISABLE"
        "-Wall"
        "-Werror"
    ];
    srcs = ["test/decoder/main.c"];
    static_libs = ["libhevcdec"];
};

libhevcenc = cc_library_static {
    name = "libhevcenc";
    vendor_available = true;

    cflags = [
        "-DENABLE_MAIN_REXT_PROFILE"
        "-fPIC"
        "-O3"
        "-Wall"
        "-Wno-unused-variable"
        "-Wno-unused-parameter"
        "-Wno-switch"
    ];

    export_include_dirs = [
        "encoder"
        "common"
    ];

    srcs = [
        "common/ihevc_cabac_tables.c"
        "common/ihevc_chroma_intra_pred_filters.c"
        "common/ihevc_chroma_itrans_recon.c"
        "common/ihevc_chroma_itrans_recon_16x16.c"
        "common/ihevc_chroma_itrans_recon_8x8.c"
        "common/ihevc_common_tables.c"
        "common/ihevc_deblk_edge_filter.c"
        "common/ihevc_deblk_tables.c"
        "common/ihevc_hbd_deblk_edge_filter.c"
        "common/ihevc_inter_pred_filters.c"
        "common/ihevc_intra_pred_filters.c"
        "common/ihevc_iquant_recon.c"
        "common/ihevc_itrans_recon.c"
        "common/ihevc_itrans_recon_16x16.c"
        "common/ihevc_itrans_recon_32x32.c"
        "common/ihevc_itrans_recon_8x8.c"
        "common/ihevc_mem_fns.c"
        "common/ihevc_padding.c"
        "common/ihevc_quant_iquant_ssd.c"
        "common/ihevc_quant_tables.c"
        "common/ihevc_resi_trans.c"
        "common/ihevc_sao.c"
        "common/ihevc_trans_tables.c"
        "common/ihevc_weighted_pred.c"
        "encoder/bit_allocation.c"
        "encoder/cbr_buffer_control.c"
        "encoder/common_rom.c"
        "encoder/convert_float_to_fix.c"
        "encoder/est_sad.c"
        "encoder/fixed_point_error_bits.c"
        "encoder/frame_info_collector.c"
        "encoder/hme_coarse.c"
        "encoder/hme_common_utils.c"
        "encoder/hme_err_compute.c"
        "encoder/hme_fullpel.c"
        "encoder/hme_function_selector.c"
        "encoder/hme_globals.c"
        "encoder/hme_interface.c"
        "encoder/hme_refine.c"
        "encoder/hme_search_algo.c"
        "encoder/hme_subpel.c"
        "encoder/hme_utils.c"
        "encoder/ihevce_bitstream.c"
        "encoder/ihevce_bs_compute_ctb.c"
        "encoder/ihevce_buffer_que.c"
        "encoder/ihevce_cabac.c"
        "encoder/ihevce_cabac_cu_pu.c"
        "encoder/ihevce_cabac_rdo.c"
        "encoder/ihevce_cabac_tu.c"
        "encoder/ihevce_chroma_had_satd.c"
        "encoder/ihevce_cmn_utils_instr_set_router.c"
        "encoder/ihevce_coarse_me_pass.c"
        "encoder/ihevce_common_utils.c"
        "encoder/ihevce_deblk.c"
        "encoder/ihevce_decomp_pre_intra_pass.c"
        "encoder/ihevce_dep_mngr.c"
        "encoder/ihevce_enc_cu_recursion.c"
        "encoder/ihevce_enc_loop_inter_mode_sifter.c"
        "encoder/ihevce_enc_loop_pass.c"
        "encoder/ihevce_enc_loop_utils.c"
        "encoder/ihevce_enc_sbh_funcs.c"
        "encoder/ihevce_enc_subpel_gen.c"
        "encoder/ihevce_encode_header.c"
        "encoder/ihevce_encode_header_sei_vui.c"
        "encoder/ihevce_entropy_cod.c"
        "encoder/ihevce_entropy_interface.c"
        "encoder/ihevce_error_check.c"
        "encoder/ihevce_frame_process.c"
        "encoder/ihevce_frame_process_utils.c"
        "encoder/ihevce_function_selector.c"
        "encoder/ihevce_global_tables.c"
        "encoder/ihevce_had_satd.c"
        "encoder/ihevce_hle_interface.c"
        "encoder/ihevce_hle_q_func.c"
        "encoder/ihevce_inter_pred.c"
        "encoder/ihevce_ipe_instr_set_router.c"
        "encoder/ihevce_ipe_pass.c"
        "encoder/ihevce_lap_interface.c"
        "encoder/ihevce_me_instr_set_router.c"
        "encoder/ihevce_me_pass.c"
        "encoder/ihevce_memory_init.c"
        "encoder/ihevce_multi_thrd_funcs.c"
        "encoder/ihevce_mv_pred.c"
        "encoder/ihevce_mv_pred_merge.c"
        "encoder/ihevce_nbr_avail.c"
        "encoder/ihevce_plugin.c"
        "encoder/ihevce_profile.c"
        "encoder/ihevce_rc_interface.c"
        "encoder/ihevce_recur_bracketing.c"
        "encoder/ihevce_sao.c"
        "encoder/ihevce_stasino_helpers.c"
        "encoder/ihevce_sub_pic_rc.c"
        "encoder/ihevce_sys_api.c"
        "encoder/ihevce_tile_interface.c"
        "encoder/ihevce_trace.c"
        "encoder/ihevce_tu_tree_selector.c"
        "encoder/init_qp.c"
        "encoder/mb_model_based.c"
        "encoder/osal.c"
        "encoder/osal_cond_var.c"
        "encoder/osal_error.c"
        "encoder/osal_mutex.c"
        "encoder/osal_semaphore.c"
        "encoder/osal_thread.c"
        "encoder/picture_type.c"
        "encoder/rate_control_api.c"
        "encoder/rc_rd_model.c"
        "encoder/rc_rd_model_fix.c"
        "encoder/rc_sad_acc.c"
        "encoder/sqrt_interp.c"
        "encoder/var_q_operator.c"
        "encoder/vbr_storage_vbv.c"
        "encoder/vbr_str_prms.c"
    ];

    arch = {
        arm64 = {

            local_include_dirs = [
                "encoder/arm"
                "common/arm"
                "common/arm64"
            ];

            srcs = [
                "encoder/arm/ihevce_coarse_layer_sad_neon.c"
                "encoder/arm/ihevce_common_utils_neon.c"
                "encoder/arm/ihevce_copy_neon.c"
                "encoder/arm/ihevce_had_compute_neon.c"
                "encoder/arm/ihevce_hme_utils_neon.c"
                "encoder/arm/ihevce_itrans_recon_neon.c"
                "encoder/arm/ihevce_me_neon.c"
                "encoder/arm/ihevce_sad_compute_neon.c"
                "encoder/arm/ihevce_scale_by_2_neon.c"
                "encoder/arm/ihevce_scan_coeffs_neon.c"
                "encoder/arm/ihevce_ssd_and_sad_calculator_neon.c"
                "encoder/arm/ihevce_ssd_calculator_neon.c"
                "encoder/arm/ihevce_subpel_neon.c"
                "common/arm/ihevc_resi_trans_neon.c"
                "common/arm/ihevc_resi_trans_neon_32x32.c"
                "common/arm/ihevc_quant_iquant_ssd_neon_intr.c"
                "common/arm/ihevc_intra_pred_filters_neon_intr.c"
                "common/arm/ihevc_weighted_pred_neon_intr.c"
                "common/arm/ihevc_intra_ref_substitution_a9q.c"
                "common/arm64/ihevc_deblk_chroma_horz.s"
                "common/arm64/ihevc_deblk_chroma_vert.s"
                "common/arm64/ihevc_deblk_luma_horz.s"
                "common/arm64/ihevc_deblk_luma_vert.s"
                "common/arm64/ihevc_inter_pred_chroma_copy.s"
                "common/arm64/ihevc_inter_pred_chroma_copy_w16out.s"
                "common/arm64/ihevc_inter_pred_chroma_horz.s"
                "common/arm64/ihevc_inter_pred_chroma_horz_w16out.s"
                "common/arm64/ihevc_inter_pred_chroma_vert.s"
                "common/arm64/ihevc_inter_pred_chroma_vert_w16inp.s"
                "common/arm64/ihevc_inter_pred_chroma_vert_w16inp_w16out.s"
                "common/arm64/ihevc_inter_pred_chroma_vert_w16out.s"
                "common/arm64/ihevc_inter_pred_filters_luma_horz.s"
                "common/arm64/ihevc_inter_pred_filters_luma_vert.s"
                "common/arm64/ihevc_inter_pred_filters_luma_vert_w16inp.s"
                "common/arm64/ihevc_inter_pred_filters_luma_vert_w16out.s"
                "common/arm64/ihevc_inter_pred_luma_copy.s"
                "common/arm64/ihevc_inter_pred_luma_copy_w16out.s"
                "common/arm64/ihevc_inter_pred_luma_horz_w16out.s"
                "common/arm64/ihevc_inter_pred_luma_vert_w16inp_w16out.s"
                "common/arm64/ihevc_intra_pred_chroma_dc.s"
                "common/arm64/ihevc_intra_pred_chroma_horz.s"
                "common/arm64/ihevc_intra_pred_chroma_mode2.s"
                "common/arm64/ihevc_intra_pred_chroma_mode_18_34.s"
                "common/arm64/ihevc_intra_pred_chroma_mode_27_to_33.s"
                "common/arm64/ihevc_intra_pred_chroma_mode_3_to_9.s"
                "common/arm64/ihevc_intra_pred_chroma_planar.s"
                "common/arm64/ihevc_intra_pred_chroma_ver.s"
                "common/arm64/ihevc_intra_pred_filters_chroma_mode_11_to_17.s"
                "common/arm64/ihevc_intra_pred_filters_chroma_mode_19_to_25.s"
                "common/arm64/ihevc_intra_pred_filters_luma_mode_11_to_17.s"
                "common/arm64/ihevc_intra_pred_filters_luma_mode_19_to_25.s"
                "common/arm64/ihevc_intra_pred_luma_dc.s"
                "common/arm64/ihevc_intra_pred_luma_horz.s"
                "common/arm64/ihevc_intra_pred_luma_mode2.s"
                "common/arm64/ihevc_intra_pred_luma_mode_18_34.s"
                "common/arm64/ihevc_intra_pred_luma_mode_27_to_33.s"
                "common/arm64/ihevc_intra_pred_luma_mode_3_to_9.s"
                "common/arm64/ihevc_intra_pred_luma_planar.s"
                "common/arm64/ihevc_intra_pred_luma_vert.s"
                "common/arm64/ihevc_itrans_recon_16x16.s"
                "common/arm64/ihevc_itrans_recon_32x32.s"
                "common/arm64/ihevc_itrans_recon_4x4.s"
                "common/arm64/ihevc_itrans_recon_4x4_ttype1.s"
                "common/arm64/ihevc_itrans_recon_8x8.s"
                "common/arm64/ihevc_mem_fns.s"
                "common/arm64/ihevc_padding.s"
                "common/arm64/ihevc_sao_band_offset_chroma.s"
                "common/arm64/ihevc_sao_band_offset_luma.s"
                "common/arm64/ihevc_sao_edge_offset_class0.s"
                "common/arm64/ihevc_sao_edge_offset_class0_chroma.s"
                "common/arm64/ihevc_sao_edge_offset_class1.s"
                "common/arm64/ihevc_sao_edge_offset_class1_chroma.s"
                "common/arm64/ihevc_sao_edge_offset_class2.s"
                "common/arm64/ihevc_sao_edge_offset_class2_chroma.s"
                "common/arm64/ihevc_sao_edge_offset_class3.s"
                "common/arm64/ihevc_sao_edge_offset_class3_chroma.s"
                "common/arm64/ihevc_weighted_pred_bi.s"
                "common/arm64/ihevc_weighted_pred_bi_default.s"
                "common/arm64/ihevc_weighted_pred_uni.s"
            ];

            cflags = [
                "-DENABLE_NEON"
                "-DARMV8"
                "-DARM"
            ];
        };

        arm = {
            local_include_dirs = [
                "encoder/arm"
                "common/arm"
            ];

            instruction_set = "arm";

            neon = {
                srcs = [
                    "encoder/arm/ihevce_coarse_layer_sad_neon.c"
                    "encoder/arm/ihevce_common_utils_neon.c"
                    "encoder/arm/ihevce_copy_neon.c"
                    "encoder/arm/ihevce_had_compute_neon.c"
                    "encoder/arm/ihevce_hme_utils_neon.c"
                    "encoder/arm/ihevce_itrans_recon_neon.c"
                    "encoder/arm/ihevce_me_neon.c"
                    "encoder/arm/ihevce_sad_compute_neon.c"
                    "encoder/arm/ihevce_scale_by_2_neon.c"
                    "encoder/arm/ihevce_scan_coeffs_neon.c"
                    "encoder/arm/ihevce_ssd_and_sad_calculator_neon.c"
                    "encoder/arm/ihevce_ssd_calculator_neon.c"
                    "encoder/arm/ihevce_subpel_neon.c"
                    "common/arm/ihevc_resi_trans_neon.c"
                    "common/arm/ihevc_resi_trans_neon_32x32.c"
                    "common/arm/ihevc_quant_iquant_ssd_neon_intr.c"
                    "common/arm/ihevc_intra_pred_filters_neon_intr.c"
                    "common/arm/ihevc_weighted_pred_neon_intr.c"
                    "common/arm/ihevc_intra_ref_substitution_a9q.c"
                    "common/arm/ihevc_deblk_chroma_horz.s"
                    "common/arm/ihevc_deblk_chroma_vert.s"
                    "common/arm/ihevc_deblk_luma_horz.s"
                    "common/arm/ihevc_deblk_luma_vert.s"
                    "common/arm/ihevc_inter_pred_chroma_copy.s"
                    "common/arm/ihevc_inter_pred_chroma_copy_w16out.s"
                    "common/arm/ihevc_inter_pred_chroma_horz.s"
                    "common/arm/ihevc_inter_pred_chroma_horz_w16out.s"
                    "common/arm/ihevc_inter_pred_chroma_vert.s"
                    "common/arm/ihevc_inter_pred_chroma_vert_w16inp.s"
                    "common/arm/ihevc_inter_pred_chroma_vert_w16inp_w16out.s"
                    "common/arm/ihevc_inter_pred_chroma_vert_w16out.s"
                    "common/arm/ihevc_inter_pred_filters_luma_horz.s"
                    "common/arm/ihevc_inter_pred_filters_luma_vert.s"
                    "common/arm/ihevc_inter_pred_filters_luma_vert_w16inp.s"
                    "common/arm/ihevc_inter_pred_luma_copy.s"
                    "common/arm/ihevc_inter_pred_luma_copy_w16out.s"
                    "common/arm/ihevc_inter_pred_luma_horz_w16out.s"
                    "common/arm/ihevc_inter_pred_luma_vert_w16inp_w16out.s"
                    "common/arm/ihevc_intra_pred_chroma_dc.s"
                    "common/arm/ihevc_intra_pred_chroma_horz.s"
                    "common/arm/ihevc_intra_pred_chroma_mode2.s"
                    "common/arm/ihevc_intra_pred_chroma_mode_18_34.s"
                    "common/arm/ihevc_intra_pred_chroma_mode_27_to_33.s"
                    "common/arm/ihevc_intra_pred_chroma_mode_3_to_9.s"
                    "common/arm/ihevc_intra_pred_chroma_planar.s"
                    "common/arm/ihevc_intra_pred_chroma_ver.s"
                    "common/arm/ihevc_intra_pred_filters_chroma_mode_11_to_17.s"
                    "common/arm/ihevc_intra_pred_filters_chroma_mode_19_to_25.s"
                    "common/arm/ihevc_intra_pred_filters_luma_mode_11_to_17.s"
                    "common/arm/ihevc_intra_pred_filters_luma_mode_19_to_25.s"
                    "common/arm/ihevc_intra_pred_luma_dc.s"
                    "common/arm/ihevc_intra_pred_luma_horz.s"
                    "common/arm/ihevc_intra_pred_luma_mode2.s"
                    "common/arm/ihevc_intra_pred_luma_mode_18_34.s"
                    "common/arm/ihevc_intra_pred_luma_mode_27_to_33.s"
                    "common/arm/ihevc_intra_pred_luma_mode_3_to_9.s"
                    "common/arm/ihevc_intra_pred_luma_planar.s"
                    "common/arm/ihevc_intra_pred_luma_vert.s"
                    "common/arm/ihevc_itrans_recon_16x16.s"
                    "common/arm/ihevc_itrans_recon_32x32.s"
                    "common/arm/ihevc_itrans_recon_4x4.s"
                    "common/arm/ihevc_itrans_recon_4x4_ttype1.s"
                    "common/arm/ihevc_itrans_recon_8x8.s"
                    "common/arm/ihevc_resi_trans.s"
                    "common/arm/ihevc_resi_trans_32x32_a9q.s"
                    "common/arm/ihevc_mem_fns.s"
                    "common/arm/ihevc_padding.s"
                    "common/arm/ihevc_sao_band_offset_chroma.s"
                    "common/arm/ihevc_sao_band_offset_luma.s"
                    "common/arm/ihevc_sao_edge_offset_class0.s"
                    "common/arm/ihevc_sao_edge_offset_class0_chroma.s"
                    "common/arm/ihevc_sao_edge_offset_class1.s"
                    "common/arm/ihevc_sao_edge_offset_class1_chroma.s"
                    "common/arm/ihevc_sao_edge_offset_class2.s"
                    "common/arm/ihevc_sao_edge_offset_class2_chroma.s"
                    "common/arm/ihevc_sao_edge_offset_class3.s"
                    "common/arm/ihevc_sao_edge_offset_class3_chroma.s"
                    "common/arm/ihevc_weighted_pred_bi_default.s"
                    "common/arm/ihevc_weighted_pred_bi.s"
                    "common/arm/ihevc_weighted_pred_uni.s"
                ];

                cflags = [
                    "-DENABLE_NEON"
                    "-DARM"
                ];
            };
        };

        x86_64 = {
            local_include_dirs = [
                "common/x86"
            ];
        };

        x86 = {
            local_include_dirs = [
                "common/x86"
            ];
        };

    };
    sanitize = {
        integer_overflow = true;
        misc_undefined = ["bounds"];
        #  Enable CFI if this becomes a shared library.
        #  cfi: true,
        diag = {
            integer_overflow = true;
            misc_undefined = ["bounds"];
        };
        blacklist = "libhevc_blacklist.txt";
    };
};

hevcenc = cc_test {
    name = "hevcenc";
    cflags = [
        "-DARM"
        "-fPIC"
        "-Wall"
        "-Werror"
    ];
    srcs = ["test/encoder/main.c"];
    static_libs = ["libhevcenc"];
    sanitize = {
        integer_overflow = true;
        misc_undefined = ["bounds"];
        diag = {
            integer_overflow = true;
            misc_undefined = ["bounds"];
        };
    };
};

in { inherit hevcdec hevcenc libhevcdec libhevcenc; }
