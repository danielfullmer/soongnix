{ cc_test }:
let

codec2_param_test = cc_test {
    name = "codec2_param_test";

    srcs = [
        "C2Param_test.cpp"
    ];

    include_dirs = [
        "hardware/google/av/codec2/include"
        "hardware/google/av/codec2/vndk/include"
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

codec2_test = cc_test {
    name = "codec2_test";

    srcs = [
        "C2_test.cpp"
        "C2SampleComponent_test.cpp"
        "C2UtilTest.cpp"
        "vndk/C2BufferTest.cpp"
    ];

    include_dirs = [
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

codec2_interface_test = cc_test {
    name = "codec2_interface_test";

    srcs = [
        "C2ComponentInterface_test.cpp"
    ];

    include_dirs = [
        "frameworks/native/include/media/openmax"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit codec2_interface_test codec2_param_test codec2_test; }
