{ cc_fuzz, cc_library_static }:
let

#  THIS FILE IS AUTOGENERATED, DO NOT EDIT
#  Generated from Android.bp.in, run ./generate_config.sh to regenerate

aom_av1_common_intrin_avx2 = [
    "libaom/av1/common/cdef_block_avx2.c"
    "libaom/av1/common/x86/av1_inv_txfm_avx2.c"
    "libaom/av1/common/x86/cfl_avx2.c"
    "libaom/av1/common/x86/convolve_2d_avx2.c"
    "libaom/av1/common/x86/convolve_avx2.c"
    "libaom/av1/common/x86/highbd_convolve_2d_avx2.c"
    "libaom/av1/common/x86/highbd_inv_txfm_avx2.c"
    "libaom/av1/common/x86/highbd_jnt_convolve_avx2.c"
    "libaom/av1/common/x86/highbd_wiener_convolve_avx2.c"
    "libaom/av1/common/x86/jnt_convolve_avx2.c"
    "libaom/av1/common/x86/reconinter_avx2.c"
    "libaom/av1/common/x86/selfguided_avx2.c"
    "libaom/av1/common/x86/wiener_convolve_avx2.c"
];

aom_av1_common_intrin_neon = [
    "libaom/av1/common/arm/av1_txfm_neon.c"
    "libaom/av1/common/arm/cfl_neon.c"
    "libaom/av1/common/arm/convolve_neon.c"
    "libaom/av1/common/arm/jnt_convolve_neon.c"
    "libaom/av1/common/arm/blend_a64_hmask_neon.c"
    "libaom/av1/common/arm/blend_a64_vmask_neon.c"
    "libaom/av1/common/arm/reconinter_neon.c"
    "libaom/av1/common/arm/wiener_convolve_neon.c"
    "libaom/av1/common/arm/selfguided_neon.c"
    "libaom/av1/common/arm/av1_inv_txfm_neon.c"
    "libaom/av1/common/arm/warp_plane_neon.c"
    "libaom/av1/common/cdef_block_neon.c"
];

aom_av1_common_intrin_sse2 = [
    "libaom/av1/common/cdef_block_sse2.c"
    "libaom/av1/common/x86/cfl_sse2.c"
    "libaom/av1/common/x86/convolve_2d_sse2.c"
    "libaom/av1/common/x86/convolve_sse2.c"
    "libaom/av1/common/x86/highbd_convolve_2d_sse2.c"
    "libaom/av1/common/x86/jnt_convolve_sse2.c"
    "libaom/av1/common/x86/wiener_convolve_sse2.c"
];

aom_av1_common_intrin_sse4_1 = [
    "libaom/av1/common/cdef_block_sse4.c"
    "libaom/av1/common/x86/av1_convolve_horiz_rs_sse4.c"
    "libaom/av1/common/x86/av1_convolve_scale_sse4.c"
    "libaom/av1/common/x86/av1_highbd_convolve_sse4.c"
    "libaom/av1/common/x86/av1_txfm_sse4.c"
    "libaom/av1/common/x86/filterintra_sse4.c"
    "libaom/av1/common/x86/highbd_convolve_2d_sse4.c"
    "libaom/av1/common/x86/highbd_inv_txfm_sse4.c"
    "libaom/av1/common/x86/highbd_jnt_convolve_sse4.c"
    "libaom/av1/common/x86/highbd_warp_plane_sse4.c"
    "libaom/av1/common/x86/intra_edge_sse4.c"
    "libaom/av1/common/x86/reconinter_sse4.c"
    "libaom/av1/common/x86/selfguided_sse4.c"
    "libaom/av1/common/x86/warp_plane_sse4.c"
];

aom_av1_common_intrin_ssse3 = [
    "libaom/av1/common/cdef_block_ssse3.c"
    "libaom/av1/common/x86/av1_inv_txfm_ssse3.c"
    "libaom/av1/common/x86/cfl_ssse3.c"
    "libaom/av1/common/x86/highbd_convolve_2d_ssse3.c"
    "libaom/av1/common/x86/highbd_wiener_convolve_ssse3.c"
    "libaom/av1/common/x86/jnt_convolve_ssse3.c"
    "libaom/av1/common/x86/reconinter_ssse3.c"
];

