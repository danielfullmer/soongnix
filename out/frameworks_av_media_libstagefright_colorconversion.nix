{ cc_library_static }:
let

libstagefright_color_conversion = cc_library_static {
    name = "libstagefright_color_conversion";

    srcs = [
        "ColorConverter.cpp"
        "SoftwareRenderer.cpp"
    ];

    include_dirs = [
        "frameworks/native/include/media/openmax"
    ];

    shared_libs = [
        "libui"
        "libnativewindow"
    ];

    static_libs = ["libyuv_static"];

    cflags = ["-Werror"];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libstagefright_color_conversion; }
