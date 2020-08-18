{ cc_binary, cc_library_shared }:
let

"hardware.google.media.c2@1.0-service" = cc_binary {
    name = "hardware.google.media.c2@1.0-service";
    defaults = ["hidl_defaults"];
    soc_specific = true;
    relative_install_path = "hw";
    srcs = [
        "vendor.cpp"
    ];

    init_rc = ["hardware.google.media.c2@1.0-service.rc"];

    shared_libs = [
        "android.hardware.media.omx@1.0"
        "hardware.google.media.c2@1.0"
        "libavservices_minijail_vendor"
        "libbinder"
        "libcodec2_hidl_utils@1.0"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libstagefright_codec2_vndk"
        "libstagefright_omx"
        "libstagefright_xmlparser"
        "libutils"
    ];

    arch = {
        arm = {
            required = ["codec2.vendor.base.policy"];
        };
        x86 = {
            required = ["codec2.vendor.base.policy"];
        };
    };

    compile_multilib = "32";
};

libcodec2_serviceregistrant = cc_library_shared {
    name = "libcodec2_serviceregistrant";
    #  need vendor version for update packaging, system version may have more dependencies
    vendor_available = true;
    srcs = [
        "C2SoftwareCodecServiceRegistrant.cpp"
    ];

    header_libs = [
        "libmedia_headers"
    ];

    shared_libs = [
        "hardware.google.media.c2@1.0"
        "liblog"
        "libcodec2_hidl_utils@1.0"
        "libstagefright_codec2_vndk"
        "libutils"
    ];

    #  Codecs
    runtime_libs = [
        "libstagefright_soft_c2avcdec"
        "libstagefright_soft_c2avcenc"
        "libstagefright_soft_c2aacdec"
        "libstagefright_soft_c2aacenc"
        "libstagefright_soft_c2amrnbdec"
        "libstagefright_soft_c2amrnbenc"
        "libstagefright_soft_c2amrwbdec"
        "libstagefright_soft_c2amrwbenc"
        "libstagefright_soft_c2hevcdec"
        "libstagefright_soft_c2g711alawdec"
        "libstagefright_soft_c2g711mlawdec"
        "libstagefright_soft_c2mpeg2dec"
        "libstagefright_soft_c2h263dec"
        "libstagefright_soft_c2h263enc"
        "libstagefright_soft_c2mpeg4dec"
        "libstagefright_soft_c2mpeg4enc"
        "libstagefright_soft_c2mp3dec"
        "libstagefright_soft_c2vorbisdec"
        "libstagefright_soft_c2opusdec"
        "libstagefright_soft_c2vp8dec"
        "libstagefright_soft_c2vp9dec"
        "libstagefright_soft_c2vp8enc"
        "libstagefright_soft_c2vp9enc"
        "libstagefright_soft_c2rawdec"
        "libstagefright_soft_c2flacdec"
        "libstagefright_soft_c2flacenc"
        "libstagefright_soft_c2gsmdec"
        "libstagefright_soft_c2xaacdec"
    ];

    compile_multilib = "32";
};

in { inherit "hardware.google.media.c2@1.0-service" libcodec2_serviceregistrant; }