aom_av1_common_intrin_vsx = [
    "libaom/av1/common/ppc/cfl_ppc.c"
];

aom_av1_common_sources = [
    "libaom/av1/common/alloccommon.c"
    "libaom/av1/common/av1_inv_txfm1d.c"
    "libaom/av1/common/av1_inv_txfm2d.c"
    "libaom/av1/common/av1_loopfilter.c"
    "libaom/av1/common/av1_txfm.c"
    "libaom/av1/common/blockd.c"
    "libaom/av1/common/cdef.c"
    "libaom/av1/common/cdef_block.c"
    "libaom/av1/common/cfl.c"
    "libaom/av1/common/convolve.c"
    "libaom/av1/common/debugmodes.c"
    "libaom/av1/common/entropy.c"
    "libaom/av1/common/entropymode.c"
    "libaom/av1/common/entropymv.c"
    "libaom/av1/common/frame_buffers.c"
    "libaom/av1/common/idct.c"
    "libaom/av1/common/mvref_common.c"
    "libaom/av1/common/obu_util.c"
    "libaom/av1/common/odintrin.c"
    "libaom/av1/common/pred_common.c"
    "libaom/av1/common/quant_common.c"
    "libaom/av1/common/reconinter.c"
    "libaom/av1/common/reconintra.c"
    "libaom/av1/common/resize.c"
    "libaom/av1/common/restoration.c"
    "libaom/av1/common/scale.c"
    "libaom/av1/common/scan.c"
    "libaom/av1/common/seg_common.c"
    "libaom/av1/common/thread_common.c"
    "libaom/av1/common/tile_common.c"
    "libaom/av1/common/timing.c"
    "libaom/av1/common/txb_common.c"
    "libaom/av1/common/warped_motion.c"
];

aom_av1_decoder_sources = [
    "libaom/av1/av1_dx_iface.c"
    "libaom/av1/decoder/decodeframe.c"
    "libaom/av1/decoder/decodemv.c"
    "libaom/av1/decoder/decoder.c"
    "libaom/av1/decoder/decodetxb.c"
    "libaom/av1/decoder/detokenize.c"
    "libaom/av1/decoder/obu.c"
];

aom_av1_encoder_asm_sse2 = [
    "libaom/av1/encoder/x86/dct_sse2.asm"
    "libaom/av1/encoder/x86/error_sse2.asm"
];

aom_av1_encoder_asm_ssse3_x86_64 = [
    "libaom/av1/encoder/x86/av1_quantize_ssse3_x86_64.asm"
];

aom_av1_encoder_intrin_avx2 = [
    "libaom/av1/encoder/x86/av1_quantize_avx2.c"
    "libaom/av1/encoder/x86/av1_highbd_quantize_avx2.c"
    "libaom/av1/encoder/x86/corner_match_avx2.c"
    "libaom/av1/encoder/x86/error_intrin_avx2.c"
    "libaom/av1/encoder/x86/highbd_block_error_intrin_avx2.c"
    "libaom/av1/encoder/x86/av1_fwd_txfm2d_avx2.c"
    "libaom/av1/encoder/x86/highbd_fwd_txfm_avx2.c"
    "libaom/av1/encoder/x86/wedge_utils_avx2.c"
    "libaom/av1/encoder/x86/encodetxb_avx2.c"
    "libaom/av1/encoder/x86/rdopt_avx2.c"
    "libaom/av1/encoder/x86/pickrst_avx2.c"
];

aom_av1_encoder_intrin_msa = [
    "libaom/av1/encoder/mips/msa/error_msa.c"
    "libaom/av1/encoder/mips/msa/fdct4x4_msa.c"
    "libaom/av1/encoder/mips/msa/temporal_filter_msa.c"
];

