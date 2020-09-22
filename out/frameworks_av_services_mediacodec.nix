{ cc_binary, prebuilt_etc }:
let

mediaswcodec = cc_binary {
    name = "mediaswcodec";
    vendor_available = true;
    min_sdk_version = "29";

    srcs = [
        "main_swcodecservice.cpp"
    ];

    shared_libs = [
        "libavservices_minijail"
        "libbase"
        "libhidlbase"
        "liblog"
        "libmedia_codecserviceregistrant"
    ];

    target = {
        android = {
            product_variables = {
                malloc_not_svelte = {
                    #  Scudo increases memory footprint, so only enable on
                    #  non-svelte devices.
                    shared_libs = ["libc_scudo"];
                };
            };
        };
    };

    header_libs = [
        "libmedia_headers"
    ];

    init_rc = ["mediaswcodec.rc"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-error=deprecated-declarations"
    ];
};

"mediaswcodec.policy" = prebuilt_etc {
    name = "mediaswcodec.policy";
    sub_dir = "seccomp_policy";
    arch = {
        arm = {
            src = "seccomp_policy/mediaswcodec-arm.policy";
        };
        arm64 = {
            src = "seccomp_policy/mediaswcodec-arm64.policy";
        };
        x86 = {
            src = "seccomp_policy/mediaswcodec-x86.policy";
        };
        x86_64 = {
            src = "seccomp_policy/mediaswcodec-x86_64.policy";
        };
    };
    required = [
        "crash_dump.policy"
        "code_coverage.policy"
    ];
};

#  media.codec -- the one that handles vendor & HW codecs

"android.hardware.media.omx@1.0-service" = cc_binary {
    name = "android.hardware.media.omx@1.0-service";
    relative_install_path = "hw";
    vendor = true;

    srcs = [
        "main_codecservice.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libutils"
        "liblog"
        "libbase"
        "libavservices_minijail"
        "libcutils"
        "libhidlbase"
        "libstagefright_omx"
        "libstagefright_xmlparser"
        "android.hardware.media.omx@1.0"
        "android.hidl.memory@1.0"
    ];

    runtime_libs = [
        "libstagefright_soft_aacdec"
        "libstagefright_soft_aacenc"
        "libstagefright_soft_amrdec"
        "libstagefright_soft_amrnbenc"
        "libstagefright_soft_amrwbenc"
        "libstagefright_soft_avcdec"
        "libstagefright_soft_avcenc"
        "libstagefright_soft_flacdec"
        "libstagefright_soft_flacenc"
        "libstagefright_soft_g711dec"
        "libstagefright_soft_gsmdec"
        "libstagefright_soft_hevcdec"
        "libstagefright_soft_mp3dec"
        "libstagefright_soft_mpeg2dec"
        "libstagefright_soft_mpeg4dec"
        "libstagefright_soft_mpeg4enc"
        "libstagefright_soft_opusdec"
        "libstagefright_soft_rawdec"
        "libstagefright_soft_vorbisdec"
        "libstagefright_soft_vpxdec"
        "libstagefright_soft_vpxenc"
        "libstagefright_softomx_plugin"
    ];

    #  OMX interfaces force this to stay in 32-bit mode;
    compile_multilib = "32";

    init_rc = ["android.hardware.media.omx@1.0-service.rc"];

    required = [
        "mediacodec.policy"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-error=deprecated-declarations"
    ];
};

"mediacodec.policy" = prebuilt_etc {
    name = "mediacodec.policy";
    sub_dir = "seccomp_policy";
    arch = {
        arm = {
            src = "seccomp_policy/mediacodec-arm.policy";
        };
        arm64 = {
            src = "seccomp_policy/mediacodec-arm64.policy";
        };
        x86 = {
            src = "seccomp_policy/mediacodec-x86.policy";
        };
        x86_64 = {
            src = "seccomp_policy/mediacodec-x86_64.policy";
        };
    };
    required = [
        "crash_dump.policy"
        "code_coverage.policy"
    ];
};

in { inherit "android.hardware.media.omx@1.0-service" "mediacodec.policy" "mediaswcodec.policy" mediaswcodec; }
