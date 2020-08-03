{ cc_library_static }:
let

libstagefright_mediafilter = cc_library_static {
    name = "libstagefright_mediafilter";

    srcs = [
        "ColorConvert.cpp"
        "GraphicBufferListener.cpp"
        "IntrinsicBlurFilter.cpp"
        "MediaFilter.cpp"
        "RSFilter.cpp"
        "SaturationFilter.cpp"
        "saturationARGB.rs"
        "SimpleFilter.cpp"
        "ZeroFilter.cpp"
    ];

    include_dirs = [
        "frameworks/native/include/media/openmax"
    ];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wall"
    ];

    shared_libs = [
        "libgui"
        "libmedia"
        "libhidlmemory"
    ];

    sanitize = {
        cfi = true;
    };
};

in { inherit libstagefright_mediafilter; }