aom_av1_encoder_intrin_neon = [
    "libaom/av1/encoder/arm/neon/quantize_neon.c"
];

aom_av1_encoder_intrin_sse2 = [
    "libaom/av1/encoder/x86/av1_fwd_txfm_sse2.c"
    "libaom/av1/encoder/x86/av1_quantize_sse2.c"
    "libaom/av1/encoder/x86/encodetxb_sse2.c"
    "libaom/av1/encoder/x86/highbd_block_error_intrin_sse2.c"
    "libaom/av1/encoder/x86/wedge_utils_sse2.c"
];

aom_av1_encoder_intrin_sse3 = [
    "libaom/av1/encoder/x86/ml_sse3.c"
];

aom_av1_encoder_intrin_sse4_1 = [
    "libaom/av1/encoder/x86/av1_fwd_txfm1d_sse4.c"
    "libaom/av1/encoder/x86/av1_fwd_txfm2d_sse4.c"
    "libaom/av1/encoder/x86/av1_highbd_quantize_sse4.c"
    "libaom/av1/encoder/x86/corner_match_sse4.c"
    "libaom/av1/encoder/x86/encodetxb_sse4.c"
    "libaom/av1/encoder/x86/highbd_fwd_txfm_sse4.c"
    "libaom/av1/encoder/x86/rdopt_sse4.c"
    "libaom/av1/encoder/x86/temporal_filter_sse4.c"
    "libaom/av1/encoder/x86/highbd_temporal_filter_sse4.c"
    "libaom/av1/encoder/x86/pickrst_sse4.c"
];

aom_av1_encoder_intrin_sse4_2 = [
    "libaom/av1/encoder/x86/hash_sse42.c"
];

aom_av1_encoder_sources = [
    "libaom/av1/av1_cx_iface.c"
    "libaom/av1/encoder/aq_complexity.c"
    "libaom/av1/encoder/aq_cyclicrefresh.c"
    "libaom/av1/encoder/aq_variance.c"
    "libaom/av1/encoder/av1_fwd_txfm1d.c"
    "libaom/av1/encoder/av1_fwd_txfm2d.c"
    "libaom/av1/encoder/av1_multi_thread.c"
    "libaom/av1/encoder/av1_quantize.c"
    "libaom/av1/encoder/bitstream.c"
    "libaom/av1/encoder/context_tree.c"
    "libaom/av1/encoder/corner_detect.c"
    "libaom/av1/encoder/corner_match.c"
    "libaom/av1/encoder/cost.c"
    "libaom/av1/encoder/encodeframe.c"
    "libaom/av1/encoder/encodemb.c"
    "libaom/av1/encoder/encodemv.c"
    "libaom/av1/encoder/encode_strategy.c"
    "libaom/av1/encoder/encoder.c"
    "libaom/av1/encoder/encodetxb.c"
    "libaom/av1/encoder/ethread.c"
    "libaom/av1/encoder/extend.c"
    "libaom/av1/encoder/firstpass.c"
    "libaom/av1/encoder/global_motion.c"
    "libaom/av1/encoder/gop_structure.c"
    "libaom/av1/encoder/hash.c"
    "libaom/av1/encoder/hash_motion.c"
    "libaom/av1/encoder/hybrid_fwd_txfm.c"
    "libaom/av1/encoder/level.c"
    "libaom/av1/encoder/lookahead.c"
    "libaom/av1/encoder/mbgraph.c"
    "libaom/av1/encoder/mcomp.c"
    "libaom/av1/encoder/ml.c"
    "libaom/av1/encoder/palette.c"
    "libaom/av1/encoder/partition_strategy.c"
    "libaom/av1/encoder/pass2_strategy.c"
    "libaom/av1/encoder/pickcdef.c"
    "libaom/av1/encoder/picklpf.c"
    "libaom/av1/encoder/pickrst.c"
    "libaom/av1/encoder/ransac.c"
    "libaom/av1/encoder/ratectrl.c"
    "libaom/av1/encoder/rd.c"
    "libaom/av1/encoder/rdopt.c"
    "libaom/av1/encoder/reconinter_enc.c"
    "libaom/av1/encoder/segmentation.c"
    "libaom/av1/encoder/speed_features.c"
    "libaom/av1/encoder/temporal_filter.c"
    "libaom/av1/encoder/tokenize.c"
    "libaom/av1/encoder/tpl_model.c"
    "libaom/av1/encoder/wedge_utils.c"
    "libaom/av1/encoder/var_based_part.c"
    "libaom/third_party/fastfeat/fast.c"
    "libaom/third_party/fastfeat/fast_9.c"
    "libaom/third_party/fastfeat/nonmax.c"
    "libaom/third_party/vector/vector.c"
    "libaom/av1/encoder/dwt.c"
];

