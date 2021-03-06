{ cc_test }:
let

codec2_core_param_test = cc_test {
    name = "codec2_core_param_test";

    srcs = [
        "C2Param_test.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/codec2/vndk/include"
    ];

    header_libs = [
        "libcodec2_headers"
    ];

    #  param tests must not depend on any codec2 libraries as all params should be templated
    shared_libs = [
    ];

    static_libs = [
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

codec2_vndk_test = cc_test {
    name = "codec2_vndk_test";

    srcs = [
        "C2_test.cpp"
        "C2SampleComponent_test.cpp"
        "C2UtilTest.cpp"
        "vndk/C2BufferTest.cpp"
    ];

    include_dirs = [
    ];

    shared_libs = [
        "libcodec2"
        "libcodec2_vndk"
        "libcutils"
        "liblog"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

codec2_vndk_interface_test = cc_test {
    name = "codec2_vndk_interface_test";

    srcs = [
        "C2ComponentInterface_test.cpp"
    ];

    header_libs = [
        "media_plugin_headers"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libcodec2"
        "libcodec2_vndk"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit codec2_core_param_test codec2_vndk_interface_test codec2_vndk_test; }
