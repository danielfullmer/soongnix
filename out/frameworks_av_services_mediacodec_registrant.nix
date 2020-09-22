{ cc_library_shared }:
let

libmedia_codecserviceregistrant = cc_library_shared {
    name = "libmedia_codecserviceregistrant";
    vendor_available = true;
    srcs = [
        "CodecServiceRegistrant.cpp"
    ];

    header_libs = [
        "libmedia_headers"
    ];

    defaults = [
        "libcodec2-hidl-defaults"
    ];
    shared_libs = [
        "libbase"
        "libcodec2_hidl@1.0"
        "libcodec2_vndk"
        "libhidlbase"
        "libutils"
    ];

    #  Codecs
    runtime_libs = [
        "libcodec2_soft_avcdec"
        "libcodec2_soft_avcenc"
        "libcodec2_soft_aacdec"
        "libcodec2_soft_aacenc"
        "libcodec2_soft_amrnbdec"
        "libcodec2_soft_amrnbenc"
        "libcodec2_soft_amrwbdec"
        "libcodec2_soft_amrwbenc"
        "libcodec2_soft_hevcdec"
        "libcodec2_soft_hevcenc"
        "libcodec2_soft_g711alawdec"
        "libcodec2_soft_g711mlawdec"
        "libcodec2_soft_mpeg2dec"
        "libcodec2_soft_h263dec"
        "libcodec2_soft_h263enc"
        "libcodec2_soft_mpeg4dec"
        "libcodec2_soft_mpeg4enc"
        "libcodec2_soft_mp3dec"
        "libcodec2_soft_vorbisdec"
        "libcodec2_soft_opusdec"
        "libcodec2_soft_opusenc"
        "libcodec2_soft_vp8dec"
        "libcodec2_soft_vp9dec"
        #  "libcodec2_soft_av1dec_aom",  // replaced by the gav1 implementation
        "libcodec2_soft_av1dec_gav1"
        "libcodec2_soft_vp8enc"
        "libcodec2_soft_vp9enc"
        "libcodec2_soft_rawdec"
        "libcodec2_soft_flacdec"
        "libcodec2_soft_flacenc"
        "libcodec2_soft_gsmdec"
    ];
};

in { inherit libmedia_codecserviceregistrant; }