aom_dsp_common_asm_sse2 = [
    "libaom/aom_dsp/x86/aom_convolve_copy_sse2.asm"
    "libaom/aom_dsp/x86/aom_high_subpixel_8t_sse2.asm"
    "libaom/aom_dsp/x86/aom_high_subpixel_bilinear_sse2.asm"
    "libaom/aom_dsp/x86/aom_subpixel_8t_sse2.asm"
    "libaom/aom_dsp/x86/aom_subpixel_bilinear_sse2.asm"
    "libaom/aom_dsp/x86/highbd_intrapred_asm_sse2.asm"
    "libaom/aom_dsp/x86/intrapred_asm_sse2.asm"
    "libaom/aom_dsp/x86/inv_wht_sse2.asm"
];

aom_dsp_common_asm_ssse3 = [
    "libaom/aom_dsp/x86/aom_subpixel_8t_ssse3.asm"
    "libaom/aom_dsp/x86/aom_subpixel_bilinear_ssse3.asm"
];

aom_dsp_common_intrin_avx2 = [
    "libaom/aom_dsp/x86/aom_subpixel_8t_intrin_avx2.c"
    "libaom/aom_dsp/x86/fft_avx2.c"
    "libaom/aom_dsp/x86/highbd_convolve_avx2.c"
    "libaom/aom_dsp/x86/highbd_loopfilter_avx2.c"
    "libaom/aom_dsp/x86/intrapred_avx2.c"
    "libaom/aom_dsp/x86/blend_a64_mask_avx2.c"
    "libaom/aom_dsp/x86/avg_intrin_avx2.c"
];

aom_dsp_common_intrin_dspr2 = [
    "libaom/aom_dsp/mips/common_dspr2.c"
    "libaom/aom_dsp/mips/convolve2_dspr2.c"
    "libaom/aom_dsp/mips/convolve2_horiz_dspr2.c"
    "libaom/aom_dsp/mips/convolve2_vert_dspr2.c"
    "libaom/aom_dsp/mips/convolve8_dspr2.c"
    "libaom/aom_dsp/mips/convolve8_horiz_dspr2.c"
    "libaom/aom_dsp/mips/convolve8_vert_dspr2.c"
    "libaom/aom_dsp/mips/intrapred16_dspr2.c"
    "libaom/aom_dsp/mips/intrapred4_dspr2.c"
    "libaom/aom_dsp/mips/intrapred8_dspr2.c"
];

aom_dsp_common_intrin_msa = [
    "libaom/aom_dsp/mips/aom_convolve8_horiz_msa.c"
    "libaom/aom_dsp/mips/aom_convolve8_vert_msa.c"
    "libaom/aom_dsp/mips/aom_convolve_copy_msa.c"
    "libaom/aom_dsp/mips/intrapred_msa.c"
];

aom_dsp_common_intrin_neon = [
    "libaom/aom_dsp/arm/fwd_txfm_neon.c"
    "libaom/aom_dsp/arm/loopfilter_neon.c"
    "libaom/aom_dsp/arm/intrapred_neon.c"
    "libaom/aom_dsp/arm/subtract_neon.c"
    "libaom/aom_dsp/arm/blend_a64_mask_neon.c"
];

