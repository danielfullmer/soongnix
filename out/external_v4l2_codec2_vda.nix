{ cc_library_shared }:
let

libv4l2_codec2_vda = cc_library_shared {
    name = "libv4l2_codec2_vda";
    srcs = [
        "bit_reader.cc"
        "bit_reader_core.cc"
        "bitstream_buffer.cc"
        "h264_bit_reader.cc"
        "h264_decoder.cc"
        "h264_dpb.cc"
        "h264_parser.cc"
        "native_pixmap_handle.cc"
        "picture.cc"
        "ranges.cc"
        "shared_memory_region.cc"
        "v4l2_device.cc"
        "v4l2_video_decode_accelerator.cc"
        "video_codecs.cc"
        "video_decode_accelerator.cc"
        "vp8_bool_decoder.cc"
        "vp8_decoder.cc"
        "vp8_parser.cc"
        "vp8_picture.cc"
        "vp9_bool_decoder.cc"
        "vp9_compressed_header_parser.cc"
        "vp9_decoder.cc"
        "vp9_parser.cc"
        "vp9_picture.cc"
        "vp9_raw_bits_reader.cc"
        "vp9_uncompressed_header_parser.cc"
    ];

    shared_libs = ["libchrome"];
    #  -Wno-unused-parameter is needed for libchrome/base codes
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-implicit-fallthrough" #  at h264_decoder.cc:1374
    ];
    clang = true;
    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };

    ldflags = [
        "-Wl"
        "-Bsymbolic"
    ];
    export_include_dirs = ["."];
};

in { inherit libv4l2_codec2_vda; }
