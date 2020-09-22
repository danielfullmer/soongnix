{ cc_library, cc_library_static, cc_test }:
let

libyuv = cc_library {
    name = "libyuv";
    vendor_available = true;
    host_supported = true;
    vndk = {
        enabled = true;
    };

    srcs = [
        "source/compare.cc"
        "source/compare_common.cc"
        "source/compare_gcc.cc"
        "source/compare_neon.cc"
        "source/compare_neon64.cc"
        "source/compare_mmi.cc"
        "source/compare_msa.cc"
        "source/convert.cc"
        "source/convert_argb.cc"
        "source/convert_from.cc"
        "source/convert_from_argb.cc"
        "source/convert_to_argb.cc"
        "source/convert_to_i420.cc"
        "source/cpu_id.cc"
        "source/planar_functions.cc"
        "source/rotate.cc"
        "source/rotate_any.cc"
        "source/rotate_argb.cc"
        "source/rotate_common.cc"
        "source/rotate_gcc.cc"
        "source/rotate_mmi.cc"
        "source/rotate_msa.cc"
        "source/rotate_neon.cc"
        "source/rotate_neon64.cc"
        "source/row_any.cc"
        "source/row_common.cc"
        "source/row_gcc.cc"
        "source/row_mmi.cc"
        "source/row_msa.cc"
        "source/row_neon.cc"
        "source/row_neon64.cc"
        "source/scale.cc"
        "source/scale_any.cc"
        "source/scale_argb.cc"
        "source/scale_common.cc"
        "source/scale_gcc.cc"
        "source/scale_mmi.cc"
        "source/scale_msa.cc"
        "source/scale_neon.cc"
        "source/scale_neon64.cc"
        "source/video_common.cc"
        "source/convert_jpeg.cc"
        "source/mjpeg_decoder.cc"
        "source/mjpeg_validate.cc"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-fexceptions"
        "-DHAVE_JPEG"
    ];

    shared_libs = ["libjpeg"];

    export_include_dirs = ["include"];

    apex_available = [
        "//apex_available:platform"
        "com.android.media.swcodec"
    ];
    min_sdk_version = "29";
};

#  compatibilty static library until all uses of libyuv_static are replaced
#  with libyuv (b/37646797)
libyuv_static = cc_library_static {
    name = "libyuv_static";
    vendor_available = true;
    whole_static_libs = ["libyuv"];
    apex_available = [
        "//apex_available:platform"
        "com.android.media.swcodec"
    ];
    min_sdk_version = "29";
};

libyuv_unittest = cc_test {
    name = "libyuv_unittest";
    static_libs = ["libyuv"];
    shared_libs = ["libjpeg"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    srcs = [
        "unit_test/unit_test.cc"
        "unit_test/basictypes_test.cc"
        "unit_test/color_test.cc"
        "unit_test/compare_test.cc"
        "unit_test/convert_test.cc"
        "unit_test/cpu_test.cc"
        "unit_test/cpu_thread_test.cc"
        "unit_test/math_test.cc"
        "unit_test/planar_test.cc"
        "unit_test/rotate_argb_test.cc"
        "unit_test/rotate_test.cc"
        "unit_test/scale_argb_test.cc"
        "unit_test/scale_test.cc"
        "unit_test/video_common_test.cc"
    ];
};

compare = cc_test {
    name = "compare";
    gtest = false;
    srcs = [
        "util/compare.cc"
    ];
    static_libs = ["libyuv"];
};

cpuid = cc_test {
    name = "cpuid";
    gtest = false;
    srcs = [
        "util/cpuid.c"
    ];
    static_libs = ["libyuv"];
};

psnr = cc_test {
    name = "psnr";
    gtest = false;
    srcs = [
        "util/psnr_main.cc"
        "util/psnr.cc"
        "util/ssim.cc"
    ];
    static_libs = ["libyuv"];
};

yuvconvert = cc_test {
    name = "yuvconvert";
    gtest = false;
    srcs = [
        "util/yuvconvert.cc"
    ];
    static_libs = ["libyuv"];
    shared_libs = ["libjpeg"];
};

in { inherit compare cpuid libyuv libyuv_static libyuv_unittest psnr yuvconvert; }
