{ cc_defaults, cc_library_static }:
let

MtsMediaC2V1_0CommonUtil = cc_library_static {
    name = "MtsMediaC2V1_0CommonUtil";
    defaults = [
        "VtsHalTargetTestDefaults"
        "libstagefright_codec2-hidl-defaults"
    ];

    include_dirs = [
        "hardware/google/av/codec2/hidl/client/include"
    ];

    srcs = [
        "media_c2_hidl_test_common.cpp"
    ];

    export_include_dirs = ["."];
};

MtsMediaC2V1_0Defaults = cc_defaults {
    name = "MtsMediaC2V1_0Defaults";
    defaults = [
        "VtsHalTargetTestDefaults"
        "libstagefright_codec2-hidl-defaults"
    ];

    static_libs = [
        "MtsMediaC2V1_0CommonUtil"
    ];

    shared_libs = [
        "libcodec2_hidl_client"
    ];
};

in { inherit MtsMediaC2V1_0CommonUtil MtsMediaC2V1_0Defaults; }
