{ cc_library_static }:
let

libstagefright_webm = cc_library_static {
    name = "libstagefright_webm";

    cppflags = ["-D__STDINT_LIMITS"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    srcs = [
        "EbmlUtil.cpp"
        "WebmElement.cpp"
        "WebmFrame.cpp"
        "WebmFrameThread.cpp"
        "WebmWriter.cpp"
    ];

    include_dirs = ["frameworks/av/include"];

    shared_libs = [
        "libstagefright_foundation"
        "libutils"
        "liblog"
    ];

    header_libs = [
        "media_ndk_headers"
    ];
};

in { inherit libstagefright_webm; }