aom_dsp_common_intrin_sse2 = [
    "libaom/aom_dsp/x86/aom_subpixel_8t_intrin_sse2.c"
    "libaom/aom_dsp/x86/aom_asm_stubs.c"
    "libaom/aom_dsp/x86/fft_sse2.c"
    "libaom/aom_dsp/x86/highbd_convolve_sse2.c"
    "libaom/aom_dsp/x86/highbd_intrapred_sse2.c"
    "libaom/aom_dsp/x86/highbd_loopfilter_sse2.c"
    "libaom/aom_dsp/x86/intrapred_sse2.c"
    "libaom/aom_dsp/x86/loopfilter_sse2.c"
    "libaom/aom_dsp/x86/avg_intrin_sse2.c"
];

aom_dsp_common_intrin_sse4_1 = [
    "libaom/aom_dsp/x86/blend_a64_hmask_sse4.c"
    "libaom/aom_dsp/x86/blend_a64_mask_sse4.c"
    "libaom/aom_dsp/x86/blend_a64_vmask_sse4.c"
];

aom_dsp_common_intrin_ssse3 = [
    "libaom/aom_dsp/x86/aom_subpixel_8t_intrin_ssse3.c"
    "libaom/aom_dsp/x86/highbd_convolve_ssse3.c"
    "libaom/aom_dsp/x86/intrapred_ssse3.c"
];

aom_dsp_common_sources = [
    "libaom/aom_dsp/aom_convolve.c"
    "libaom/aom_dsp/bitreader_buffer.c"
    "libaom/aom_dsp/bitwriter_buffer.c"
    "libaom/aom_dsp/blend_a64_hmask.c"
    "libaom/aom_dsp/blend_a64_mask.c"
    "libaom/aom_dsp/blend_a64_vmask.c"
    "libaom/aom_dsp/entcode.c"
    "libaom/aom_dsp/fft.c"
    "libaom/aom_dsp/intrapred.c"
    "libaom/aom_dsp/loopfilter.c"
    "libaom/aom_dsp/subtract.c"
    "libaom/aom_dsp/avg.c"
];

aom_dsp_decoder_sources = [
    "libaom/aom_dsp/binary_codes_reader.c"
    "libaom/aom_dsp/daalaboolreader.c"
    "libaom/aom_dsp/entdec.c"
    "libaom/aom_dsp/grain_synthesis.c"
];

aom_encoder_stats_sources = [
    "libaom/stats/aomstats.c"
    "libaom/stats/rate_hist.c"
];

aom_mem_sources = [
    "libaom/aom_mem/aom_mem.c"
];

aom_ports_asm_x86 = [
    "libaom/aom_ports/emms.asm"
];

aom_rtcd_sources = [
    "libaom/aom_dsp/aom_dsp_rtcd.c"
    "libaom/aom_scale/aom_scale_rtcd.c"
    "libaom/av1/common/av1_rtcd.c"
];

aom_scale_intrin_dspr2 = [
    "libaom/aom_scale/mips/dspr2/yv12extend_dspr2.c"
];

aom_scale_sources = [
    "libaom/aom_scale/generic/aom_scale.c"
    "libaom/aom_scale/generic/gen_scalers.c"
    "libaom/aom_scale/generic/yv12config.c"
    "libaom/aom_scale/generic/yv12extend.c"
];

aom_sources = [
    "libaom/aom/src/aom_codec.c"
    "libaom/aom/src/aom_decoder.c"
    "libaom/aom/src/aom_encoder.c"
    "libaom/aom/src/aom_image.c"
    "libaom/aom/src/aom_integer.c"
];

aom_util_sources = [
    "libaom/aom_util/aom_thread.c"
    "libaom/aom_util/debug_util.c"
];

aom_webm_decoder_sources = [
    "libaom/common/webmdec.cc"
];

aom_webm_encoder_sources = [
    "libaom/common/webmenc.cc"
];

aom_rtcd_sources_gen = [
];

aom_sources_gen = [
    "libaom/config/aom_config.c"
];

