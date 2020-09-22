{ cc_defaults, cc_library_static }:
let

VtsHalMediaC2V1_0CommonUtil = cc_library_static {
    name = "VtsHalMediaC2V1_0CommonUtil";
    defaults = [
        "VtsHalTargetTestDefaults"
        "libcodec2-hidl-client-defaults"
    ];

    include_dirs = [
        "frameworks/av/media/codec2/hidl/client/include"
    ];

    srcs = [
        "media_c2_hidl_test_common.cpp"
    ];

    export_include_dirs = ["."];
};

VtsHalMediaC2V1_0Defaults = cc_defaults {
    name = "VtsHalMediaC2V1_0Defaults";
    defaults = [
        "VtsHalTargetTestDefaults"
        "libcodec2-hidl-client-defaults"
    ];

    static_libs = [
        "libgtest"
        "VtsHalMediaC2V1_0CommonUtil"
    ];

    shared_libs = [
        "libcodec2_client"
    ];
    test_suites = [
        "vts"
    ];
};

in { inherit VtsHalMediaC2V1_0CommonUtil VtsHalMediaC2V1_0Defaults; }
