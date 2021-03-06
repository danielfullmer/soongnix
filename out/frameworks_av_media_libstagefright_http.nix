{ cc_library_shared }:
let

libstagefright_http_support = cc_library_shared {
    name = "libstagefright_http_support";

    srcs = ["HTTPHelper.cpp"];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/native/include/media/openmax"
        "frameworks/base/core/jni"
    ];

    shared_libs = [
        "liblog"
        "libutils"
        "libandroid_runtime"
        "libmedia"
    ];

    export_include_dirs = ["."];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit libstagefright_http_support; }