aom_version_sources_gen = [
];
libaom = cc_library_static {
    name = "libaom";
    host_supported = true;
    vendor_available = true;
    cflags = [
        "-O3"
    ];

    export_include_dirs = [
        "libaom"
    ];

    arch = {
        arm64 = {
            local_include_dirs = [
                "config/"
                "config/arm64/"
            ];
            srcs = aom_av1_common_sources ++
                aom_av1_decoder_sources ++
                aom_dsp_common_sources ++
                aom_dsp_decoder_sources ++
                aom_mem_sources ++
                ["libaom/aom_ports/arm_cpudetect.c"] ++
                aom_rtcd_sources ++
                aom_scale_sources ++
                aom_sources ++
                aom_util_sources ++
                aom_av1_common_intrin_neon ++
                aom_dsp_common_intrin_neon;
        };

        #  configured to require the neon unit
        arm = {
            neon = {
                local_include_dirs = [
                    "config/"
                    "config/arm/"
                ];
                srcs = aom_av1_common_sources ++
                    aom_av1_decoder_sources ++
                    aom_dsp_common_sources ++
                    aom_dsp_decoder_sources ++
                    aom_mem_sources ++
                    aom_rtcd_sources ++
                    ["libaom/aom_ports/arm_cpudetect.c"] ++
                    aom_scale_sources ++
                    aom_sources ++
                    aom_util_sources ++
                    aom_av1_common_intrin_neon ++
                    aom_dsp_common_intrin_neon;
            };
        };

        x86_64 = {
            local_include_dirs = [
                "config/"
                "config/x86_64/"
            ];
            cflags = [
                "-mssse3"
            ];
            srcs = aom_av1_common_sources ++
                aom_av1_decoder_sources ++
                aom_dsp_common_sources ++
                aom_dsp_decoder_sources ++
                aom_mem_sources ++
                aom_rtcd_sources ++
                aom_scale_sources ++
                aom_sources ++
                aom_util_sources ++
                aom_dsp_common_asm_sse2 ++
                aom_dsp_common_asm_ssse3 ++
                aom_ports_asm_x86 ++
                aom_av1_common_intrin_sse2 ++
                aom_dsp_common_intrin_sse2 ++
                aom_av1_common_intrin_ssse3 ++
                aom_dsp_common_intrin_ssse3;
        };

        x86 = {
            local_include_dirs = [
                "config/"
                "config/x86/"
            ];
            cflags = [
                "-mssse3"
            ];
            srcs = aom_av1_common_sources ++
                aom_av1_decoder_sources ++
                aom_dsp_common_sources ++
                aom_dsp_decoder_sources ++
                aom_mem_sources ++
                aom_rtcd_sources ++
                aom_scale_sources ++
                aom_sources ++
                aom_util_sources ++
                aom_dsp_common_asm_sse2 ++
                aom_dsp_common_asm_ssse3 ++
                aom_ports_asm_x86 ++
                aom_av1_common_intrin_sse2 ++
                aom_dsp_common_intrin_sse2 ++
                aom_av1_common_intrin_ssse3 ++
                aom_dsp_common_intrin_ssse3;
        };

    };

    sanitize = {
        blacklist = "libaom_blacklist.txt";
    };

};

av1_dec_fuzzer = cc_fuzz {
    name = "av1_dec_fuzzer";
    host_supported = true;
    srcs = [
        "libaom/examples/av1_dec_fuzzer.cc"
    ];
    arch = {
        arm = {
            neon = {
                local_include_dirs = [
                    "config/"
                    "config/arm/"
                ];
            };
        };

        arm64 = {
            local_include_dirs = [
                "config/"
                "config/arm64/"
            ];
        };

        x86 = {
            local_include_dirs = [
                "config/"
                "config/x86/"
            ];
        };

        x86_64 = {
            local_include_dirs = [
                "config/"
                "config/x86_64/"
            ];
        };
    };
    static_libs = [
        "libaom"
    ];
};

in { inherit av1_dec_fuzzer libaom; }
