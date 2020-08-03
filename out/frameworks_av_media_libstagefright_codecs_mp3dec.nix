{ cc_library_shared, cc_library_static, cc_test }:
let

libstagefright_mp3dec = cc_library_static {
    name = "libstagefright_mp3dec";
    vendor_available = true;

    srcs = [
        "src/pvmp3_normalize.cpp"
        "src/pvmp3_alias_reduction.cpp"
        "src/pvmp3_crc.cpp"
        "src/pvmp3_decode_header.cpp"
        "src/pvmp3_decode_huff_cw.cpp"
        "src/pvmp3_getbits.cpp"
        "src/pvmp3_dequantize_sample.cpp"
        "src/pvmp3_framedecoder.cpp"
        "src/pvmp3_get_main_data_size.cpp"
        "src/pvmp3_get_side_info.cpp"
        "src/pvmp3_get_scale_factors.cpp"
        "src/pvmp3_mpeg2_get_scale_data.cpp"
        "src/pvmp3_mpeg2_get_scale_factors.cpp"
        "src/pvmp3_mpeg2_stereo_proc.cpp"
        "src/pvmp3_huffman_decoding.cpp"
        "src/pvmp3_huffman_parsing.cpp"
        "src/pvmp3_tables.cpp"
        "src/pvmp3_imdct_synth.cpp"
        "src/pvmp3_mdct_6.cpp"
        "src/pvmp3_dct_6.cpp"
        "src/pvmp3_poly_phase_synthesis.cpp"
        "src/pvmp3_equalizer.cpp"
        "src/pvmp3_seek_synch.cpp"
        "src/pvmp3_stereo_proc.cpp"
        "src/pvmp3_reorder.cpp"

        "src/pvmp3_polyphase_filter_window.cpp"
        "src/pvmp3_mdct_18.cpp"
        "src/pvmp3_dct_9.cpp"
        "src/pvmp3_dct_16.cpp"
    ];

    arch = {
        arm = {
            exclude_srcs = [
                "src/pvmp3_polyphase_filter_window.cpp"
                "src/pvmp3_mdct_18.cpp"
                "src/pvmp3_dct_9.cpp"
                "src/pvmp3_dct_16.cpp"
            ];
            srcs = [
                "src/asm/pvmp3_polyphase_filter_window_gcc.s"
                "src/asm/pvmp3_mdct_18_gcc.s"
                "src/asm/pvmp3_dct_9_gcc.s"
                "src/asm/pvmp3_dct_16_gcc.s"
            ];

            instruction_set = "arm";
        };
    };

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    include_dirs = ["frameworks/av/media/libstagefright/include"];

    export_include_dirs = [
        "include"
        "src"
    ];

    cflags = [
        "-DOSCL_UNUSED_ARG(x)=(void)(x)"
        "-Werror"
    ];
};

# ###############################################################################

libstagefright_soft_mp3dec = cc_library_shared {
    name = "libstagefright_soft_mp3dec";
    defaults = ["libstagefright_softomx-defaults"];

    srcs = ["SoftMP3.cpp"];

    local_include_dirs = [
        "src"
        "include"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    static_libs = ["libstagefright_mp3dec"];
};

# ###############################################################################
libstagefright_mp3dec_test = cc_test {
    name = "libstagefright_mp3dec_test";
    gtest = false;

    srcs = [
        "test/mp3dec_test.cpp"
        "test/mp3reader.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = [
        "src"
        "include"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    static_libs = [
        "libstagefright_mp3dec"
        "libsndfile"
    ];

    shared_libs = ["libaudioutils"];
};

in { inherit libstagefright_mp3dec libstagefright_mp3dec_test libstagefright_soft_mp3dec; }
