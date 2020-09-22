{ cc_fuzz }:
let

libyuv_mjpeg_dec_fuzz = cc_fuzz {
    name = "libyuv_mjpeg_dec_fuzz";
    host_supported = false;
    srcs = [
        "mjpeg_dec_fuzz.cc"
    ];
    static_libs = [
        "libyuv"
    ];

    shared_libs = [
        "libjpeg"
    ];
};

in { inherit libyuv_mjpeg_dec_fuzz; }
